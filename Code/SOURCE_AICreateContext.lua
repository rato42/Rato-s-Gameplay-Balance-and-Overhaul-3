function AICreateContext(unit, context)
    local gx, gy, gz = unit:GetGridCoords()
    local weapon = unit:GetActiveWeapons()
    local default_attack = unit:GetDefaultAttackAction(nil, "ungrouped", nil, "sync")
    local enemies = table.icopy(GetEnemies(unit))

    ----
    if IsKindOf(weapon, "Firearm") and not unit:GetStatusEffect("shooting_stance") then
        local attack_cost = default_attack:GetAPCost(unit)
        local stance_cost = GetWeapon_StanceAP(unit, default_attack:GetAttackWeapons(unit) or
                                                   unit:GetActiveWeapons()) + Get_AimCost()
        local free_move_ap = unit.free_move_ap or 0
        local ap = unit.ActionPoints - free_move_ap
        local total_stance_cost = attack_cost + stance_cost
        local has_stance_ap = ap >= total_stance_cost
        -- print("-- checking if has stance AP from AICreateContext:", has_stance_ap, GameTime())
        -- print(default_attack.id, attack_cost, stance_cost)
        if not has_stance_ap and table.find(weapon.AvailableAttacks, "SingleShot") then
            default_attack = CombatActions["SingleShot"]
        end

    end
    ---- and not default_attack.id == "SingleShot" and

    for _, groupname in ipairs(unit.Groups) do
        local group_modifiers = gv_AITargetModifiers[groupname]
        for target_group, mod in pairs(group_modifiers) do
            for _, obj in ipairs(Groups[target_group]) do
                if IsKindOf(obj, "Unit") then
                    table.insert_unique(enemies, obj)
                end
            end
        end
    end

    if not g_BiasMarkers then
        InitAIBiasMarkers()
    end

    -- fallback when our whole team doesn't have a visual on the enemy but we're still aware
    if #(enemies or empty_table) == 0 then
        enemies = table.ifilter(GetAllEnemyUnits(unit), function(idx, enemy)
            return not enemy:HasStatusEffect("Hidden")
        end)
    end

    -- special-case when having ManningEmplacement status - filter out non targetable enemies
    if unit:HasStatusEffect("ManningEmplacement") then
        enemies = table.ifilter(enemies, function(idx, enemy)
            return enemy:IsThreatened({unit})
        end)
    end

    table.sortby_field(enemies, "handle")

    local pos = GetPassSlab(unit)
    if not pos then -- can happen if the unit is on impassable for some reason	
        -- assert(false, "GetPassSlab failed for unit " .. unit.session_id)		
        local x, y, z = unit:GetPosXYZ()
        local gx, gy, gz = WorldToVoxel(x, y, z)
        if not z then
            gz = nil
        end
        pos = point(VoxelToWorld(gx, gy, (gz)))
    end
    local wx, wy, wz = pos:xyz()

    context = context or {}

    context.unit = unit
    context.unit_pos = pos
    context.start_ap = unit.ActionPoints
    context.archetype = unit:GetArchetype()
    context.unit_grid_voxel = point_pack(gx, gy, gz)
    context.unit_world_voxel = point_pack(pos)
    context.unit_stance_pos = stance_pos_pack(wx, wy, wz, StancesList[unit.stance])
    context.max_attacks = unit.MaxAttacks
    context.dest_target = {} -- dest -> picked target (if any)
    context.dest_target_score = {} -- dest -> estimated damage
    context.weapon = weapon
    context.default_attack = default_attack
    -- context.default_attack_cost = default_attack:GetAPCost(unit)
    context.default_attack_cost = default_attack:GetAPCost(unit)
    context.EffectiveRange = IsKindOf(weapon, "Firearm") and weapon.WeaponRange / 2 or 1
    context.ExtremeRange = IsKindOf(weapon, "Firearm") and weapon.WeaponRange or 1
    context.enemies = enemies
    context.enemy_visible = {} -- [enemy] -> true/false
    context.enemy_visible_by_team = {} -- [enemy] -> true/false
    context.enemy_pos = {}
    context.enemy_grid_voxel = {}
    context.enemy_pack_pos_stance = {}
    context.enemy_dir = {}
    context.stance_pos_to_vis_enemies = {}
    context.allies = unit.team.units
    context.ally_grid_voxel = {}
    context.ally_pack_pos_stance = {}
    context.ally_pos = {}
    context.voxel_heal_target = {}
    context.voxel_heal_score = {}
    context.forced_signature_action = false
    context.apply_bias = true
    context.disable_actions = {} -- support for custom filtering for signature action selection by BiasId

    NetUpdateHash("AICreateContext", unit, pos, unit.stance, context.start_ap, context.archetype.id,
                  context.max_attacks, weapon and weapon.class, weapon and weapon.id,
                  default_attack.id)

    if unit:HasStatusEffect("Stimmed") then
        context.max_attacks = context.max_attacks + 1
    end

    for _, action in ipairs(context.archetype.SignatureActions) do
        context.can_heal = context.can_heal or IsKindOf(action, "AIActionBandage")
    end
    if not context.can_heal then
        for _, behavior in ipairs(context.archetype.Behaviors) do
            for _, action in ipairs(behavior.SignatureActions) do
                context.can_heal = context.can_heal or IsKindOf(action, "AIActionBandage")
            end
        end
    end

    for i, enemy in ipairs(enemies) do
        local x, y, z = enemy:GetGridCoords()
        context.enemy_grid_voxel[enemy] = point_pack(x, y, z)
        context.enemy_pack_pos_stance[enemy] = GetPackedPosAndStance(enemy)
        local enemy_pos = GetPassSlab(enemy) or SnapToVoxel(enemy:GetPos())
        context.enemy_pos[enemy] = enemy_pos
        if not pos:Equal2D(enemy_pos) then
            local dir = enemy_pos - pos
            dir = dir:SetInvalidZ()
            context.enemy_dir[enemy] = SetLen(dir, guim)
        else
            context.enemy_dir[enemy] = point(0, 0, guim)
        end
        context.enemy_visible[enemy] = HasVisibilityTo(unit, enemy)
        context.enemy_visible_by_team[enemy] = HasVisibilityTo(unit.team, enemy)
    end
    if context.behavior then
        context.behavior:EnumDestinations(unit, context)
    else
        AIFindDestinations(unit, context)
    end
    AIUpdateDestLosCache(unit, context)

    for i, ally in ipairs(context.allies) do
        local x, y, z = ally:GetGridCoords()
        context.ally_grid_voxel[ally] = point_pack(x, y, z)
        context.ally_pack_pos_stance[ally] = GetPackedPosAndStance(ally)
        context.ally_pos[ally] = ally:GetPos()
    end

    unit.ai_context = context
    return context
end
