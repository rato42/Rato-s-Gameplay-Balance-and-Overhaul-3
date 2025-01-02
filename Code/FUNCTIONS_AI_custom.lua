function OnMsg.UnitEnterCombat(unit)
    local side = unit and unit.team and unit.team.side or ''

    if not (side == 'player1' or side == 'player2') and not HasPerk(unit, "Spiritual") then
        -- unit:AddStatusEffect("Spiritual") 
        -- unit.spiritual_added = 1
    end

    if (side == 'player1' or side == 'player2') and HasPerk(unit, "Spiritual") then
        if unit.spiritual and unit.spiritual_added == 1 then
            unit:RemoveStatusEffect("Spiritual")
            unit.spiritual_added = 0
        end
    end
end

function AIpenal_reduc(attacker, value, cth_id, persistant_recoil)
    local level = attacker:GetLevel()
    if attacker.Affiliation == "Adonis" then
        level = level + 2
    elseif attacker.Affiliation == "Army" then
        level = level + 1
    end

    local reduction = 1
    if cth_id == "Recoil" and not persistant_recoil then
        reduction = 1.00 - ((0.01 + (0.01 * level)) * (const.Combat.R_AIReduc / 100.00) or 1.00)
    else
        reduction = 1.00 - ((0.01 + (0.03 * level)) * (const.Combat.R_AIReduc / 100.00) or 1.00)
    end

    -------cant round because sometimes the value enter as a float sometimes as base 100
    local final_value = (value * reduction)

    return final_value
end

