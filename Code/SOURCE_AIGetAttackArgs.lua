function AIGetAttackArgs(context, action, target_spot_group, aim_type, override_target)
    local upos = GetPackedPosAndStance(context.unit)
    local target = override_target or context.dest_target[upos]
    local args = {target = target, target_spot_group = target_spot_group or "Torso"}

    local dest_ap
    if context.ai_destination then
        local u_x, u_y, u_z = stance_pos_unpack(upos)
        local dest_x, dest_y, dest_z = stance_pos_unpack(context.ai_destination)

        if point(u_x, u_y, u_z) ~= point(dest_x, dest_y, dest_z) then
            dest_ap = context.dest_ap[context.ai_destination]
        end
    end

    local unit_ap = dest_ap or context.unit:GetUIActionPoints()

    if action.id == "Overwatch" then
        local attacks, aim = context.unit:GetOverwatchAttacksAndAim(action, args, unit_ap)
        args.num_attacks = attacks
        args.aim_ap = aim
        -- elseif aim_type ~= "None" then
    elseif aim_type ~= "None" or action.id == "AutoFire" then
        -- args.aim = context.weapon.MaxAimActions
        ---------
        local min_aim, max_aim = context.unit:GetBaseAimLevelRange(action, false)
        args.aim = max_aim
        --------
        -- if aim_type == "Remaining AP" then
        -- while args.aim > 0 and not context.unit:HasAP(action:GetAPCost(context.unit, args)) do
        -----
        if aim_type == "Remaining AP" then
            ----
            while args.aim > min_aim and
                ---
                not context.unit:HasAP(action:GetAPCost(context.unit, args)) do
                args.aim = args.aim - 1
            end
        end
    end

    local cost = action:GetAPCost(context.unit, args)
    -- print("action_id", action.id, "cost", cost)
    local has_ap = cost >= 0 and (unit_ap >= cost)
    return args, has_ap, target
end
