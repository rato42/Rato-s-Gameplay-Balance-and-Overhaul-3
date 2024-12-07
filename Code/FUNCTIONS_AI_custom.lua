function cRound(num)
    local numf
    local sign = 1
    if num < 0 then
        sign = -1
        num = -num
    end

    local integerNum = num + 0.5
    integerNum = integerNum - integerNum % 1

    numf = sign * integerNum

    numf = tostring(numf)
    numf = string.format("%.0f", numf)
    numf = tonumber(numf)
    return numf
end

function cRoundFlt(value, step)
    local step = step or 0.5
    local remainder = value % step
    if remainder < step / 2 then
        return value - remainder
    else
        return value + (step - remainder)
    end
end

function cRoundDown(num)
    local numf = num
    -- local sign = 1

    -- if num < 0 then
    -- sign = -1
    -- num = -num
    -- end

    -- local integerNum = num + 0.5
    -- print("num", integerNum)
    -- print("num int", integerNum % 1)
    -- integerNum = integerNum - integerNum % 1

    -- numf = sign * integerNum

    numf = tostring(numf)
    numf = string.match(numf, "([%-%d]+)")
    numf = tonumber(numf)

    return numf
end

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
            -- print("Spiritual removed")
        end
    end
end

function R_IsAI(unit)

    local side = unit and unit.team and unit.team.side or ''
    if (side == "player1" or side == "player2") then
        return false
    end
    return true
end

function AIpenal_reduc(attacker, value, cth_id, persistant_recoil)
    -- print("penal function start",value)

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

    -- print(reduction, cth_id or "nil")

    -------cant round because sometimes the value enter as a float sometimes as base 100
    local final_value = (value * reduction)

    -- print("penal function end", final_value)
    return final_value
end

