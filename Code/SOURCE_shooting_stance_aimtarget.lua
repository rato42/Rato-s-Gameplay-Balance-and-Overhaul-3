function Unit:AimTarget(attack_args, attack_results, prepare_to_attack)
	if self:HasStatusEffect("ManningEmplacement") then
		if self:GetStateText() ~= "hmg_Crouch_Idle" then
			self:SetState("hmg_Crouch_Idle", const.eKeepComponentTargets, 0)
		end
		return
	end
	
	------------
	local aim_rotate_cooldown_times = {
	Standing = 250,
	Crouch = 500,
	Prone = 700,
	}
	-------------------------
	
	if not attack_args then
		return
	end
	local action_id = attack_args.action_id
	local action = CombatActions[action_id]
	local weapon = action and action:GetAttackWeapons(self)
	local prepared_attack = attack_args.opportunity_attack_type == "PinDown" or attack_args.opportunity_attack_type == "Overwatch"
	local lof_idx = table.find(attack_args.lof, "target_spot_group", attack_args.target_spot_group or "Torso")
	local lof_data = attack_args.lof and attack_args.lof[lof_idx or 1] or attack_args
	local aim_pos = lof_data.lof_pos2
	local trajectory = attack_results and attack_results.trajectory
	if trajectory and #trajectory > 1 then
		local p1 = trajectory[1].pos
		local p2 = trajectory[2].pos
		if p1 ~= p2 then
			aim_pos = p1 + SetLen(p2 - p1, 10*guim)
		end
	end
	aim_pos = aim_pos or attack_args.target

	if attack_args.OverwatchAction and lof_data.lof_pos1 then
		if self.ground_orient then
			local axis = self:GetAxis()
			local angle = self:GetAngle()
			local p1 = RotateAxis(lof_data.lof_pos1, axis, -angle)
			local p2 = RotateAxis(aim_pos, axis, -angle)
			
			aim_pos = RotateAxis(p2:SetZ(p1:z()), axis, angle)
			

		else
			
			aim_pos = aim_pos:SetZ(lof_data.lof_pos1:z())
			
		end
		-------------
		self.ow_args_stance = attack_args
		--------------
	end
	
	
	local rotate_to_target = prepare_to_attack or IsValid(attack_args.target) and IsKindOf(attack_args.target, "Unit")
	local aimIK = rotate_to_target and self:CanAimIK(weapon)
	local stance = rotate_to_target and attack_args.stance or self.stance
	local quick_play = not GameTimeAdvanced or self:CanQuickPlayInCombat() 
	local idle_aiming, rotate_cooldown_disable

	if action_id == "MeleeAttack" then
		idle_aiming = true
	elseif not rotate_to_target and self.stance == "Prone" and attack_args.stance ~= "Prone" then
		idle_aiming = true
	elseif not rotate_to_target and aimIK and abs(self:AngleToPoint(aim_pos)) > 50*60 then
		if self.last_idle_aiming_time then
			if GameTime() - self.last_idle_aiming_time > config.IdleAimingDelay then
				idle_aiming = true
			end
		else
			self.last_idle_aiming_time = GameTime()
		end
	else
		self.last_idle_aiming_time = false
	end

	local aim_anim
	if idle_aiming then
		local base_idle = self:GetIdleBaseAnim(stance)
		if not IsAnimVariant(self:GetStateText(), base_idle) then
		

			if self.stance == "Prone" then
				-- first rotate
				local visual_stance = string.match(self:GetStateText(), "^%a+_(%a+)_")
				
				if visual_stance == "Standing" or visual_stance == "Crouch" then
					local angle = self:GetPosOrientation()
					if quick_play then
						self:SetOrientationAngle(angle)
					else
						self:AnimatedRotation(angle, self:GetIdleBaseAnim(visual_stance))
					end
				end
				self:SetFootPlant(true)
			end

			
			
			
			if not quick_play then
				PlayTransitionAnims(self, base_idle)
			end
			self:SetRandomAnim(base_idle)
			rotate_cooldown_disable = true
		end
		self:SetIK("AimIK", false)
		aimIK = false
		aim_anim = self:GetStateText()
	else
		if (stance == "Standing" or stance == "Crouch") and self.stance == "Prone" then
			local cur_anim = self:GetStateText()
			if string.match(cur_anim, "%a+_(%a+).*") == "Prone" then
				self:SetFootPlant(true, nil, stance)
				if not quick_play then
					local base_idle = self:GetIdleBaseAnim(stance)
					local angle = lof_data.angle or CalcOrientation(lof_data.step_pos, aim_pos)
					PlayTransitionAnims(self, base_idle, angle)
				end
			end
		end
		self:AttachActionWeapon(action)
		aim_anim = self:GetAimAnim(action_id, stance)
	end

	if quick_play then
		if not self.return_pos and not IsCloser2D(self, lof_data.step_pos, const.SlabSizeX/2) and not attack_args.circular_overwatch then
			self.return_pos = GetPassSlab(self)
		end
		self:SetPos(lof_data.step_pos)
		self:SetOrientationAngle(lof_data.angle or CalcOrientation(lof_data.step_pos, aim_pos))
		
		if self:GetStateText() ~= aim_anim then
			self:SetState(aim_anim, const.eKeepComponentTargets, 0)
		end
		self:SetFootPlant(true)
		if aimIK then
			self:SetIK("AimIK", aim_pos, nil, nil, 0)
		else
			self:SetIK("AimIK", false)
		end
		return
	end

	self:SetIK("LookAtIK", false)
	self:SetFootPlant(true, nil, stance)

	if rotate_to_target then
		local prefix = string.match(aim_anim, "^(%a+_).*") or self:GetWeaponAnimPrefix()

		while true do
			-- enter step pos
			while not IsCloser2D(self, lof_data.step_pos, const.SlabSizeX/2) do
				local dummy_angle
				if lof_data.step_pos:Dist2D(self.return_pos or self) == 0 then
					dummy_angle = CalcOrientation(self.return_pos, aim_pos)
				else
					dummy_angle = CalcOrientation(self.return_pos or self, lof_data.step_pos)
				end
				if self:ReturnToCover(prefix) then
					-- some time passed, check if the lof_data.step_pos position has been changed
				else
					-- behind a cover. place the unit to the left or right of the cover.
					---------------------------------------------
					--if not HasPerk(self,"shooting_stance") then
					-----------------------------------------
						local angle = CalcOrientation(self, lof_data.step_pos)
						local rotate = abs(AngleDiff(angle, self:GetVisualOrientationAngle())) > 90*60
						self:SetIK("AimIK", false)
						if rotate then
							self:AnimatedRotation(angle, aim_anim)
						end
						if not rotate or self.command ~= "AimIdle" then
							local step_to_target = CalcOrientation(lof_data.step_pos, aim_pos)
							local cover_side = AngleDiff(step_to_target, angle) < 0 and "Left" or "Right"
							local anim = string.format("%s%s_Aim_Start", prefix, cover_side)
							if not self.return_pos and not attack_args.circular_overwatch then
								self.return_pos = GetPassSlab(self)
							end
							if IsValidAnim(self, anim) then
								anim = self:ModifyWeaponAnim(anim)
								self:SetPos(lof_data.step_pos, self:GetAnimDuration(anim))
								self:RotateAnim(step_to_target, anim)
							else
								local msg = string.format('Missing animation "%s" for "%s"', anim, self.unitdatadef_id)
								StoreErrorSource(self, msg)
								self:SetState(aim_anim, const.eKeepComponentTargets)
								self:SetAngle(step_to_target, 500)
								Sleep(500)
							end
						end
					-----------	
					--end
					-----------
				end
				-- update aiming position (the cursor position could be changed)
				if self.command ~= "AimIdle" then
					if not IsCloser2D(self, lof_data.step_pos, const.SlabSizeX/2) then
						return
					end
					break
				end
				if not self.aim_action_id then
					return
				end
				attack_args, attack_results = self:GetAimResults()
				lof_idx = table.find(attack_args.lof, "target_spot_group", attack_args.target_spot_group or "Torso")
				lof_data = attack_args.lof and attack_args.lof[lof_idx or 1] or attack_args
				aim_pos = lof_data.lof_pos2 or attack_args.target
				if attack_results and attack_results.trajectory then
					local p1 = attack_results.trajectory[1].pos
					local p2 = attack_results.trajectory[2].pos
					aim_pos = p1 + SetLen(p2 - p1, 10*guim)
				end
			end
			
			if weapon then
				self:SetAimFX(weapon:GetVisualObj(self))
			end

			local angle = CalcOrientation(self, aim_pos)
			local start_angle = self:GetVisualOrientationAngle()
			local angle_diff = AngleDiff(angle, start_angle)
			------------------------------------------ modification
			-- if stance == "Prone" then
				-- if prepared_attack and not attack_args.circular_overwatch then
					-- angle = start_angle
				--else
					-- if abs(angle_diff) <= 60*60 then
						-- angle = start_angle
					-- else
						-- angle = FindProneAngle(self, nil, angle, 60*60)
					-- end
				-- end
			-- end
			
			--------------------------------------
			-- play transition animations to target anim
			local played_anims = PlayTransitionAnims(self, aim_anim, angle)
			if played_anims and self.command == "AimIdle" then
				break
			end
			if self.command ~= "AimIdle" then
				if not attack_args.opportunity_attack or abs(AngleDiff(angle, start_angle)) > 45*60 then
					self:AnimatedRotation(angle, aim_anim)
				end
				break
			end
			-- rotate left or right
			if abs(AngleDiff(angle, self:GetOrientationAngle())) < 1*60 then
				break
			end
			local max_deviation_angle = 45*60
			if abs(angle_diff) < max_deviation_angle and not (prepare_to_attack and prepared_attack) then
				self.aim_rotate_last_angle = false
				break
			end
			if not rotate_cooldown_disable then
				if not self.aim_rotate_last_angle or abs(AngleDiff(angle, self.aim_rotate_last_angle)) > max_deviation_angle then
					self.aim_rotate_last_angle = angle
					self.aim_rotate_cooldown_time = GameTime() + (aim_rotate_cooldown_times[stance] or 1000)
					break
				end
				if GameTime() - self.aim_rotate_cooldown_time < 0 then
					break
				end
			end
			self.aim_rotate_last_angle = false
			self.aim_rotate_cooldown_time = false
			local rotate_anim = self:GetRotateAnim(angle_diff, aim_anim)
			if not IsValidAnim(self, rotate_anim) then
				self:IdleRotation(angle)
				break
			end
			self:SetIK("AimIK", false)
			rotate_anim = self:ModifyWeaponAnim(rotate_anim)
			---------------------- Modification
			if not self:HasStatusEffect("shooting_stance") then ------will not change orientation
			-----------------------
			
				if abs(angle_diff) > 150*60 then
					self:Rotate180(angle, rotate_anim)
				else
					self:SetState(rotate_anim, const.eKeepComponentTargets, Presets.ConstDef.Animation.BlendTimeRotateOnSpot.value)
					local anim_rotation_angle = self:GetStepAngle()
					local duration = self:TimeToAnimEnd()
					local rotation_deviation = 45*60
					local steps = 1 + duration / 20
					for i = 1, steps do
						local a = start_angle + i * angle_diff / steps
						local t = duration * i / steps - duration * (i - 1) / steps
						self:SetOrientationAngle(a, t)
						Sleep(t)
					end
				end

				self:SetState(aim_anim, const.eKeepComponentTargets)
				
				if aimIK then
					self:SetIK("AimIK", aim_pos)
				end
			----------
			end
			-----------------------

		end
	end

	local cur_anim = self:GetStateText()
	if cur_anim ~= aim_anim then
		self:SetState(aim_anim, const.eKeepComponentTargets)
	end
	if aimIK then
		
		if not self.aim_rotate_cooldown_time or GameTime() - self.aim_rotate_cooldown_time >= 0 then
			self:SetIK("AimIK", aim_pos)
		end
	else
		self:SetIK("AimIK", false)
	end

end



--ok