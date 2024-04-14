function GetHipfirePenal(weapon, attacker, action, display, aim)

			local penalty = 1.00
			local weapon1 = weapon
			
			local side = attacker and attacker.team and attacker.team.side or ''

			local metaText = {}
			
	
			if IsKindOf(weapon, "MeleeWeapon") then
				return 0.85
			end
	
			local base_mul = 0.90
			
					------------Weaponclass
					
			if aim == 0 then
				
				base_mul = (weapon.wep_base_hip_mul or 100)/100.00
				
				if IsKindOfClasses(weapon1, "SubmachineGun") then
					penalty = 1.20
					
				elseif IsKindOfClasses(weapon1,"Pistol") then
					penalty = 1.45
					
				elseif IsKindOfClasses(weapon1,"Revolver") then
					penalty = 1.38
				elseif IsKindOfClasses(weapon1,"SniperRifle") then
					penalty = 1.00

				elseif IsKindOfClasses(weapon1,"AssaultRifle") then
					penalty = 1.00
					
				elseif IsKindOfClasses(weapon1,"MachineGun") then
					penalty = 1.00
				elseif IsKindOfClasses(weapon1,"Shotgun") then
					penalty = 1.05
					
				end
			
			elseif aim > 0 then
			
				base_mul = (weapon.wep_base_snapshot_mul or 100)/100.00
			
				if IsKindOfClasses(weapon1, "SubmachineGun") then
					penalty = 0.85
					
				elseif IsKindOfClasses(weapon1,"Pistol") then
					penalty = 0.60
					
				elseif IsKindOfClasses(weapon1,"Revolver") then
					penalty = 0.60
					
				elseif IsKindOfClasses(weapon1,"SniperRifle") then
					penalty = 1.35

				elseif IsKindOfClasses(weapon1,"AssaultRifle") then
					penalty = 1.25
					
				elseif IsKindOfClasses(weapon1,"MachineGun") then
					penalty = 1.35
				elseif IsKindOfClasses(weapon1,"Shotgun") then
					penalty = 1.15
					
				end
			
			end
			
			
			
			
			
			penalty = penalty * base_mul
			
			
			if weapon1 and weapon1:HasComponent("hipfire_dot_effect_laser") then
				penalty = penalty * 0.85
				metaText[#metaText + 1] = T(626578482223, "Laser Dot")
			end
			
			if weapon1 and weapon1:HasComponent("hipfire_dot_effect_uv") then
				penalty = penalty * 0.85
				metaText[#metaText + 1] = T(887956959968, "UV Dot")
			end
			

			local w1, weapon2
			
			if attacker then
				w1, weapon2 = attacker:GetActiveWeapons()
			end
			

			

			
			if weapon1 and weapon1:HasComponent("Vert_grip_recoil") then
					if weapon2 then
					else
						penalty = penalty * 0.92
						metaText[#metaText + 1] = T(253436571742, "Vertical Grip")
					end
			end
			
			if weapon1 and weapon1:HasComponent("tac_grip_hipfire") then
					if weapon2 then
					else
						penalty = penalty * 0.88
						metaText[#metaText + 1] = T(646775269862, "Foldable Grip")
					end
			end
			

			

			
			if weapon1 and weapon1:HasComponent("hipfire_light_stock") then
					penalty = penalty * 0.9
					metaText[#metaText + 1] = T(729651784671, "Light Stock")
			end
			
			
			
			if not (side == 'player1' or side == 'player2') then
				if attacker then
					penalty = AIpenal_reduc(attacker,penalty)
				end
				-- if action and action.id == "AutoFire" then
					-- aim = 1
				-- end
				
			end
			
			local modifyVal, compDef
			
			if aim == 0 then ------so p hipfire
			
				if weapon1 and weapon1:HasComponent("handguard_short") then
					modifyVal, compDef = GetComponentEffectValue(weapon1, "handguard_short", "hipfire_mul")
					local sign = "(-) "
					if modifyVal and modifyVal < 100 then
						sign = ""
					end
					penalty = penalty * (modifyVal/100.00 or 1.00)
					metaText[#metaText + 1] = sign .. compDef.DisplayName
				end
				
				
				if weapon1 and weapon1:HasComponent("bullpup") then
					penalty = penalty * 1.08
					metaText[#metaText + 1] = T(486687677418, "(-) Bullpup")
				end
	
				if (weapon1 and weapon1:HasComponent("longbarrel")) or (weapon1 and weapon.default_long_barrel) then
					if IsKindOf(weapon1, "Pistol") or weapon1.pistol_swap then
						penalty = penalty * 0.94
					elseif IsKindOf(weapon1, "Revolver") then
						penalty = penalty * 0.92
					else
						penalty = penalty * 0.89
					end
					metaText[#metaText + 1] = T(596547733965, "Extended Barrel")
				end
			
			
				if weapon1 and weapon1:HasComponent("shortbarrel") then
					
					
					if IsKindOf(weapon1, "Pistol") or weapon1.pistol_swap then
						penalty = penalty * 1.06
					elseif IsKindOf(weapon1, "Revolver") then
						penalty = penalty * 1.08
					else
						penalty = penalty * 1.11
					end
					
					
					metaText[#metaText + 1] = T(851834144682, "(-) Short Barrel")
				end
	
	
	
				if attacker and attacker.stance == "Prone" then
					penalty = penalty * 1.10
					metaText[#metaText + 1] = T(828597839679, "(-) Prone")
				elseif attacker and attacker.stance == "Crouch" then
					penalty = penalty * 1.05
					metaText[#metaText + 1] = T(254262498254, "(-) Crouching")
				end
				
			elseif aim > 0 then
			
				if weapon1 and weapon1:HasComponent("handguard_short") then
					modifyVal, compDef = GetComponentEffectValue(weapon1, "handguard_short", "snapshot_mul")
					local sign = "(-) "
					if modifyVal and modifyVal < 100 then
						sign = ""
					end
					penalty = penalty * (modifyVal/100.00 or 1.00)
					metaText[#metaText + 1] = sign .. compDef.DisplayName
				end
			
			
				if weapon1 and weapon1:HasComponent("drum_mag_hipfire") then
					penalty = penalty * 1.1
					metaText[#metaText + 1] = T(916663762238, "(-) Drum Mag")
				end
				
				if weapon1 and weapon1:HasComponent("hipfire_no_stock") then

					penalty = penalty * 0.85
					metaText[#metaText + 1] = T(569535264469, "No Stock")
				
				end
			
				local modifyVal, compDef = GetComponentEffectValue(weapon1, "scope_snapshot", "snap_reduc")
				if modifyVal then
					local reduc = (100.0 - modifyVal)/100
					--print("before snap", weapon_ref)
					penalty = penalty * reduc
					--print("after snap", weapon_ref)
					metaText[#metaText + 1] = compDef.DisplayName
				end
			
				if weapon1 and weapon1:HasComponent("bullpup") then
					penalty = penalty * 0.95
					metaText[#metaText + 1] = T(633298768714, "Bullpup")
				end
			
				if (weapon1 and weapon1:HasComponent("longbarrel")) or (weapon1 and weapon.default_long_barrel) then
				
					if IsKindOf(weapon1, "Pistol") or weapon1.pistol_swap then
						penalty = penalty * 1.06
					elseif IsKindOf(weapon1, "Revolver") then
						penalty = penalty * 1.08
					else
						penalty = penalty * 1.11
					end
					metaText[#metaText + 1] = T(224584566951, "(-) Extended Barrel")
				end
			
			
				if weapon1 and weapon1:HasComponent("shortbarrel") then
				
					if IsKindOf(weapon1, "Pistol") or weapon1.pistol_swap then
						penalty = penalty * 0.94
					elseif IsKindOf(weapon1, "Revolver") then
						penalty = penalty * 0.92
					else
						penalty = penalty * 0.89
					end
					
					metaText[#metaText + 1] = T(119591314866, "Short Barrel")
				end
			
				if weapon1 and weapon1:HasComponent("hipfire_light_barrel") then
					penalty = penalty * 0.89
					metaText[#metaText + 1] = T(447116472426, "Light Barrel")
				end
				
				if weapon1 and weapon1:HasComponent("heavy_barrel_effect") then
					penalty = penalty * 1.11
					metaText[#metaText + 1] = T(481487998456, "(-) Heavy Barrel")
				end
			
			end
			
		if action and (action.id == "RunAndGun" or action.id == "RecklessAssault") then
			penalty = penalty * 1.85
		end
		if action and action.id == "MobileShot" then
			penalty = penalty * 1.65
		end
			
			

			
			
		if display == true then
			return penalty
		else
			return penalty, metaText
		end
		
		
	end



---------------------------------------------------------------------------------------------------------

local t_id_table = {
[626578482223] = "Laser Dot",
[887956959968] = "UV Dot",
[253436571742] = "Vertical Grip",
[646775269862] = "Foldable Grip",
[729651784671] = "Light Stock",
[486687677418] = "(-) Bullpup",
[596547733965] = "Extended Barrel",
[851834144682] = "(-) Short Barrel",
[828597839679] = "(-) Prone",
[254262498254] = "(-) Crouching",
[916663762238] = "(-) Drum Mag",
[569535264469] = "No Stock",
[633298768714] = "Bullpup",
[224584566951] = "(-) Extended Barrel",
[119591314866] = "Short Barrel",
[447116472426] = "Light Barrel",
[481487998456] = "(-) Heavy Barrel",
}

ratG_T_table['FUNCTIONS_hipfire.lua'] = t_id_table