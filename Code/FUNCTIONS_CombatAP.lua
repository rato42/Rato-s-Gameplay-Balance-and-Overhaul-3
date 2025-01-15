---------------------------------------------------------------------------------------------------
function Unit:GetShootingStanceAP(target, weapon, aim, action, param)
    if not IsKindOf(weapon, "Firearm") then
        return 0
    end

    if not g_Combat or g_StartingCombat or g_TestingSaveLoadSystem then
        return 0
    end

    ---------------Already in Stance
    local stance = self:HasStatusEffect("shooting_stance") or
                       self:HasStatusEffect("ManningEmplacement") or
                       self:HasStatusEffect("StationedMachineGun")
    -------------------

    local ap_stance = GetWeapon_StanceAP(self, weapon)
    local ap_hipfire = 0

    if aim < 1 and not (target == self:GetLastAttack()) or not target then
        ap_hipfire = GetHipfire_StanceAP(self, weapon)
    end

    ------------Rotate
    local ap_rotate
    if stance then
        ap_rotate = Clamp(ShootingConeAngle(self, weapon, target) * const.Scale.AP, 0,
                          ap_stance + Get_AimCost(self))
    else
        ap_rotate = 0
    end

    if g_Overwatch[self] then
        local overwatch = g_Overwatch[self] or false
        if overwatch and overwatch.permanent then
            ap_rotate = 0
        end
    end
    --------------

    if param == "rotate" then
        return ap_rotate
    end

    if param == "stance" then
        return ap_stance
    end

    if stance then
        return ap_rotate
    elseif aim < 1 then
        return ap_hipfire
    end

    return ap_stance

end
---------------------------------------------------------------------------------------------------
function rat_getMobileshot_moveAP(action, unit, weapon)
    local base_ap = 9
    local min_ap = 6
    local weapon_multiplier = (action and action.id == "Sprint") and 1.0 or 1.5

    local stanceap = 0
    if weapon and IsKindOf(weapon, "Firearm") then

        stanceap = (GetWeapon_StanceAP(unit, weapon) / const.Scale.AP) * weapon_multiplier

        if weapon.LargeItem < 1 or weapon:HasComponent("no_stock") then
            stanceap = Max(0, stanceap - 1)
        end

        if not (IsKindOf(weapon, "SubmachineGun") or IsKindOf(weapon, "Pistol") or
            IsKindOf(weapon, "Revolver")) then
            stanceap = stanceap + 2
        end
    end

    local agility_scaling = Max(0, (unit.Agility - 40.0) / 10.0)
    local move_ap = Max(min_ap, cRound(base_ap * 1.00 + agility_scaling - (stanceap)))

    return move_ap
end
---------------------------------------------------------------------------------------------------
function GetWeapon_StanceAP(unit, weapon, display)
    if not weapon or not IsKindOf(weapon, "Firearm") then
        return 0
    end
    local cost = weapon.APStance
    cost = Cumbersome_StanceAP(unit, weapon, cost)

    local modifyVal, compDef = GetComponentEffectValue(weapon, "stance_ap_inc_STR",
                                                       "StanceIncreaseSTR")

    local str_min = 0
    if modifyVal then
        str_min = GetComponentEffectValue(weapon, "stance_ap_inc_STR", "STR_threshold")
        if not unit or unit.Strength < str_min then
            cost = cost + modifyVal
        end
    end

    if display then
        return cost
    end

    if R_IsAI(unit) then
        cost = MulDivRound(cost, CurrentModOptions.AIWeaponStanceMul or 100, 100)
    end

    return cost * const.Scale.AP
end
---------------------------------------------------------------------------------------------------
function Cumbersome_StanceAP(unit, weapon, cost)
    if weapon:IsCumbersome() then
        cost = cost + 1
        if unit and unit.Strength >= const.Combat.CumbersomeStanceAP_StrThreshold then
            cost = Max(1, cost - 1)
        end
    end
    return cost
end
---------------------------------------------------------------------------------------------------
function GetHipfire_StanceAP(unit, weapon) ---- not used

    --[[local ap_hipfire = 1 -------------hipfire
    ap_hipfire = Cumbersome_StanceAP(unit, weapon, ap_hipfire)

    if R_IsAI(unit) then
        ap_hipfire = MulDivRound(ap_hipfire, const.Combat.AI_ShootingStanceAP_Mul or 100, 100)
    end]]

    return 0 -- ap_hipfire * const.Scale.AP
end
---------------------------------------------------------------------------------------------------
function rat_MobileAction_AP(action, unit)

    if not unit then
        return 0, 0
    end

    if not action then
        return 0, 0
    end

    local weapon = action:GetAttackWeapons(unit)
    local att_cost = unit:GetAttackAPCost(action, weapon, nil, 0) -- CombatActions.BurstFire.GetAPCost(self, unit, args)
    local ap_delta = rat_getDeltaAP(action, weapon)
    local cost = att_cost + ap_delta

    if rat_canBolt(weapon) then
        local unbolted_shots = 3
        local cycling_ap = rat_get_manual_cyclingAP(unit, weapon, true)
        if not weapon.unbolted then
            unbolted_shots = unbolted_shots - 1
        end

        cycling_ap = cRound(cycling_ap * unbolted_shots * const.Scale.AP * 0.5)
        if cycling_ap and cycling_ap > 0 then
            cost = cost + cycling_ap
        end
    end

    local ap_extra = GetWeapon_StanceAP(unit, weapon) + Get_AimCost(unit) -- mobile_stance_ap(unit, weapon)
    local cost_aimed = cost + ap_extra

    return cost, cost_aimed
end
---------------------------------------------------------------------------------------------------
function rat_getDeltaAP(action, weapon, action_id_override)
    local base = 0
    local action_id = ''

    if action_id_override then
        base = CombatActions[action_id_override].ActionPointDelta
        action_id = action_id_override
    elseif action then
        base = action.ActionPointDelta
        action_id = action.id
    end

    if action_id == "MobileShot" then
        action_id = "SingleShot"
    end

    if action_id == "SingleShot" then
        if IsKindOfClasses(weapon, "SubmachineGun") then
            base = base + 1000
        end
        if IsKindOf(weapon, "Glock18") or IsKindOf(weapon, "B93R_1") or IsKindOf(weapon, "G36") or
            IsKindOf(weapon, "B93RR_1") then
            base = base + 1000
        end
        if IsKindOf(weapon, "AN94_1") then
            base = base + 2000
        end
    elseif action_id == "AutoFire" then
        if IsKindOf(weapon, "AN94_1") then
            base = base + 1000
        elseif IsKindOf(weapon, "Glock18") then
            base = base + 1000
        elseif IsKindOf(weapon, "G36") then
            base = base + 1000
        end
    end

    return base
end
---------------------------------------------------------------------------------------------------
