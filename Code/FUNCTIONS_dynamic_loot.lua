--[[function Rat_GetUnitTier(unit)

    local aff_tier =
    {
        {"Legion", 1},
        {"Thugs", 2},
        {"Rebel", 2},
        {"Army", 5},
        {"Adonis", 6}
    }

    local base_tier = 1

    for _, entry in ipairs(aff_tier) do
        if unit.Affiliation == entry[1] then
            base_tier = entry[2]
            break
        end
    end

    

   
	if unit.role == "Commander" then
		base_tier = base_tier +1
	end
	
	local unit_class = tostring(unit.class)
    if string.match(unit_class, "Elite") then
        base_tier = base_tier + 2
    elseif string.match(unit_class, "Stronger") then
        base_tier = base_tier + 1
    end

    return base_tier
end

function Rat_GetWeaponTier(weapon)
	local bobby_tier = weapon.Tier* 10000
	local price = weapon.Cost * 0.5
	local weight = 100-(weapon.RestockWeight-100) /5
	print(weapon.RestockWeight)
	print("weight", weight)
	
	local tier = (bobby_tier + price)+ weight
	
	return tier or 0
end
	
	
function test_wep_tier()
	ForEachPreset("InventoryItemCompositeDef", function(p)
        local item = g_Classes[p.id]
	
        if IsKindOf(item, "Firearm") then
			if item.Tier > 1 then
				local tier = Rat_GetWeaponTier(item)
				--print(item.class, tier)
			end
		end
	end)
end	]]