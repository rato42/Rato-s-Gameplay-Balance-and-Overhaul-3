
function place_ranged_melee_CTH()
PlaceObj('ChanceToHitModifier', {
	CalcValue = function (self, attacker, target, body_part_def, action, weapon1, weapon2, lof, aim, opportunity_attack, attacker_pos, target_pos)
		if not attacker or not target then 
			return false, 0
		end
		if target.stance == "Prone" or target.stance == "Crouch" then
			return false, 0
		end
		
		if not IsKindOf(weapon1, "Firearm") then
			return false, 0
		end

		
		if not IsKindOf(target, "Unit") then
			return false, 0
		end
		
		if not target:IsAware() then
			return false, 0
		end
		
		local metaText = {}
		local value = -15
		local dist = attacker_pos:Dist(target_pos)
		local mrange = 1.5 * const.SlabSizeX
		

		if dist < mrange then
			if weapon1 and (weapon1:HasComponent("longbarrel") or weapon1.default_long_barrel) then
				value = MulDivRound(value, 140 ,100) 
				metaText[#metaText + 1] = T(924992454524, "(-) Extended Barrel")
			elseif weapon1 and weapon1:HasComponent("shortbarrel") then
				value = MulDivRound(value, 80 ,100) 
				metaText[#metaText + 1] = T(749892252984, "Short Barrel")
			end
			if IsKindOfClasses(weapon1, "Pistol", "Revolver") then
				value = MulDivRound(value, 40 ,100) 
				metaText[#metaText + 1] =T(476231976166, "Handgun")
			elseif IsKindOfClasses(weapon1, "SubmachineGun") then
				value = MulDivRound(value, 60 ,100) 
				metaText[#metaText + 1] =T(759763123531, "SMG")
			end
		else
			return false, 0
		end
		
		if value == 0 then
			return false, 0
		end
		

		
		return true, value, false, metaText
	end,
	RequireActionType = "Any Ranged Attack",
	display_name = T(351472500288, --[[ChanceToHitModifier Default RangedMeleePenal display_name]] "Firing at Melee Range"),
	group = "Default",
	id = "RangedMeleePenal",
})

end


---------------------------------------------------------------------------------------------------------

local t_id_table = {
[371165966796] = "(-) Extended Barrel",
[924992454524] = "(-) Extended Barrel",
[749892252984] = "Short Barrel",
[476231976166] = "Handgun",
[759763123531] = "SMG",
}

ratG_T_table['CTH_ranged_melee_penal.lua'] = t_id_table