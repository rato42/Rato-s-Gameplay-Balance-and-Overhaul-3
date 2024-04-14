function targeted_noburst()

	local pistol_effect = 100
    	for _, param in ipairs(Presets.ChanceToHitModifier.Default["TargetedShot"].Parameters) do
		if param.Name == 'pistol_effect' then
            		param.Value = pistol_effect
		end
	end
	
    	g_PresetParamCache[Presets.ChanceToHitModifier.Default["TargetedShot"]]['pistol_effect'] = pistol_effect

	Presets.ChanceToHitModifier.Default["TargetedShot"].CalcValue = function (self, attacker, target, body_part_def, action, weapon1, weapon2, lof, aim, opportunity_attack, attacker_pos, target_pos)
		
		-------------------------------------------------- base mod
		local mod = body_part_def and body_part_def.tohit_mod or 0	
		local metaText = {}
		
		
		mod = MulDivRound(mod, const.Combat.R_TargetedMul, 100)
		
		--print("targeted mod after option", mod)
		
		if mod == 0 then
			return false, 0 
		end
		--print("mod inicial targeted", mod)
		
		if not IsKindOfClasses(weapon1, "MeleeWeapon") then
			if action and (action.id == "AutoFire" or action.id == "PinDown") then
				mod = MulDivRound(mod,100,100)
				--metaText[#metaText + 1] = "(-) Snapshot"
			
			elseif aim < 1 then

				mod = MulDivRound(mod,125,100)
				metaText[#metaText + 1] = T(174427737737, "(-) Hipfire")
				
			elseif aim < 2 then
				mod = MulDivRound(mod,113,100)
				metaText[#metaText + 1] = T(477882742777, "(-) Snapshot")
			end
			
			
			local pb_dist = const.Weapons.PointBlankRange * const.SlabSizeX
			local target_pos = target_pos or target:GetPos()
			local attacker_pos = attacker_pos or attacker:GetPos()
			local dist = attacker_pos:Dist(target_pos)
				
			if dist <= pb_dist then
				metaText[#metaText + 1] = T(857864425672, "Point-Blank Range")
				mod = MulDivRound(mod, 75, 100)
			end
			
		end
		
		
		-------------------------------------------------
		
		
		
		
		
		
		
		
		
		
		
		if aim > 2 then
			metaText[#metaText + 1] = T(212531647496, "Fully Aimed")
			local sniper_bonus = -12
			local pistol_bonus = -6
			local revolver_bonus = -8
			local bolt_action_bonus = -9
			local pindown_bonus = -12
			local scope_bonus = -20
			local uv_bonus = -8
			local other_bonus = -5
			local effect = -20--self:ResolveValue("pistol_effect")
			
			-- local extra_penalty = 20
			
			-- if action.id == "SingleShot" then
				-- extra_penalty = 0
				-- scope_bonus = -50
				-- metaText[#metaText + 1] = "Single Shot"
			-- elseif action.id == "PinDown" then
				-- extra_penalty = 0
				-- scope_bonus = -50
			-- end
			
			-- effect = effect + extra_penalty
			
			--print("1st effect targeted", effect)
			if IsKindOfClasses(weapon1, "SniperRifle") then
				effect = effect + sniper_bonus
				metaText[#metaText + 1] = T(857733955586, "Precision Rifle")
				if weapon1:HasComponent("boltaction") then
					effect = effect + bolt_action_bonus
					metaText[#metaText + 1] = T(218674787672, "Bolt Action")
				end
			-- elseif IsKindOfClasses(weapon1, "Revolver") then
				-- effect = effect + revolver_bonus
				-- metaText[#metaText + 1] = T(918311487575, "Revolver")
			-- elseif IsKindOfClasses(weapon1, "Pistol") then
				-- effect = effect + pistol_bonus
				-- metaText[#metaText + 1] = T(264354311888, "Pistol")
			else
				effect = effect + other_bonus
			end
			
			if action.id == "PinDown" then
				effect = effect + pindown_bonus
				metaText[#metaText + 1] = T(428585172563, "Pin Down")
			end
			
			if weapon1 and weapon1:HasComponent("bodypart_scope") and aim > 3 then
				if (action.id == "SingleShot" or action.id == "PinDown") then
				else
					--print("not single shot HF scope")
					scope_bonus = MulDivRound(scope_bonus, 50,100)
					--print("scope bonus burst", scope_bonus)
				end
				
				effect = effect + scope_bonus
				metaText[#metaText + 1] = T(999212395918, "Hensoldt ZF Scope")
			end
			
			if weapon1 and weapon1:HasComponent("body_part_uv") then
				effect = effect + uv_bonus
				metaText[#metaText + 1] = T(378613427576, "UV Dot")
			end
			
			--print("targeted effect", effect)
			
			local mrks = attacker.Marksmanship 
			local wis = attacker.Wisdom 
			-- local percep = MulDivRound(wis+mrks, 1, 2)
			-- local multipl = 0
			-- if percep > 85 then
				-- multipl = (percep*3-200)
				-- metaText[#metaText + 1] = "High Composure"
			-- elseif percep > 59 then
				-- multipl = ((percep)*2-114)
				-- metaText[#metaText + 1] = "Average Composure"
			-- else
				-- multipl = 0
				-- metaText[#metaText + 1] = "Low Composure"
			-- end


			-- local scaling = (100-effect)*0.01*multipl
			-- local final = 100-scaling
			
			local comp = Min(100,cRound(mrks*0.65 + wis*0.35))--/2.0
			local min_compo = 50.0
			local max_compo = 100.0
			local min_scale = const.Combat.R_MinTargetedScaling/100.0
			local max_scale = const.Combat.R_MaxTargetedScaling/100.0

			local scale_factor = min_scale + (max_scale - min_scale) * (comp - min_compo) / (max_compo - min_compo)
			
			if scale_factor < min_scale then
				scale_factor = min_scale
			elseif scale_factor > max_scale then
				scale_factor = max_scale
			end

			--print("scale factor targeted", scale_factor)
			
			if comp < 70 then
				metaText[#metaText + 1] = T(679732547244, "(-) Low Composure")
			elseif comp > 84 then
				metaText[#metaText + 1] = T(482879968829, "High Composure")
			else
				metaText[#metaText + 1] = T(182873197996, "Average Composure")
			end




			if action.id == "SingleShot" or action.id == "PinDown"   then
				metaText[#metaText + 1] = T(669475852649, "Single Shot")
			else
				scale_factor = scale_factor * 0.6
				
			end

			


			local final = (effect * scale_factor) +100.0
			
			-- print("final targeted", final)
	

			
			-- print("mod targeted", mod)
			
			mod = Min(-1,MulDivRound(mod, final, 100))
			return mod ~= 0, mod, T{357357827656, "<display_name> Shot", body_part_def}, metaText
		else
			return mod ~= 0, mod, T{357357827656, "<display_name> Shot", body_part_def}, metaText
		end
		
	end
end




---------------------------------------------------------------------------------------------------------

local t_id_table = {
[174427737737] = "(-) Hipfire",
[477882742777] = "(-) Snapshot",
[857864425672] = "Point-Blank Range",
[212531647496] = "Fully Aimed",
[857733955586] = "Precision Rifle",
[218674787672] = "Bolt Action",
[918311487575] = "Revolver",
[264354311888] = "Pistol",
[428585172563] = "Pin Down",
[999212395918] = "Hensoldt ZF Scope",
[378613427576] = "UV Dot",
[679732547244] = "(-) Low Composure",
[482879968829] = "High Composure",
[182873197996] = "Average Composure",
[669475852649] = "Single Shot",
}

ratG_T_table['CTH_targeted_noburst.lua'] = t_id_table