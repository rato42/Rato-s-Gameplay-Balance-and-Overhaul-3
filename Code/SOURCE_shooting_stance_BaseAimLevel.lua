
-----Unit.lua

function Unit:GetBaseAimLevelRange(action, target)
  if not action.IsAimableAttack then
    return 0, 0
  end
  local actionWep = action:GetAttackWeapons(self)
  local min, max = 0, 0
  if IsKindOfClasses(actionWep, "Firearm", "MeleeWeapon") then
    max = actionWep.MaxAimActions
  end
  if 0 < max then
    max = self:CallReactions_Modify("OnCalcMaxAimActions", max, self, target, action, actionWep)
    if IsKindOf(target, "Unit") then
      max = target:CallReactions_Modify("OnCalcMaxAimActions", max, self, target, action, actionWep)
    end
    min = self:CallReactions_Modify("OnCalcMinAimActions", min, self, target, action, actionWep)
    if IsKindOf(target, "Unit") then
      min = target:CallReactions_Modify("OnCalcMinAimActions", min, self, target, action, actionWep)
    end
    max = Max(max, min)
    if IsKindOf(actionWep, "Firearm") then
		--------------------------------------------------------------
	  if action.id == "DualShot" then
		max = 1
	  end
	  if action.id == "AutoFire" then
		max = 1
	  end
	  if action.id == "GrizzlyPerk" then
		max = 1
	  end
	 
	  if self.Mobile_aimed then
		--print("uyes")
		min = 1
	  end
	  
	  -- if HasPerk(self, "shooting_stance") then	
		-- print("Aim +1 stance")
		-- min = Max(min, 1)
	  -- end
		--------------------------------------------------------------
		--    removed in 1.4 
      --[[if actionWep:HasComponent("MinAim") then
        min = Max(min, GetComponentEffectValue(actionWep, "MinAim", "min_aim"))
      end
      local startedCombat = g_Combat and g_Combat.current_turn == 1 and IsKindOf(g_AttackSpentAPQueue[1], "Unit") and g_AttackSpentAPQueue[1].session_id == self.session_id
      local firstShotBoost = not self.performed_action_this_turn and not startedCombat and not IsOverwatchAction(action.id) and GetComponentEffectValue(actionWep, "FirstShotIncreasedAim", "min_aim")
      if firstShotBoost then
        max = Max(max, firstShotBoost)
        min = Min(max, firstShotBoost)
      end]] 
    end
  end
  return min, max
end

---ok