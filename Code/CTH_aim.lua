function aim_cth()
	local MinBonus = 2
	local MinDex = 60
	local DexScale = 5
	
	for _, param in ipairs(Presets.ChanceToHitModifier.Default["Aim"].Parameters) do
		if param.Name == 'MinBonus' then
            param.Value = MinBonus
        end
		if param.Name == 'MinDex' then
            param.Value = MinDex
        end
		if param.Name == 'DexScale' then
            param.Value = DexScale
		end
    end
	--
    g_PresetParamCache[Presets.ChanceToHitModifier.Default["Aim"]]['MinBonus'] = MinBonus
    g_PresetParamCache[Presets.ChanceToHitModifier.Default["Aim"]]['MinDex'] = MinDex
    g_PresetParamCache[Presets.ChanceToHitModifier.Default["Aim"]]['DexScale'] = DexScale

	
	
	
	Presets.ChanceToHitModifier.Default["Aim"].CalcValue = function (self, attacker, target, body_part_def, action, weapon1, weapon2, lof, aim, opportunity_attack, attacker_pos, target_pos)
		
		if not weapon1 then
			return false, 0
		end
		
		local num = aim
		local min_bonus = self:ResolveValue("MinBonus")
		--local min_dex = self:ResolveValue("MinDex")
		--local dex_scale = self:ResolveValue("DexScale")
		
		--------------
		local min_dex = 50.0
		local max_dex = 100.0
		local min_scale = const.Combat.R_MinAimScaling/100.0
		local max_scale = const.Combat.R_MaxAimScaling/100.0
		--------------		
		
		local metaText = {}
		
		local dex_at = attacker.Dexterity 
		local mrks = attacker.Marksmanship
		local total = (dex_at + mrks)/2.00
		local dex = dex_at
		if IsKindOf(weapon1, "Firearm") then
			dex = total
			if dex < 70 then
				metaText[#metaText + 1] = T{436284795734, "(-) Low Hand-Eye Coordination"}
			elseif dex >84 then           
				metaText[#metaText + 1] = T{766168183242, "High Hand-Eye Coordination"}
			else                          
				metaText[#metaText + 1] = T{711417533297, "Average Hand-Eye Coordination"}
			end                           
		else                              
			if dex < 70 then              
				metaText[#metaText + 1] = T{623752994574, "(-) Low Dexterity"}
			elseif dex >84 then           
				metaText[#metaText + 1] = T{236157356911, "High Dexterity"}
			else                          
				metaText[#metaText + 1] = T{646282444522, "Average Dexterity"}
			end                           
		end
		
	--------------	

---
		if IsKindOfClasses(weapon1, "FirearmProperties", "MeleeWeaponProperties") then
			min_bonus = weapon1.AimAccuracy
			--print(min_bonus)
		end
		
		--print("min bonus aim", min_bonus)
		
		local w1, w2 = attacker:GetActiveWeapons()
		local min_bonus2
		
		if action and action.id == "DualShot" then
			min_bonus2 = w2.AimAccuracy
				--print("min2", min_bonus2)
		end
		
		
		
		-- if weapon1 and weapon1:HasComponent("Vert_grip_recoil") then
			-- if w2 then
				-- if min_bonus > 1 then
					-- min_bonus = min_bonus -1
				-- end
			-- end
		-- end
		
		-- if w2 and w2:HasComponent("Vert_grip_recoil") then

				-- if min_bonus2 and min_bonus2 > 1 then
					-- min_bonus2 = min_bonus2 -1
				-- end

		-- end
		
		if IsKindOf(weapon1, "Pistol") or IsKindOf(weapon1, "Revolver") then 
			min_bonus = min_bonus *0.5
			
			metaText[#metaText + 1] = T{195655494642, "(-) Handgun"}
		end
		
		if w2 and min_bonus2 then
			if IsKindOf(w2, "Pistol") or IsKindOf(w2, "Revolver") then 
				min_bonus2 = min_bonus2 *0.5
			end
		end
			
		
		
		local mobile_mul = 1.0
		if action and (action.id == "RunAndGun" or action.id == "RecklessAssault" or action.id == "MobileShot") then
			-- if attacker.Mobile_aimed then
				-- num = 1
			-- end
			mobile_mul = 0.5
		end
		
		
		--print("min_bonus before scope", min_bonus)
		if num >= 2 and weapon1:HasComponent("pso_dragunov_scope") then
			local placeholder, componentdef = GetComponentEffectValue(weapon1, "pso_dragunov_scope")
			local scope_bonus = min_bonus * 0.01
			
			min_bonus = min_bonus + scope_bonus
			--print("scope bonus", scope_bonus * num)
			metaText[#metaText + 1] = componentdef.DisplayName--T(231236431718, "PSO-1 Scope 4x")
		end
		if num >= 3 and weapon1:HasComponent("sniper_aim_scope") then
			local scope_bonus = min_bonus * 0.1 + 0.7
			
			min_bonus = min_bonus + scope_bonus
			--print("scope bonus", scope_bonus * num)
			metaText[#metaText + 1] = T{886112546215, "Sniper Scope 4x"}
		end
		
		if num >= 4 and weapon1:HasComponent("sniper_adv_aim_scope") then
			local scope_bonus = (min_bonus * 0.05) +0.3
			
			min_bonus = min_bonus + scope_bonus
			--print("scope bonus", scope_bonus * num)
			metaText[#metaText + 1] = T{739262593826, "Sniper Scope 6x"}
		end
		
		--print("min_bonus after scope", min_bonus)
		
		
		if w2 and min_bonus2 then
			min_bonus = (min_bonus + min_bonus2)/2.0
			--min_bonus = MulDivRound(min_bonus,1,2)
			--print("bonus final", min_bonus)
		end
		
		
		-- if action and action.id == "AutoFire" and HasPerk(attacker, "shooting_stance") then
			-- num = 1
		-- end
		
		--print("AIM:" num)
		if opportunity_attack and HasPerk(attacker, "shooting_stance") then
			num = 1
			
		end
		
		
			

		-- if action and action.id == "PinDown" then
			-- local ap = attacker.ActionPoints - attacker.free_move_ap
			-- local at_cost = attacker:GetAttackAPCost(self, weapon1, false, args and args.aim or 0, self.ActionPointDelta) -1000
			-- local max_aim = weapon1.MaxAimActions
				-- local aimCost = const.Scale.AP
					-- if GameState.RainHeavy then
					-- aimCost = MulDivRound(aimCost, 100 + const.EnvEffects.RainAimingMultiplier, 100)
				-- end
			-- local toaim = (ap - at_cost)/aimCost
			-- num = toaim
			--num = Max(max_aim((ap - at_cost) / aimCost))
			-- print(ap)
			-- print(at_cost)
			-- print(max_aim)
			-- print(aimCost)
		-- end
		
		
		
		local modifyVal, compDef
		
		
		-- if IsKindOf(weapon1, "Firearm") then
			-- if attacker.stance == "Crouch" then
				-- min_bonus = min_bonus + 1
				-- metaText[#metaText + 1] = T(819917646978, "Crouching")
			-- elseif attacker.stance == "Prone" then
				-- min_bonus = min_bonus + 1
				-- metaText[#metaText + 1] = T(981953836167, "Prone")
			-- end
		-- end

		
				

		
		
		-- Light Stock
		-- modifyVal, compDef = GetComponentEffectValue(weapon1, "ReduceAimAccuracy", "cth_penalty")
		-- if modifyVal then
			-- min_bonus = Max(1, MulDivRound(min_bonus, 100 - modifyVal, 100))
			-- metaText[#metaText + 1] = compDef.DisplayName
		-- end
		

		
		local scale_factor = min_scale + (max_scale - min_scale) * (dex - min_dex) / (max_dex - min_dex)
		if scale_factor < min_scale then
			scale_factor = min_scale
		elseif scale_factor > max_scale then
			scale_factor = max_scale
		end

		-- Apply the scaled bonus to the original calculation
		local bonus = num * min_bonus
		
		
		
		--local bonus = num * min_bonus + MulDivRound(Max(0, dex - min_dex) * num, dex_scale, 100)
		

		-- Forward Grip
		modifyVal, compDef = GetComponentEffectValue(weapon1, "FirstAimBonusModifier", "first_aim_bonus")
		if modifyVal then
			bonus = bonus + (min_bonus*0.3)+2.1
			metaText[#metaText + 1] = compDef.DisplayName
		end
		
		

		-- Improved Sight
		modifyVal, compDef = GetComponentEffectValue(weapon1, "AccuracyBonusWhenAimed", "bonus_cth")
		if modifyVal then
			bonus = bonus + modifyVal
			metaText[#metaText + 1] = compDef.DisplayName
		end
		
		modifyVal, compDef = GetComponentEffectValue(weapon1, "AccuracyBonusWhenAimed_vgrip", "bonus_cth_v")
		if modifyVal and not w2 then
			--print("vgrip bonus aim", modifyVal)
			bonus = bonus + modifyVal
			metaText[#metaText + 1] = compDef.DisplayName
		end
	
	
		---------------------------------------
		local target_pos = target_pos or target:GetPos()
		local pb_dist = const.Weapons.PointBlankRange * const.SlabSizeX
		local dist = attacker_pos:Dist(target_pos)
		
		local close_range = rat_close_range()
		if dist <= close_range then
			modifyVal, compDef = GetComponentEffectValue(weapon1, "reflex_sight_close_range", "Close_bonus")
			if modifyVal then
				bonus = bonus + modifyVal
				--print("rs bonus", modifyVal)
				metaText[#metaText + 1] = T(888825974784, "Close Range")--compDef.DisplayName
			end
		end
		
		
		
		
		-----------------------------------

		
		-----------
		--print("original min bonus =", bonus)

		--print(const.Combat.R_AimMul)
		--local mod_option = const.Combat.R_AimMul/100
		
		
		
		modifyVal, compDef = GetComponentEffectValue(weapon1, "ReduceAimAccuracy", "cth_penalty")
		if modifyVal then
			bonus = bonus * 0.5--Max(1, MulDivRound(bonus, 100 - modifyVal, 100))
			metaText[#metaText + 1] = compDef.DisplayName
		end
		

		
		if weapon1:HasComponent("light_stock_aim_reduce") then
			bonus = bonus * 0.85 --Max(1, MulDivRound(min_bonus, 80, 100))
			metaText[#metaText + 1] = T(899433651477, "(-) Light Stock")
		end
		

		-- target camo
		if IsKindOf(target, "Unit") then
			local armor = target:GetItemInSlot("Torso", "Armor")
			if armor and armor.Camouflage then
				bonus = bonus * Max(0, 100 - const.Combat.CamoAimPenalty)/100.0 --MulDivRound(bonus, Max(0, 100 - const.Combat.CamoAimPenalty), 100)
				metaText[#metaText + 1] = T(396692757033, "Camouflaged - aiming is less effective")
			end
		end
		
		
		
		--print("aim bonus befor crouch", bonus)
		if IsKindOf(weapon1, "Firearm") then
			if attacker.stance == "Crouch" then
				bonus = bonus * 105.0/100.0
				metaText[#metaText + 1] = T{688848752517, "Crouching"}
			elseif attacker.stance == "Prone" then
				bonus = bonus*110.0/100.0
				metaText[#metaText + 1] = T{271472323596, "Prone"}
				
				if weapon1:HasComponent("grip_prone_penalty") then
					local placeholder, componentdef = GetComponentEffectValue(weapon1, "grip_prone_penalty")
					bonus = bonus *92/110
					local meta = T{676119455163, "(-) " .. componentdef.DisplayName}
					metaText[#metaText + 1] = meta
				end
			end
		end
		
		--print("aim bonus", bonus)
		
		-------- multiply if mobile attack, mul is set in the beggining of the function
		bonus = bonus * mobile_mul 
		--------
		
		
		if opportunity_attack then
			--print("opportunity_attack, aim cth")
			bonus = bonus * 0.5
		end
		
		if IsKindOf(weapon1, "MeleeWeapon") then
			bonus = bonus *0.5
		end
		
						-- Heavy Stock
		if IsFullyAimedAttack(num) then
			modifyVal, compDef = GetComponentEffectValue(weapon1, "BonusAccuracyWhenFullyAimed", "bonus_cth")
			if modifyVal then
				bonus = bonus + modifyVal
				metaText[#metaText + 1] = compDef.DisplayName
			end
		end

		
		
		
		bonus = cRound(bonus * scale_factor* const.Combat.R_AimMul/100)
		

		--print("Dex+Marks/2=", dex,"scaling factor=", scale_factor, "scaled bonus =", bonus)
		------------

		

		if num > 0 and bonus < 1 then
			bonus = num
		end

		--print("aim",num, bonus)
		--print("aim bonus after heavystock", bonus)
		-- if action.id == "AutoFire" then 
			-- print("autofire aim num", num, "bonus =", bonus)
		-- end
		return num > 0, bonus,  T{762331260877, "Aiming (x<aim_mod>)", aim_mod = num}, #metaText ~= 0 and metaText
	end
end





---------------------------------------------------------------------------------------------------------

local t_id_table = {
[231236431718] = "PSO-1 Scope 4x",
[819917646978] = "Crouching",
[981953836167] = "Prone",
[888825974784] = "Close Range",
[899433651477] = "(-) Light Stock",
[396692757033] = "Camouflaged - aiming is less effective",
[436284795734] = "(-) Low Hand-Eye Coordination",
[766168183242] = "High Hand-Eye Coordination",
[711417533297] = "Average Hand-Eye Coordination",
[623752994574] = "(-) Low Dexterity",
[236157356911] = "High Dexterity",
[646282444522] = "Average Dexterity",
[195655494642] = "(-) Handgun",
[886112546215] = "Sniper Scope 4x",
[739262593826] = "Sniper Scope 6x",
[688848752517] = "Crouching",
[271472323596] = "Prone",
}

ratG_T_table['CTH_aim.lua'] = t_id_table