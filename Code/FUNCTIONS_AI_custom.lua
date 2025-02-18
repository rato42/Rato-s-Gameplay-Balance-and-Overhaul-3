function AIpenal_reduc(attacker, value, cth_id, persistant_recoil)
    if not attacker then
        return value
    end

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

