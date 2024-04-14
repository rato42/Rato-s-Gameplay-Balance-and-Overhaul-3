function ShootingStance(self, target, attack_args)
    
	
	--print(attack_args)
	
	--ShootingStance(self, action, target, results, attack_args, ow)

	-- if ow then
		-- local attack_args = self.ow_args
	-- end
	
	--print(g_Combat)
	
	local aim, weapon, target
	
	
	local args = attack_args or false
	if args then
		aim = args.aim
		weapon = args.weapon
		target = args.target
	else
		aim = 0
		weapon = self:GetActiveWeapons()
		target = self:GetLastAttack()
	end
	
	if not weapon then
		return
	end
	
	local target_pos = IsValid(target) and target:GetPos() or target

	-- local lof_idx = table.find(attack_args.lof, "target_spot_group", attack_args.target_spot_group or "Torso")
	-- local lof_data = attack_args.lof and attack_args.lof[lof_idx or 1] or attack_args

	
	-- local aim_pos = lof_data.lof_pos2

	local aim_pos = target_pos --aim_pos or attack_args.target
	
	-- if lof_data.lof_pos1 then
		-- aim_pos = aim_pos:SetZ(lof_data.lof_pos1:z())
	-- end
	
	if aim_pos then
		self.aim_pos_stance = aim_pos
	end
	
	

	if self.return_pos then
		self.return_pos_reserved = self.return_pos
		self.return_pos = false
	end
	

	if IsKindOf(weapon, "BrowningM2HMG") then
		self:AddStatusEffect("shooting_stance")
		return
	end
	
	
	if not self:HasStatusEffect("shooting_stance") then
		self:AddStatusEffect("shooting_stance")
	end
	
		
	local aim_state = self:GetStateText()
	
	-- local attacker_pos = self:GetPos()
	
	
	-- local angle = CalcOrientation(attacker_pos, aim_pos)
	-- print("angle", angle)
	-- self:SetOrientationAngle(angle)
	-- self:SetState(aim_state, const.eKeepComponentTargets)
	
	
	CreateStanceConeV(self, weapon)
	
end



function ShootingConeAngle(self, attacker, weapon, target, param)
			-- local debu = true
			-- if debu then
				-- return 0
			-- end
			

			-- local side = attacker and attacker.team and attacker.team.side or ''
			
			-- local attack_action = false
			
			-- if not (side == 'player1' or side == 'player2') then
				-- attack_action = true
			-- end
			
			
			
			-- attack_action = true
			
			
			-- if param == "get_enemies" then
				-- attack_action = true
			-- end
			
			
			-- if not attack_action == true then
				-- return 0
			-- end
		
			local cone_angle = weapon.OverwatchAngle/2
			--local walkable = true
			local target_pos = IsValid(target) and target:GetPos()
			if Is_AimingAttack() then 
				target_pos = IsValid(target) and target:GetPos() or GetCursorPos(true)--:SetZ(attacker_z)
			end
			
			if not target_pos then
				return 0
			end
			local target_angle = abs(attacker:AngleToPoint(target_pos))

			local angle_dif = target_angle/cone_angle

			
			if weapon and weapon:HasComponent("rotate_ap_bipod") then
				if attacker.stance == "Prone" then
					if angle_dif >= 1 then
						angle_dif = angle_dif +1
					end
				end
			end

			return angle_dif
				
		
		
end


function CreateStanceConeV(self, weapon)
	--print("creating stance cone")
	

	local pos = self:GetPos()
	local angle = self:GetAngle()
	local weapon = weapon or self:GetActiveWeapons()
	
	if weapon then
      local min_aim_range = weapon:GetOverwatchConeParam("MinRange") * const.SlabSizeX
      local max_aim_range = weapon:GetOverwatchConeParam("MaxRange") * const.SlabSizeX
      self.properties = table.copy(g_Classes[self.class].properties)
      local idx = table.find(self.properties, "id", "target_dist")
      if idx then
        self.properties[idx] = {
          category = "Emplacement",
          id = "target_dist",
          name = "Target Distance",
          editor = "number",
          scale = "m",
          min = min_aim_range,
          max = max_aim_range,
          default = max_aim_range,----min_aim_range,
          slider = min_aim_range < max_aim_range,
          read_only = min_aim_range == max_aim_range
        }
        self:SetProperty("target_dist", min_aim_range)
      end
    else
      self.properties = nil
      local meta = self:GetPropertyMetadata("target_dist")
      self:SetProperty("target_dist", meta.default)
    end
	
	local cone_angle = weapon.OverwatchAngle
	
    local min_aim_range = weapon:GetOverwatchConeParam("MinRange") * const.SlabSizeX

    local max_aim_range = weapon:GetOverwatchConeParam("MaxRange") * const.SlabSizeX
    local distance = max_aim_range*1.5 --Clamp(self.target_dist, min_aim_range, max_aim_range)
    self.target_dist = distance
    local target = pos + Rotate(point(distance, 0, 0), angle) 
	---------------
    local step_positions, step_objs = GetStepPositionsInArea(pos, distance, 0, cone_angle, angle, "force2d")
	

	

    step_objs = empty_table
	
	
    self.shooter_cone_v = CreateAOETilesSector_Shooter(step_positions, step_objs, empty_table, self.shooter_cone_v, pos, target, 1 * guim, distance, cone_angle, "Overwatch4_Deployed_Ally")
   local side = self and self.team and self.team.side or ''
	self.shooter_cone_v:SetOpacity(100)
	
	
	------------------

	------------------------------
	
	

	


	
	cone_angle =  cone_angle*2
	
	
	
	if weapon then
      local min_aim_range = weapon:GetOverwatchConeParam("MinRange") * const.SlabSizeX
      local max_aim_range = weapon:GetOverwatchConeParam("MaxRange") * const.SlabSizeX
      self.properties = table.copy(g_Classes[self.class].properties)
      local idx = table.find(self.properties, "id", "target_dist")
      if idx then
        self.properties[idx] = {
          category = "Emplacement",
          id = "target_dist",
          name = "Target Distance",
          editor = "number",
          scale = "m",
          min = min_aim_range,
          max = max_aim_range,
          default = max_aim_range,----min_aim_range,
          slider = min_aim_range < max_aim_range,
          read_only = min_aim_range == max_aim_range
        }
        self:SetProperty("target_dist", min_aim_range)
      end
    else
      self.properties = nil
      local meta = self:GetPropertyMetadata("target_dist")
      self:SetProperty("target_dist", meta.default)
    end
	
	
	
    local min_aim_range = weapon:GetOverwatchConeParam("MinRange") * const.SlabSizeX

    local max_aim_range = weapon:GetOverwatchConeParam("MaxRange") * const.SlabSizeX
    local distance = max_aim_range*1.5 --Clamp(self.target_dist, min_aim_range, max_aim_range)
    self.target_dist = distance
    local target = pos + Rotate(point(distance, 0, 0), angle) 
	---------------
    local step_positions, step_objs = GetStepPositionsInArea(pos, distance, 0, cone_angle, angle, "force2d")
	
    step_objs = empty_table
	
	self.snap_cone = CreateAOETilesSector_Snap(step_positions, step_objs, empty_table, self.snap_cone, pos, target, 1 * guim, distance, cone_angle, "Overwatch4_Deployed_Ally")
	
	self.snap_cone:SetOpacity(100)
	if not (side == 'player1' or side == 'player2') then	
		--Sleep(1000)
		self.snap_cone:SetOpacity(0)
		self.shooter_cone_v:SetOpacity(0)
	else
	
		self.snap_cone:SetOpacity(100)
		self.shooter_cone_v:SetOpacity(100)
	end
	----------------------------------
	
end


-- local lAoEGetAimPoint = function(obj, pt, start_pos)
  -- if not pt:IsValidZ() then
    -- pt = pt:SetTerrainZ()
  -- end
  -- if not start_pos:IsValidZ() then
    -- start_pos = start_pos:SetTerrainZ()
  -- end
  -- local min_range = const.SlabSizeX / 2
  -- if IsCloser2D(start_pos, pt, min_range) then
    -- pt = RotateRadius(min_range, obj:GetAngle(), start_pos)
  -- end
  -- return pt
-- end

-- local SetAreaMovementAvatarVisibile = function(dialog, blackboard, visible, time)
  -- if not IsValidThread(dialog.real_time_threads.MovementAvatarVisibilityUpdate) then
    -- dialog:CreateThread("MovementAvatarVisibilityUpdate", VisUpdateThread, blackboard)
  -- end
  -- if visible == blackboard.move_avatar_visible then
    -- return
  -- end
  -- blackboard.move_avatar_visible = visible
  -- Wakeup(dialog.real_time_threads.MovementAvatarVisibilityUpdate)
-- end

-- function Targeting_AOE_Cone(dialog, blackboard, command, pt)
  -- pt = GetCursorPos("walkableFlag")
  -- local attacker = dialog.attacker
  -- local action = dialog.action
  -- if not blackboard.firing_mode_action then
    -- if action.group == "FiringModeMetaAction" then
      -- action = GetUnitDefaultFiringModeActionFromMetaAction(attacker, action)
    -- end
    -- blackboard.firing_mode_action = action
  -- end
  -- action = action.group == "FiringModeMetaAction" and blackboard.firing_mode_action or action
  -- if action.IsTargetableAttack and not dialog.context.free_aim then
    -- blackboard.gamepad_aim = false
    -- return Targeting_AOE_Cone_TargetRequired(dialog, blackboard, command, pt)
  -- end
  -- if dialog:PlayerActionPending(attacker) then
    -- command = "delete"
  -- end
  -- if command == "delete" then
    -- if blackboard.mesh then
      -- if IsActivePaused() and dialog.action and dialog.action.ActivePauseBehavior == "queue" and attacker.queued_action_id == dialog.action.id then
        -- attacker.queued_action_visual = blackboard.mesh
      -- else
        -- DoneObject(blackboard.mesh)
      -- end
      -- blackboard.mesh = false
    -- end
    -- if blackboard.movement_avatar then
      -- UpdateMovementAvatar(dialog, point20, nil, "delete")
    -- end
    -- UnlockCamera("AOE-Gamepad")
    -- SetAPIndicator(false, "free-aim")
    -- ClearDamagePrediction()
    -- return
  -- end
  -- local shouldGamepadAim = GetUIStyleGamepad()
  -- local wasGamepadAim = blackboard.gamepad_aim
  -- if shouldGamepadAim ~= wasGamepadAim then
    -- if shouldGamepadAim then
      -- LockCamera("AOE-Gamepad")
      -- SnapCameraToObj(attacker, "force")
    -- else
      -- UnlockCamera("AOE-Gamepad")
    -- end
    -- blackboard.gamepad_aim = shouldGamepadAim
  -- end
  -- local weapon = action:GetAttackWeapons(attacker)
  -- local aoe_params = action:GetAimParams(attacker, weapon) or weapon and weapon:GetAreaAttackParams(action.id, attacker)
  -- if not aoe_params then
    -- return
  -- end
  -- local min_aim_range = aoe_params.min_range * const.SlabSizeX
  -- local max_aim_range = aoe_params.max_range * const.SlabSizeX
  -- local lof_params = {
    -- weapon = weapon,
    -- step_pos = dialog.move_step_position or attacker:GetOccupiedPos(),
    -- prediction = true
  -- }
  -- local attack_data = attacker:ResolveAttackParams(action.id, pt, lof_params)
  -- local attacker_pos3D = attack_data.step_pos
  -- if not attacker_pos3D:IsValidZ() then
    -- attacker_pos3D = attacker_pos3D:SetTerrainZ()
  -- end
  -- if not blackboard.movement_avatar then
    -- UpdateMovementAvatar(dialog, point20, nil, "setup")
    -- UpdateMovementAvatar(dialog, point20, nil, "update_weapon")
    -- blackboard.movement_avatar:SetVisible(false)
    -- blackboard.move_avatar_visible = false
    -- blackboard.move_avatar_time = RealTime()
  -- end
  -- if not IsCloser(attacker, attack_data.step_pos, const.SlabSizeX / 2 + 1) then
    -- UpdateMovementAvatar(dialog, attack_data.step_pos, false, "update_pos")
    -- local aim_anim = attacker:GetAimAnim(attack_data.action_id, attack_data.stance)
    -- blackboard.movement_avatar:SetState(aim_anim, 0, 0)
    -- blackboard.movement_avatar:Face(pt)
    -- SetAreaMovementAvatarVisibile(dialog, blackboard, true, AreaTargetMoveAvatarVisibilityDelay)
  -- elseif blackboard.movement_avatar then
    -- SetAreaMovementAvatarVisibile(dialog, blackboard, false, AreaTargetMoveAvatarVisibilityDelay)
  -- end
  -- if blackboard.gamepad_aim then
    -- local currentLength = blackboard.gamepad_aim_length
    -- currentLength = currentLength or max_aim_range
    -- local gamepadState = GetActiveGamepadState()
    -- local ptRight = gamepadState.RightThumb
    -- if ptRight ~= point20 then
      -- local up = ptRight:y() < -1
      -- currentLength = currentLength + 500 * (up and -1 or 1)
      -- currentLength = Clamp(currentLength, min_aim_range, max_aim_range)
      -- blackboard.gamepad_aim_length = currentLength
    -- end
    -- local ptLeft = gamepadState.LeftThumb
    -- if ptLeft == point20 then
      -- if blackboard.gamepad_aim_last_pos then
        -- ptLeft = blackboard.gamepad_aim_last_pos
      -- else
        -- local p1 = attacker:GetPos()
        -- local p2 = p1 + Rotate(point(5 * guim, 0), attacker:GetAngle())
        -- local s1 = select(2, GameToScreen(p1))
        -- local s2 = select(2, GameToScreen(p2))
        -- local angle = CalcOrientation(s1, s2)
        -- ptLeft = Rotate(point(guim, 0), -angle)
      -- end
    -- end
    -- blackboard.gamepad_aim_last_pos = ptLeft
    -- ptLeft = ptLeft:SetY(-ptLeft:y())
    -- ptLeft = Normalize(ptLeft)
    -- local cameraDirection = point(camera.GetDirection():xy())
    -- local directionAngle = atan(cameraDirection:y(), cameraDirection:x())
    -- directionAngle = directionAngle + 5400
    -- ptLeft = RotateAxis(ptLeft, axis_z, directionAngle)
    -- pt = attacker:GetPos() + SetLen(ptLeft, currentLength)
    -- local zoom = Lerp(800, hr.CameraTacMaxZoom * 10, currentLength, max_aim_range)
    -- cameraTac.SetZoom(zoom, 50)
  -- end
  -- local moved = dialog.target_as_pos ~= pt or blackboard.attacker_pos ~= attack_data.step_pos
  -- moved = moved or dialog.target_as_pos and dialog.target_as_pos:Dist(pt) > 8 * guim
  -- if not moved then
    -- return
  -- end
  -- local attacker_pos = attack_data.step_pos
  -- blackboard.attacker_pos = attacker_pos
  -- local aim_pt = lAoEGetAimPoint(attacker, pt, attacker_pos3D)
  -- dialog.target_as_pos = aim_pt
  -- local attack_distance = Clamp(attacker_pos3D:Dist(aim_pt), min_aim_range, max_aim_range)
  -- local args = {
    -- target = aim_pt,
    -- distance = attack_distance,
    -- step_pos = dialog.move_step_position
  -- }
  -- ApplyDamagePrediction(attacker, action, args)
  -- dialog:AttackerAimAnimation(pt)
  -- local cone2d = action.id == "Overwatch" or action.id == "DanceForMe" or action.id == "MGSetup" or action.id == "PrepareWeapon"
  -- local cone_target = cone2d and CalcOrientation(attacker_pos, aim_pt) or aim_pt
  -- local stance = action.id == "MGSetup" and "Prone" or attacker.stance
  -- local step_positions, step_objs, los_values
  -- if action.id == "EyesOnTheBack" then
    -- step_positions, step_objs, los_values = GetAOETiles(attacker_pos, stance, attack_distance)
    -- blackboard.mesh = CreateAOETilesCircle(step_positions, step_objs, blackboard.mesh, attacker_pos3D, attack_distance, los_values)
  -- else
    -- step_positions, step_objs, los_values = GetAOETiles(attacker_pos, stance, attack_distance, aoe_params.cone_angle, cone_target, "force2d")
    -- blackboard.mesh = CreateAOETilesSector(step_positions, step_objs, los_values, blackboard.mesh, attacker_pos3D, aim_pt, guim, attack_distance, aoe_params.cone_angle, false, aoe_params.falloff_start)
  -- end
  -- blackboard.mesh:SetColorFromTextStyle("WeaponAOE")
-- end