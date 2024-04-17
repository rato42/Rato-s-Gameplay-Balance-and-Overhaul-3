
function two_weaponcth()

	Presets.ChanceToHitModifier.Default["TwoWeaponFire"].CalcValue = function (self, attacker, target, body_part_def, action, weapon1, weapon2, lof, aim, opportunity_attack, attacker_pos, target_pos)	
		if action.id ~= "DualShot" then
			return false, 0
		end

		
		
		local stock = 0
		local stock2 = 0
		
		local metaText = {}
		if IsKindOfClasses(weapon1,"Pistol") then
			stock = 0
		elseif IsKindOfClasses(weapon1,"Revolver") then
			stock = 0
		else
			if weapon1:HasComponent("stocklight_effect_recoil") then
				stock =  -10
				metaText[#metaText + 1] = T(964814359257, "(-) Light Stock")
			elseif weapon1:HasComponent("stockheavy_effect_recoil") then
				stock =  -20
				metaText[#metaText + 1] = T(568746261156, "(-) Heavy Stock")
			elseif not weapon1:HasComponent("no_stock") then
				stock = -15
				metaText[#metaText + 1] = T(685483767375, "(-) Stock")
			end
		end
		
		
		local dex = attacker.Dexterity
			
			local min = 75
			local max = 135
			local dex_s = max - (max - min)* dex/100
			
			
			if dex <= 50 then
				metaText[#metaText + 1] = T(917162239848, "(-) Low Dexterity")
			
			elseif dex >= 80 then
				metaText[#metaText + 1] = T(953894252836, "High Dexterity")
			else 
				metaText[#metaText + 1] = T(963186684392, "Dexterity")
			end
		
		if IsKindOfClasses(weapon2,"Pistol") then
			stock2 = 0
		elseif IsKindOfClasses(weapon2,"Revolver") then
			stock2 = 0
		else
			if weapon2:HasComponent("stocklight_effect_recoil") then
				stock2 =  -10
				metaText[#metaText + 1] = T(177827914987, "(-) Light Stock")
			elseif weapon2:HasComponent("stockheavy_effect_recoil") then
				stock2 =  -20
				metaText[#metaText + 1] = T(868281494766, "(-) Heavy Stock")
			elseif not weapon2:HasComponent("no_stock") then
				stock2 = -15
				metaText[#metaText + 1] = T(523694927116, "(-) Stock")
			end
		end
		
		
		local dist = attacker:GetDist(target)
		local max_dist = 22 * const.SlabSizeX
		local max_penal = -78
		local value = Min(0, MulDivRound(dist, max_penal, max_dist))
		--local value = self:ResolveValue("Penalty") 
		--print("2w first value", value)
		value = MulDivRound(value, dex_s, 100)
		--print("2w dx value", value)
		if HasPerk(attacker, "Ambidextrous") then
			value = MulDivRound(value, 90, 100)

			--print("2w perk value", value)
			metaText[#metaText + 1] = T(951997386335, "Perk: Ambidextrous")
		end
		--print("2w  value", value)
		if IsKindOf(weapon1, "TexRevolver") then
			value = MulDivRound(value, 85, 100)
			metaText[#metaText + 1] = T(934969441824, "Tex's Revolver")
		end
		
		
		value = value + stock + stock2

		
		return true, value, T(626951965997, "Two Weapon Fire"), #metaText ~= 0 and metaText

	end
end



---------------------------------------------------------------------------------------------------------

local t_id_table = {
[964814359257] = "(-) Light Stock",
[568746261156] = "(-) Heavy Stock",
[685483767375] = "(-) Stock",
[917162239848] = "(-) Low Dexterity",
[953894252836] = "High Dexterity",
[963186684392] = "Dexterity",
[177827914987] = "(-) Light Stock",
[868281494766] = "(-) Heavy Stock",
[523694927116] = "(-) Stock",
[951997386335] = "Perk: Ambidextrous",
[934969441824] = "Tex's Revolver",
[626951965997] = "Two Weapon Fire",
}

ratG_T_table['CTH_2weaponfire.lua'] = t_id_table


