function GetRangeAccuracy(weapon, distance, unit, action)
    local effective_range_acc = 100
    local point_blank_acc = 100

    local weapon_range
    if unit and action then
        weapon_range = action:GetMaxAimRange(unit, weapon)
    end

    if not weapon_range then
        weapon_range = weapon.WeaponRange or weapon:GetProperty("WeaponRange")
    end

    if IsKindOf(unit, "UnitBase") then
        weapon_range = unit:CallReactions_Modify("OnUnitGetWeaponRange", weapon_range, weapon,
                                                 action)
    end

    -------------------
    if IsKindOf(weapon, "Firearm") and action and action.id == "PinDown" then
        weapon_range = MulDivRound(weapon_range, const.Combat.PindownRangeMul, 100)
    end
    -------------------

    local y0 = point_blank_acc
    local xm, ym = weapon_range / 2, effective_range_acc
    local xr = weapon_range
    local a, b, c = 0, 0, 0

    if distance / const.SlabSizeX <= xm then
        return effective_range_acc
    else
        -- second parabola
        a = MulDivRound(-ym, const.SlabSizeX, (xm - xr) * (xm - xr))
        b = MulDivRound(-2 * a, xm, const.SlabSizeX)
        c = MulDivRound(-a, xr * xr, const.SlabSizeX) - b * xr
    end

    local part = MulDivRound(MulDivRound(a, distance, const.SlabSizeX), distance,
                             const.SlabSizeX * const.SlabSizeX)
    return part + MulDivRound(b, distance, const.SlabSizeX) + c
end
