function place_p_recoil_cth()
PlaceObj('ChanceToHitModifier', {
    CalcValue = function(self, attacker, target, body_part_def, action, weapon1, weapon2, lof, aim, opportunity_attack, attacker_pos, target_pos)
		if true then 
			return false, 0
		end
		if not target or not attacker or not weapon1 then
			return false,0
		end
		
		if not IsKindOf(weapon1, "Firearm") then
			return false, 0
		end
		
		
		local effect = attacker:GetStatusEffect("Rat_recoil")
		
		if not effect then
			return false, 0
		end
		
		local target_pos = attack_target:GetPos() or false
		local aim = aim or 0 
		local stacks = effect.stacks
		
		local penalty, metaText = get_recoil(attacker, attack_target, target_pos, action, weapon1, aim, false, stacks)
	
	
		 
		local name = T{effect.DisplayName .. " (x" .. stacks.. ")"} 
	

           
		
		
		if penalty > -1 then
			return false, 0
		end
		
		
		
		return true, penalty , name,  #metaText ~= 0 and metaText
        

    end,
    RequireTarget = true,
    display_name = T(318366251222, "Recoil"),
    group = "Default",
    id = "persistent_recoil",
})

end



--[[if target == attacker then
	local target_pos = attack_target:GetPos() or false
	local aim = data.aim or 0
	local stacks = self.stacks
	print("stacks",stacks)
	local recoil = get_recoil(attacker, attack_target, target_pos, action, weapon1, aim, false, stacks)
	
	
	local recoil_cth = {id = "recoil_persistent", name = T{self.DisplayName .. " (x" .. stacks.. ")"}, value = recoil}
	table.insert(data.modifiers, recoil_cth)
	data.mod_add = data.mod_add + recoil
	print("d", data)
	--ApplyCthModifier_Add(self .. "X" .. stacks, data, recoil)
end]]


---------------------------------------------------------------------------------------------------------

local t_id_table = {
[318366251222] = "Recoil",
}

ratG_T_table['CTH_persistent_recoil.lua'] = t_id_table