function Firearm:CalcBuckshotScatter(attacker, action, attack_pos, target_pos, num_vectors,
                                     aoe_params, attack_results)
    aoe_params = aoe_params or weapon:GetAreaAttackParams(action.id, attacker, target_pos)
    local range = self.WeaponRange * const.SlabSizeX
    local dir = SetLen(target_pos - attack_pos, guim)
    DbgAddCircle(target_pos, const.SlabSizeX)
    local min_offset = 35 * guic

    ----
    aoe_params.cone_angle = 100

    local scatter = Max(min_offset, MulDivRound(range, sin(aoe_params.cone_angle / 2),
                                                Max(1, cos(aoe_params.cone_angle / 2))))

    local var_offset = Max(0, scatter - min_offset)
    local targets = {}
    -- target_pos = attack_pos + SetLen(dir, range)
    target_pos = attack_results and attack_results.shots and attack_results.shots[1] and
                     attack_results.shots[1].target_pos or target_pos

    DbgAddCircle(target_pos, const.SlabSizeX / 4, const.clrGreen)
    for i = 1, num_vectors do
        local offset = RotateAxis(point(0, 0, min_offset + attacker:Random(var_offset)), dir,
                                  attacker:Random(360 * 60))
        local pt = target_pos + offset
        local test_dir = pt - attack_pos
        targets[i] = attack_pos + SetLen(test_dir, range + scatter)
        -- DbgAddVector(attack_pos, targets[i] - attack_pos)
    end

    local lof_params = {
        attack_pos = attack_pos,
        obj = attacker,
        output_collisions = true,
        range = range + scatter + guim,
        seed = attacker:Random()
    }
    local attack_data = GetLoFData(attacker, targets, lof_params)
    local hits = {}

    -- DbgClearVectors()
    for i, data in ipairs(attack_data) do
        local lof_hits = data.lof and data.lof[1] and data.lof[1].hits
        -- DbgAddVector(data.attack_pos, data.target_pos - data.attack_pos,
        --              #(lof_hits or "") > 0 and const.clrWhite or const.clrRed)
        for _, hit in ipairs(lof_hits) do
            local color = const.clrWhite
            if (hit.obj or hit.terrain) then -- and not IsKindOf(hit.obj, "Unit") then
                hits[#hits + 1] = hit
                -- break
                color = IsKindOf(hit.obj, "Unit") and const.clrCyan or color

            end
            DbgAddVector(attack_pos, hit.pos - attack_pos, color)
        end
    end

    -- return attack_data
    return hits
end
