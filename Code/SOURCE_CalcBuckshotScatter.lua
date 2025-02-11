function Firearm:CalcBuckshotScatter(attacker, action, attack_pos, target_pos, num_vectors,
                                     aoe_params, attack_results, shot_attack_args)
    aoe_params = aoe_params or weapon:GetAreaAttackParams(action.id, attacker, target_pos)
    local range = self.WeaponRange * const.SlabSizeX
    ----
    range = range * 10
    ----
    local dir = SetLen(target_pos - attack_pos, guim)
    DbgAddCircle(target_pos, const.SlabSizeX)
    local min_offset = 35 * guic

    ----
    aoe_params.cone_angle = 300
    -----

    local scatter = Max(min_offset, MulDivRound(range, sin(aoe_params.cone_angle / 2),
                                                Max(1, cos(aoe_params.cone_angle / 2))))

    local var_offset = Max(0, scatter - min_offset)
    local targets = {}
    target_pos = attack_pos + SetLen(dir, range)

    for i = 1, num_vectors do
        local offset = RotateAxis(point(0, 0, min_offset + attacker:Random(var_offset)), dir,
                                  attacker:Random(360 * 60))
        local pt = target_pos + offset
        local test_dir = pt - attack_pos
        targets[i] = attack_pos + SetLen(test_dir, range + scatter)
        -- DbgAddVector(attack_pos, targets[i] - attack_pos)
    end

    local lof_params = shot_attack_args
    -- local lof_params = {
    --     attack_pos = attack_pos,
    --     obj = attacker,
    --     output_collisions = true,
    --     range = range + scatter + guim,
    --     seed = attacker:Random()
    -- }
    lof_params.seed = attacker:Random()
    lof_params.range = range + scatter + guim

    -- local hits = {}
    local shots_hit_data = {}

    for i, target in ipairs(targets) do
        local attack_data = GetLoFData(attacker, target, lof_params)
        local hit_data
        if attack_data then
            local lof_idx
            ---- Not sure if should check for spot group
            -- lof_idx = lof_idx or
            -- 			  table.find(attack_data.lof, "target_spot_group",
            -- 						 shot_attack_args.target_spot_group)
            hit_data = attack_data.outside_attack_area_lof or attack_data.lof and
                           attack_data.lof[lof_idx or 1]
            -- 

        end
        self:BulletCalcDamage(hit_data)
        table.insert(shots_hit_data, hit_data)
    end

    return shots_hit_data

    -- for i, data in ipairs(attack_data) do
    --     local lof_hits = data.lof and data.lof[1] and data.lof[1].hits
    --     for _, hit in ipairs(lof_hits) do
    --         local color = const.clrWhite
    --         if (hit.obj or hit.terrain) then
    --             hits[#hits + 1] = hit
    --             -- break
    --             color = IsKindOf(hit.obj, "Unit") and const.clrCyan or color

    --         end
    --         DbgAddVector(attack_pos, hit.pos - attack_pos, color)
    --     end
    -- end

    -- return hits
end
