local debug = false

function AICalcAttacksAndAim(context, ap)

    ------- Fix for min aim
    local unit = context.unit
    unit.AI_dont_return_Stance_min_aim_level = true --- avoiding duplicates. GetBaseAimLevelRange check considers unit position, not future positions like the current function calculates
    local min_aim, max_aim = unit:GetBaseAimLevelRange(context.default_attack, false)
    unit.AI_dont_return_Stance_min_aim_level = false

    min_aim = min_aim or 0
    ----

    ---- Shooting Stance checks
    local stance_cost = 0

    if IsKindOf(context.weapon, "Firearm") then
        local unit_pos = unit and unit:GetPos()
        local attack_pos = context.attacker_pos

        local not_moved, has_stance
        if attack_pos and unit_pos then
            attack_pos = IsValidZ(attack_pos) and attack_pos or attack_pos:SetTerrainZ()
            unit_pos = IsValidZ(unit_pos) and unit_pos or unit_pos:SetTerrainZ()

            not_moved = attack_pos == unit_pos
            has_stance = not_moved and context.unit:GetStatusEffect("shooting_stance")
        end

        if has_stance then
            stance_cost = unit:GetShootingStanceAP(context.current_target, context.weapon, 1,
                                                   context.default_attack,
            -- context.current_action, -- which???
                                                   "rotate")
        end

        if not has_stance then
            -- force_enter_stance = true
            stance_cost = GetWeapon_StanceAP(unit, context.weapon)
        end
    end
    ------

    local aim_cost = const.Scale.AP
    if GameState.RainHeavy then
        aim_cost = MulDivRound(aim_cost, 100 + const.EnvEffects.RainAimingMultiplier, 100)
    end

    local cost = context.default_attack_cost

    ------- Verify if has AP to enter Stance
    local total_stance_cost = cost + stance_cost + aim_cost
    local has_stance_ap = ap >= total_stance_cost

    if not has_stance_ap then
        stance_cost = 0
    else ---- and modify min aim level if it has
        min_aim = min_aim + 1
    end
    -------

    local num_attacks = Min((ap - stance_cost) / cost, context.max_attacks)

    if context.force_max_aim then
        num_attacks = ------ stance_cost added
       
            Min((ap - stance_cost) / (cost + aim_cost * (max_aim - min_aim)), -- context.weapon.MaxAimActions),
                context.max_attacks)
        ------
        --[[elseif force_enter_stance then
        num_attacks = Min(
                          (ap - stance_cost - aim_cost * Max(0, (1 - min_aim))) /
                              cost, -- Deduct the AP for the first aim level upfront
                          context.max_attacks)
        -----]]
    end

    ------ Stance Cost addition
    local remaining = ap - (num_attacks * cost) - stance_cost
    ------

    local aims = {}

    ------ Debug
    if debug then
        print("----AI calc attacks and aim ----")
        print("base cost", cost)
        print("stance cost", stance_cost)
        print("total_stance_cost", total_stance_cost)
        print("has_stance_ap", has_stance_ap)
        print("baseap", ap)
        print("atts", num_attacks)
        print("remaining ap", remaining)
    end
    ------

    ------ Min aim fix
    for i = 1, num_attacks do
        aims[i] = min_aim
    end
    ------

    local attack_idx = 1
    while remaining > aim_cost do
        local aim = (aims[attack_idx] or min_aim) + 1
        ---- Min aim fix
        if aim > max_aim then -- context.weapon.MaxAimActions then 
            ---- 
            break
        end
        aims[attack_idx] = aim
        attack_idx = attack_idx + 1
        if attack_idx > num_attacks then
            attack_idx = 1
        end
        remaining = remaining - aim_cost
    end

    ------ Debug
    if debug then
        print("AI atks and aim = ", num_attacks, aims)
        print("-----------------------------------")
    end
    ------

    return num_attacks, aims
end