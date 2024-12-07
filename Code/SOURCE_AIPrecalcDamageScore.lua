function AIPrecalcDamageScore(context, destinations, preferred_target, debug_data)

    local unit = context.unit
    local weapon = context.weapon
    local action = CombatActions[context.override_attack_id or false] or context.default_attack
    -----
    context.current_action = action
    -----
    local archetype = context.archetype
    local behavior = context.behavior

    if not weapon or context.reposition or unit:HasStatusEffect("Burning") then
        return
    end
    if not destinations and context.damage_score_precalced then
        return
    end

    local action_targets = action:GetTargets({unit})
    local targets = table.ifilter(action_targets, function(idx, target)
        return unit:IsOnEnemySide(target)
    end)
    if #targets == 0 then
        return
    end
    context.damage_score_precalced = true
    local target_score_mod = {}
    local tsr = archetype.TargetScoreRandomization
    for i, target in ipairs(targets) do
        target_score_mod[i] = 100 + ((tsr > 0) and unit:RandRange(-tsr, tsr) or 0)
    end
    context.target_score_mod = target_score_mod

    local base_mod = unit[weapon.base_skill]
    local cost_ap = context.override_attack_cost or context.default_attack_cost

    local max_check_range, is_melee = AIGetWeaponCheckRange(unit, weapon, action)
    local is_heavy = IsKindOf(weapon, "HeavyWeapon")

    local hit_modifiers = Presets["ChanceToHitModifier"]["Default"]
    -- stance mod
    local modCrouchBonus = 0
    local modProneBonus = 0
    -- if IsKindOf(weapon, "Firearm") then
    -- modCrouchBonus = hit_modifiers.AttackerStance:ResolveValue("CrouchBonus")
    -- modProneBonus = hit_modifiers.AttackerStance:ResolveValue("ProneBonus")
    local value = GetComponentEffectValue(weapon, "AccuracyBonusProne", "bonus_cth")
    if value then
        modProneBonus = modProneBonus + value
    end
    -- end
    -- ground difference mod
    local MinGroundDifference = hit_modifiers.GroundDifference:ResolveValue("RangeThreshold") *
                                    const.SlabSizeZ / 100
    local modHighGround = hit_modifiers.GroundDifference:ResolveValue("HighGround")
    local modLowGround = hit_modifiers.GroundDifference:ResolveValue("LowGround")
    -- cover
    local modCover = hit_modifiers.RangeAttackTargetStanceCover:ResolveValue("Cover")
    local modSameTarget = hit_modifiers.SameTarget:ResolveValue("Bonus")

    local target_policies = archetype.TargetingPolicies
    if behavior and #(behavior.TargetingPolicies or empty_table) > 0 then
        target_policies = behavior.TargetingPolicies
    end

    local dest_target = context.dest_target
    local dest_target_score = context.dest_target_score
    local dest_ap = context.dest_ap
    local aim_mod = Presets.ChanceToHitModifier.Default.Aim
    local dest_cth = {}
    context.dest_cth = dest_cth
    local lof_params
    local attacker_pos = unit:GetPos()

    -- script-driven modifiers (based on groups)
    local target_modifiers
    for _, groupname in ipairs(unit.Groups) do
        local group_modifiers = gv_AITargetModifiers[groupname]
        for target_group, mod in pairs(group_modifiers) do
            target_modifiers = target_modifiers or {}
            target_modifiers[target_group] = (target_modifiers[target_group] or 0) + mod
            for _, obj in ipairs(Groups[target_group]) do
                if IsKindOf(obj, "Unit") and not table.find(targets, obj) then
                    table.insert(targets, obj) -- make sure the target is considired regardless if it's an enemy or not
                    table.insert(target_score_mod,
                                 100 + ((tsr > 0) and unit:RandRange(-tsr, tsr) or 0))
                end
            end
        end
    end

    if unit:HasStatusEffect("StationedMachineGun") or unit:HasStatusEffect("ManningEmplacement") then
        local ow_units = {unit}
        targets = table.ifilter(targets, function(idx, target)
            return target:IsThreatened(ow_units, "overwatch")
        end)
    end

    if not IsValidTarget(preferred_target) or
        (IsKindOf(preferred_target, "Unit") and preferred_target:IsIncapacitated() or
            not table.find(targets, preferred_target)) then
        preferred_target = nil
    end

    if weapon and not is_melee then
        lof_params = {
            obj = unit,
            action_id = action.id,
            weapon = weapon,
            step_pos = false,
            stance = false,
            range = max_check_range,
            prediction = true,
            output_collisions = true
        }
        if not destinations or #destinations > 1 then
            lof_params.target_spot_group = "Torso"
        end
    end
    --[[	local logdata = {}
	if destinations then
		table.insert(g_AIDamageScoreLog, logdata)
	end
	logdata.preferred_target = preferred_target and (IsKindOf(preferred_target, "Unit") and _InternalTranslate(preferred_target.Name or "") or preferred_target.class) or tostring(preferred_target)--]]
    destinations = destinations or context.destinations
    NetUpdateHash("AIPrecalcDamageScore", unit, hashParamTable(destinations),
                  hashParamTable(targets), preferred_target)
    for j, upos in ipairs(destinations) do

        ----
        -- context.upos = upos
        ----

        local ux, uy, uz, ustance_idx = stance_pos_unpack(upos)
        local ustance = StancesList[ustance_idx]
        uz = uz or terrain.GetHeight(ux, uy)

        local ap = dest_ap[upos] or 0
        local best_target, best_cth
        local best_score = 0
        local potential_targets, target_score, target_cth = {}, {}, {}
        if weapon and ap >= cost_ap then
            local pos_mod = base_mod
            pos_mod = pos_mod +
                          (ustance_idx == 2 and modCrouchBonus or ustance_idx == 3 and modProneBonus or
                              0)

            local targets_attack_data
            if not is_melee then
                attacker_pos = point(ux, uy, uz)
                lof_params.step_pos = point_pack(ux, uy, uz)
                lof_params.stance = ustance
                targets_attack_data = GetLoFData(unit, targets, lof_params)

                ---
                context.attacker_pos = attacker_pos
                ----

            end
            for k, target in ipairs(targets) do
                local tpos = GetPackedPosAndStance(target)
                local dist = stance_pos_dist(upos, tpos)

                ----
                context.current_target = target
                ----

                if dist <= (max_check_range or dist) and
                    (is_melee or targets_attack_data[k] and not targets_attack_data[k].stuck) then
                    local tx, ty, tz, tstance_idx = stance_pos_unpack(tpos)
                    tz = tz or terrain.GetHeight(tx, ty)
                    local hit_mod = pos_mod
                    if not is_heavy then
                        hit_mod = hit_mod +
                                      (uz > tz + MinGroundDifference and modHighGround or uz < tz -
                                          MinGroundDifference and modLowGround or 0)
                        hit_mod = hit_mod + (unit:GetLastAttack() == target and modSameTarget or 0)
                    end
                    local target_cover = GetCoverFrom(tpos, upos)
                    if target_cover == const.CoverLow or target_cover == const.CoverHigh then
                        hit_mod = hit_mod + modCover
                    end

                    local penalty = is_heavy and 0 or (100 - weapon:GetAccuracy(dist))

                    local mod = hit_mod - penalty -- dist_penalty
                    -- environmental modifiers when applicable
                    local apply, value, target_spot_group, action, weapon1, weapon2, lof, aim,
                          opportunity_attack
                    apply, value = hit_modifiers.Darkness:CalcValue(unit, target, target_spot_group,
                                                                    action, weapon1, weapon2, lof,
                                                                    aim, opportunity_attack,
                                                                    attacker_pos)
                    if apply then
                        mod = mod + value
                    end

                    if not is_heavy and unit:IsPointBlankRange(target) then
                        mod = MulDivRound(mod, 100 + const.AIPointBlankTargetMod, 100)
                    end
                    mod = Max(0, mod)

                    if mod > const.AIShootAboveCTH then
                        -- calc base score based on cth/attacks/aiming
                        local base_mod = mod
                        local attacks, aims = AICalcAttacksAndAim(context, ap)
                        mod = 0
                        for i = 1, attacks do
                            local use, bonus

                            if (aims[i] or 0) > 0 then

                                --------- in vanilla this could vary between 2 and 8 per aim level, if use == true
                                ----- Weapon accuracy and other components are disregarded
                                -- use, bonus = aim_mod:CalcValue(unit, nil, nil, nil, nil, nil, nil, aims[i])
                                use, bonus = aim_mod:CalcValue(unit, context.current_target, nil,
                                                               context.default_attack,
                                                               context.weapon, nil, nil, aims[i])
                            end

                            -- print("-----------------------------------------------")
                            -- print("current mod", base_mod)
                            -- print("aim", aims[i])
                            -- print("new bonus = ", bonus)
                            -- print("old bonus = ", old_bonus)
                            -- print("aim bonus", bonus)
                            mod = mod + base_mod + (use and bonus or 0)
                            ------
                            --[[local hip_mod = Presets.ChanceToHitModifier.Default.HipshotPenalty
                            local hip_use, hip_bonus
                            if hip_mod and (aims[i] or 3) < 3 then
                                hip_use, hip_bonus = hip_mod:CalcValue(unit, context.current_target, nil,
                                                                       context.default_attack, context.weapon, false,
                                                                       nil, aims[i])
                            end
                            if hip_use then
                                mod = mod + hip_bonus'
                            end
                            print("hip bonus", hip_bonus)]]
                            -- print("-----------------------------------------------")

                            ----

                        end

                        -- modify score by archetype-specific weight and (optional) targeting policies
                        mod = MulDivRound(mod, archetype.TargetBaseScore, 100)
                        for _, policy in ipairs(target_policies) do
                            local peval = policy:EvalTarget(unit, target)
                            mod = mod + MulDivRound(peval or 0, policy.Weight, 100)
                        end

                        if IsKindOf(target, "Unit") and
                            (target:IsDowned() or target:IsGettingDowned()) then
                            mod = MulDivRound(mod, 5, 100)
                        end

                        local attack_data = targets_attack_data and targets_attack_data[k]
                        local ally_in_danger = attack_data and
                                                   (attack_data.best_ally_hits_count or 0) > 0

                        if action and action.AimType == "cone" then
                            ally_in_danger = ally_in_danger or
                                                 AIAllyInDanger(context.allies, context.ally_pos,
                                                                attacker_pos, target,
                                                                const.AIFriendlyFire_LOFConeNear,
                                                                const.AIFriendlyFire_LOFConeFar)
                        else
                            ally_in_danger = ally_in_danger or
                                                 AIAllyInDanger(context.allies, context.ally_pos,
                                                                attacker_pos, target,
                                                                const.AIFriendlyFire_LOFWidth,
                                                                const.AIFriendlyFire_LOFWidth)
                        end
                        if ally_in_danger then
                            mod = MulDivRound(mod, const.AIFriendlyFire_ScoreMod, 100)
                        end

                        mod = MulDivRound(mod, target_score_mod[k], 100)

                        -- apply group-based modifiers
                        if target_modifiers and IsKindOf(target, "Unit") then
                            local group_mod = 0
                            for _, groupname in ipairs(target.Groups) do
                                group_mod = group_mod + (target_modifiers[groupname] or 0)
                            end
                            if group_mod > 0 then
                                mod = MulDivRound(mod, group_mod, 100)
                            end
                        end

                        --[[table.insert(logdata, {
							name = IsKindOf(target, "Unit") and _InternalTranslate(target.Name or "") or target.class,
							score = mod
						})--]]

                        if mod > 0 and target == preferred_target then
                            best_target = target
                            best_score = mod
                            best_cth = base_mod
                            potential_targets = {}
                            break
                        end

                        best_score = Max(best_score, mod)
                        target_cth[target] = base_mod
                        target_score[target] = mod
                        local threshold = MulDivRound(best_score or 0, const.AIDecisionThreshold,
                                                      100)
                        if mod >= threshold then
                            potential_targets[#potential_targets + 1] = target
                            for i = #potential_targets, 1, -1 do
                                local target = potential_targets[i]
                                local score = target_score[target]
                                if score < threshold then
                                    table.remove(potential_targets, i)
                                end
                            end
                            -- best_target, best_score, best_cth = target, mod, base_mod
                        end
                    end
                end
            end
        end

        if #potential_targets > 0 then
            local total = 0
            for _, target in ipairs(potential_targets) do
                local score = target_score[target]
                total = total + score
                if debug_data then
                    debug_data[target] = score
                end
            end
            local roll = InteractionRand(total, "AIDecision")
            for _, target in ipairs(potential_targets) do
                local score = target_score[target]
                if roll < score then
                    best_target = target
                    break
                end
                roll = roll - score
            end
            best_target = best_target or potential_targets[#potential_targets] or false
            best_score = target_score[best_target] or 0
            best_cth = target_cth[best_target] or 0
        end

        --[[
		if destinations and IsKindOf(best_target, "Unit") then
			if best_target == preferred_target then
				printf("%s (%d) selected target (preferred): %s (score %d)", _InternalTranslate(unit.Name or ""), unit.handle, _InternalTranslate(best_target.Name or ""), best_score)
			else
				printf("%s (%d) selected target: %s (score %d)", _InternalTranslate(unit.Name or ""), unit.handle, _InternalTranslate(best_target.Name or ""), best_score)
				printf("  potential targets:")
				for _, target in ipairs(potential_targets) do
					printf("    %s (score %d)", _InternalTranslate(target.Name or ""), target_score[target])
				end
			end
		end--]]

        -- logdata.chosen_target = best_target and (IsKindOf(best_target, "Unit") and _InternalTranslate(best_target.Name or "") or best_target.class) or tostring(best_target)
        dest_target_score[upos] = best_score
        dest_target[upos] = best_target
        dest_cth[upos] = best_cth
    end
end
