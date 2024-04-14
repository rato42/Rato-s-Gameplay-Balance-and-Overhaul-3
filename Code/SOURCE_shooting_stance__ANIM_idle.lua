----Unit.lua

function Unit:Idle()
  assert(self:IsValidPos())
  --NetUpdateHash("sync loading state", GameState.sync_loading)
  SetCombatActionState(self, nil)
  self.being_interacted_with = false
  if not self.move_attack_in_progress then
    self.move_attack_target = nil
  end
  self:SetQueuedAction()
  ExplorationClearExclusiveAction(self)
  if self:IsDead() then
    if self.behavior == "Despawn" then
      self:SetCommand("Despawn")
    elseif self.behavior ~= "Hang" and self.behavior ~= "Dead" then
      self:SetBehavior("Dead")
      self:SetCombatBehavior("Dead")
    end
  else
    if self.stance == "Prone" and self:GetValidStance("Prone") ~= "Prone" then
      self:DoChangeStance("Crouch")
    end
    if g_Combat and self:CanCower() and (self.team.side == "neutral" or self:HasStatusEffect("ForceCower")) and not g_Combat:ShouldEndCombat() then
      self:SetCommand("Cower")
    end
  end
  self:UpdateInWaterFX()
  if self:IsDead() then
    if self.behavior == "Hang" then
      self:SetCommand("Hang")
    else
      self:SetCommand("Dead")
    end
  end
  FallDownCheck(self)
  if self:HasStatusEffect("Unconscious") then
    self:SetCommand("Downed")
  elseif IsSetpieceActor(self) then
    self:SetCommand("SetpieceIdle", true)
  elseif self:HasStatusEffect("Suspicious") then
    if g_Combat then
      self:RemoveStatusEffect("Suspicious")
    else
      return self:SuspiciousRoutine()
    end
  elseif self:HasCommandsInQueue() then
    return
  elseif g_Combat and self.combat_behavior then
    self:SetCommand(self.combat_behavior, table.unpack(self.combat_behavior_params or empty_table))
  elseif not g_Combat and self.behavior and not self:HasStatusEffect("Suspicious") then
    local enemy = self:GetCommandParam("idle_forcing_dist")
    if not IsValid(enemy) or not self:IdleForcingDist(enemy) then
      self:SetCommandParamValue(self.command, "idle_forcing_dist", nil)
      self:SetCommand(self.behavior, table.unpack(self.behavior_params or empty_table))
    end
  end
  local anim_style = self:GetIdleStyle()
  local base_idle = anim_style and anim_style:GetMainAnim() or self:GetIdleBaseAnim()
  local can_reposition = not g_Combat or not self:IsAware()
  local pos, orientation_angle
  if self.return_pos and not self.play_sequential_actions then
    pos = self.return_pos
    local voxel = SnapToVoxel(self)
    if not pos:Equal2D(voxel) then
      orientation_angle = CalcOrientation(pos, voxel)
    end
  else
    pos = GetPassSlab(self) or self:GetPos()
  end
  local dummy_orientation_angle = self:GetPosOrientation(pos, nil, self.stance, true, can_reposition)
  orientation_angle = orientation_angle or self.auto_face and dummy_orientation_angle or self:GetPosOrientation(pos, nil, self.stance, false, can_reposition)
  self:SetTargetDummy(pos, dummy_orientation_angle, base_idle, 0)
  if g_Combat and (not self:IsNPC() or self:IsAware()) then
    Msg("Idle", self)
  end
  -----------------------------------
  --if self.aim_action_id and not HasCombatActionInProgress(self) then 
  if self.aim_action_id and not HasCombatActionInProgress(self) and not (self:HasStatusEffect("shooting_stance")) then
  ----------------------------------
    self:SetCommand("AimIdle")
  end
  self:SetWeaponLightFx(false)
  self:SetIK("AimIK", false)
  if self.play_sequential_actions then
    self:SetCommand("SequentialActionsIdle")
  end
  --if GameState.sync_loading then
  if not GameTimeAdvanced then
  	-------------------Modification
		if not self:HasStatusEffect("shooting_stance") then
		--------^^
			self:SetOrientationAngle(orientation_angle)
		------------
		end
	----------------^^
  else
    self:EndInterruptableMovement()
    self:PlayTransitionAnims(base_idle, orientation_angle)
	  ---------------------------------------------------Modification
		if not self:HasStatusEffect("shooting_stance") then
		------------------	^^
			self:AnimatedRotation(orientation_angle, base_idle)	
		-----------------
		end
	  -------------------------------------------------^^
    self:BeginInterruptableMovement()
  end
  self:SetCommandParamValue("Idle", "move_anim", "WalkSlow")
  if self:ShouldBeIdle() then
    self.cur_idle_style = anim_style and anim_style.Name or nil
    if anim_style then
      local anim = self:GetStateText()
      if anim_style:HasAnimation(anim) then
        if self:GetAnimPhase() ~= 0 and not self:IsAnimEnd() then
          Sleep(self:TimeToAnimEnd())
        end
      elseif anim == anim_style.Start then
        Sleep(self:TimeToAnimEnd())
      elseif (anim_style.Start or "") ~= "" and IsValidAnim(self, anim_style.Start) then
        self:SetState(anim_style.Start, const.eKeepComponentTargets)
        Sleep(self:TimeToAnimEnd())
      end
      self:SetState(anim_style:GetRandomAnim(self), const.eKeepComponentTargets)
      --if GameState.sync_loading then
	  if not GameTimeAdvanced then
        self:RandomizeAnimPhase()
      end
    elseif self:GetAnimPhase(1) == 0 or self:IsAnimEnd() or not IsAnimVariant(self:GetStateText(), base_idle) then
      self:SetRandomAnim(base_idle, const.eKeepComponentTargets, nil, true)
    end
    Sleep(self:TimeToAnimEnd())
  else
    self:IdleRoutine()
  end
end


---ok