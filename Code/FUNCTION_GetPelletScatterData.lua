local debug = false

function OnMsg.ClassesGenerate()
    Shotgun.ImpactForce = -1
end

function Firearm:GetPelletScatterData(attacker, action, attack_pos, target_pos, num_vectors,
                                      aoe_params, attack_results, shot_attack_args)
    aoe_params = aoe_params or weapon:GetAreaAttackParams(action.id, attacker, target_pos)
    local range = self.WeaponRange * const.SlabSizeX
    local dir = SetLen(target_pos - attack_pos, guim)

    local min_offset = 35 * guic
    ----
    local scatter_range = 20 * const.SlabSizeX -- range
    ----
    local scatter = Max(min_offset, MulDivRound(scatter_range, sin(aoe_params.cone_angle / 2),
                                                Max(1, cos(aoe_params.cone_angle / 2))))

    local var_offset = Max(0, scatter - min_offset)

    local targets = {}
    target_pos = attack_pos + SetLen(dir, range)

    --------------------------------

    if debug then
        ic(aoe_params.cone_angle)
        -- Draw the cone limits using debug vectors
        local num_debug_vectors = 12 -- Increase for smoother visualization

        for i = 1, num_debug_vectors do
            -- Calculate rotation angle (spread evenly in a full circle)
            local angle = (360 * 60 / num_debug_vectors) * i

            -- Use maximum offset (min_offset + var_offset) for outer limit

            local max_offset = RotateAxis(point(0, 0, min_offset + var_offset), dir, (angle))

            -- Rotate around the attack direction to create the cone edge

            local pt = target_pos + max_offset
            local test_dir = pt - attack_pos
            local cone_edge_point = attack_pos + SetLen(test_dir, range + scatter)

            -- Draw the debug vector from the attack position to the cone edge
            DbgAddVector(attack_pos, cone_edge_point - attack_pos, const.clrWhite)
        end

    end
    --------------------------------

    for i = 1, num_vectors do
        local offset = RotateAxis(point(0, 0, min_offset + attacker:Random(var_offset)), dir,
                                  attacker:Random(360 * 60))
        local pt = target_pos + offset
        local test_dir = pt - attack_pos
        targets[i] = attack_pos + SetLen(test_dir, range + scatter)
        -- DbgAddVector(attack_pos, targets[i] - attack_pos)
    end

    -- local lof_params = shot_attack_args
    -- lof_params.ignore_colliders = nil

    -- lof_params.seed = attacker:Random()
    -- print("h")
    -- lof_params.range = range + scatter + guim

    local lof_args = {
        attack_pos = attack_pos,
        obj = attacker,
        output_collisions = true,
        range = range + scatter + guim,
        seed = attacker:Random(),
        penetration_class = -1,
        max_penetration_range = -1
    }
    lof_args.fire_relative_point_attack = false
    lof_args.clamp_to_target = true
    lof_args.extend_shot_start_to_attacker = false
    lof_args.can_hit_attacker = true
    lof_args.ignore_los = true
    lof_args.inside_attack_area_check = false
    lof_args.forced_hit_on_eye_contact = false
    lof_args.can_use_covers = false
    lof_args.emplacement_weapon = false
    lof_args.ignore_los = true
    lof_args.inside_attack_area_check = false
    lof_args.forced_hit_on_eye_contact = false
    lof_args.prediction = false
    lof_args.aimIK = false
    lof_args.can_stuck_on_unit = true

    -- local hits = {}
    local shots_hit_data = {}

    for i, target in ipairs(targets) do
        local attack_data = GetLoFData(attacker, target, lof_args)
        local hit_data
        if attack_data then
            ----------
            if debug then
                for i, data in ipairs(attack_data) do
                    local lof_hits = data.lof and data.lof[1] and data.lof[1].hits
                    for _, hit in ipairs(lof_hits) do
                        local color = const.clrCyan
                        if (hit.obj or hit.terrain) then
                            color = IsKindOf(hit.obj, "Unit") and const.clrRed or color
                        end
                        DbgAddVector(attack_pos, hit.pos - attack_pos, color)
                    end
                end
            end
            ----------
            local lof_idx
            ---- Not sure if should check for spot group
            -- lof_idx = lof_idx or
            -- 			  table.find(attack_data.lof, "target_spot_group",
            -- 						 shot_attack_args.target_spot_group)
            hit_data = attack_data.outside_attack_area_lof or attack_data.lof and
                           attack_data.lof[lof_idx or 1]
            -- 

        end
        table.insert(shots_hit_data, hit_data)
    end

    return shots_hit_data

    -- return hits
end
