function Unit:GetApExtra(unit, target, weapon, aim, action, param)
	if not IsKindOf(weapon, "Firearm") then
		return 0
	end
	
	if not g_Combat or g_StartingCombat or g_TestingSaveLoadSystem then
		return 0
	end
	-- if action and action.id == "AutoFire" then
		-- return 0
	-- end
	
	local attacker = unit
	
	local side = attacker and attacker.team and attacker.team.side or ''
	

	
		---------------Already in Stance
	local stance = false
	if HasPerk(unit, "ManningEmplacement") then
		stance = true
	elseif HasPerk(unit, "StationedMachineGun") then
		stance = true
	elseif HasPerk(unit, "shooting_stance") then
		stance = true
	end
	
		
	
	local ap_stance = GetWeapon_StanceAP(unit, weapon)--weapon.APStance * const.Scale.AP
	--print(ap_stance)-----------shooter stance
	local ap_hipfire = 0
	--local stance_ap_mod = 0 * const.Scale.AP
	

	-- if not (side == 'player1' or side == 'player2') then
		-- ap_stance = MulDivRound(ap_stance, 40, 100)
		-- if ap_stance < 1 * const.Scale.AP then
		-- ap_stance = 1 * const.Scale.AP
		-- return ap_stance
	-- end
	
	if aim < 1 and not (target == unit:GetLastAttack()) or not target then
		ap_hipfire = GetHipfire_StanceAP(unit, weapon)
	end
	
	
	-- if stance == true then
		-- stance_ap_mod = 0 * const.Scale.AP
	-- end
	
	-- if IsKindOfClasses(weapon, "SubmachineGun") then
		-- ap_stance = 3 * const.Scale.AP
	-- elseif IsKindOfClasses(weapon,"Pistol") then
		-- ap_stance = 1 * const.Scale.AP
	-- elseif IsKindOfClasses(weapon,"Revolver") then
	
		-- ap_stance = 1 * const.Scale.AP
	-- end



	
	--------------Hipfire
	--[[if aim < 1 then
		ap_hipfire = 0 * const.Scale.AP -------------hipfire
	end
	
	
	
	
	
	if IsKindOfClasses(weapon,"Pistol") then
		ap_hipfire = 0 * const.Scale.AP
	elseif IsKindOfClasses(weapon,"Revolver") then
		ap_hipfire = 0 * const.Scale.AP
	end]]
	

		------------Rotate
	local ap_rotate 
	local param_angle
	
	if param == "get_enemies" then
		param_angle = "get_enemies"
	end
	
	if HasPerk(unit, "shooting_stance") then
		ap_rotate = Clamp(ShootingConeAngle(self, attacker, weapon, target, param_angle)* const.Scale.AP, 0,ap_stance + Get_AimCost()) 
	else
		ap_rotate = 0
	end
	if g_Overwatch[attacker] then
		local overwatch = g_Overwatch[attacker] or false 
		
		if overwatch.permanent then
			ap_rotate = 0
		end
	end
	
	local ap_extra = ap_rotate --+ stance_ap_mod -------------stance shots effects
	
	
	

	
	
	-- if param == "AP_mod" then
		-- return stance_ap_mod
	-- end
	
	if param == "rotate" then
		return ap_rotate
	end
	
	if param == "stance" then
		return ap_stance
	end
	
	
	-- if action.id == "Overwatch" then 
		-- if stance == false then
			-- return ap_stance
		-- else
			-- return 0
		-- end
	-- end
	
	
	-- if not (side == 'player1' or side == 'player2') then
		-- ap_extra = MulDivRound(ap_extra,50,100) 
		-- ap_stance = MulDivRound(ap_extra,50,100) 
		
		
	-- end
	
	ap_hipfire = ap_hipfire or 0
	if stance == true then
		return ap_extra
	elseif stance == false and aim < 1 then
		return ap_hipfire
	elseif stance == false and aim > 0 then
		return ap_stance
	end
	
	-- ap_extra = ap_stance + ap_hipfire + ap_rotate -- + ap_inside 
	-- return ap_extra
end



