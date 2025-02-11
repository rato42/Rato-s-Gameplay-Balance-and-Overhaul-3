function Firearm:FirePellets(attacker, shot, threads, results, attack_args, start_time)
    local fx_action = attack_args.fx_action or "WeaponFire"
    NetUpdateHash("FireBullet", attacker)
    local visual_obj = self:GetVisualObj()
    assert(visual_obj and visual_obj:IsValidPos())

    if fx_action ~= "" and attack_args.single_fx then
        results.fx_played = results.fx_played or {}
        if results.fx_played[fx_action] then
            fx_action = ""
        else
            results.fx_played[fx_action] = true
        end
    end

    local action_dir = shot.target_pos - shot.attack_pos
    if action_dir:Len() > 0 then
        action_dir = SetLen(action_dir, 4096)
    else
        action_dir = RotateRadius(4096, attacker:GetAngle())
    end

    if fx_action ~= "" and attacker.visible then
        -- local fx_target = self:HasComponent("SilentShots") and "Silencer" or "Basic"
        local fx_target = visual_obj.parts.Muzzle or visual_obj.parts.Barrel or visual_obj
        PlayFX(fx_action, "start", visual_obj, fx_target, shot.attack_pos, action_dir)
        -- shell eject fx
        if shot.ammo_type then
            PlayFX("ShellEject", "start", visual_obj, shot.ammo_type)
        end
    end
    BirdsFlappingAway(visual_obj:GetVisualPos())

    table.insert(threads,

                 CreateGameTimeThread(self.PelletFly, self, attacker, shot.attack_pos,
                                      shot.stuck_pos, action_dir, const.Combat.BulletVelocity,
                                      shot.hits, attack_args.target, attack_args, start_time))
end

local BulletVegetationCollisionMask = const.cmDefaultObject | const.cmActionCamera
local BulletVegetationCollisionQueryFlags = const.cqfSorted | const.cqfResultIfStartInside
local BulletVegetationClasses = {"Shrub", "SmallTree", "TreeTop"}

function Firearm:PelletFly(attacker, start_pt, end_pt, dir, speed, hits, target, attack_args,
                           start_time)
    NetUpdateHash("ProjectileFly", attacker, start_pt, end_pt, dir, speed, hits)
    dir = SetLen(dir or end_pt - start_pt, 4096)

    local fx_actor = false
    if IsKindOf(attacker, "Unit") then
        fx_actor = attacker:CallReactions_Modify("OnUnitChooseProjectileFxActor", fx_actor)
    end

    local projectile = PlaceObject("FXBullet")
    ---
    projectile:SetScale(30)
    ---

    projectile.fx_actor_class = fx_actor
    projectile:SetGameFlags(const.gofAlwaysRenderable)
    projectile:SetPos(start_pt)
    local axis, angle = OrientAxisToVector(1, dir) -- 1 = +X
    projectile:SetAxis(axis)
    projectile:SetAngle(angle)
    PlayFX("Spawn", "start", projectile)
    local fly_time = MulDivRound(projectile:GetDist(end_pt), 1000, speed)
    ----
    local end_time = start_time + fly_time
    -- ic(end_time)
    -- local end_time = GameTime() + fly_time
    -----
    projectile:SetPos(end_pt, fly_time)
    -- Sleep(const.Combat.BulletDelay)

    -- local wind_last_dist
    -- collision.Collide(start_pt, end_pt - start_pt, BulletVegetationCollisionQueryFlags, 0,
    --                   BulletVegetationCollisionMask, function(o, _, hitX, hitY, hitZ)
    --     if o:IsKindOfClasses(BulletVegetationClasses) and not table.find(hits, "obj", o) then
    --         local hit = {
    --             obj = o,
    --             pos = point(hitX, hitY, hitZ),
    --             distance = start_pt:Dist(hitX, hitY, hitZ),
    --             vegetation = true
    --         }
    --         table.insert(hits, hit)
    --         if not wind_last_dist or hit.distance - wind_last_dist >=
    --             WindModifiersVegetationMinDistance then
    --             PlaceWindModifierBullet(hit.pos)
    --             wind_last_dist = hit.distance
    --         end
    --     end
    -- end)
    -- if wind_last_dist then
    --     table.sortby_field(hits, "distance")
    -- end

    local context = {
        attacker = attacker,
        target = target,
        dir = dir,
        target_hit = false,
        last_unit_hit = false,
        water_hit = false,
        fx_target = false
    }

    for i, hit in ipairs(hits) do
        self:BulletHit(projectile, hit, context)
    end
    --[[
	    local last_start_pos = start_pt
    local last_time = 0
	for i, hit in ipairs(hits) do
        local hit_time = MulDivRound(hit.pos:Dist(last_start_pos), 1000, speed)
        if hit_time > last_time then
            Sleep(hit_time - last_time)
            last_time = hit_time
        end
        self:BulletHit(projectile, hit, context)
        if hit.ricochet and i < #hits then
            last_start_pos = hit.pos
            last_time = 0
            local ricochet_dir = SetLen(hits[i + 1].pos - last_start_pos, 4096)
            local axis, angle = OrientAxisToVector(1, ricochet_dir) -- 1 = +X
            projectile:SetAxis(axis)
            projectile:SetAngle(angle)
            PlayFX("Ricochet", "start", projectile, context.fx_target, last_start_pos, ricochet_dir)
            local last_pos = hits[#hits].pos
            projectile:SetPos(last_pos, MulDivRound(last_pos:Dist(last_start_pos), 1000, speed))
        end
    end
    if IsValid(target) and not context.target_hit then
        PlayFX("TargetMissed", "start", target)
    end]]
    -- wait the projectile in case of no hits or long flight after the last hit
    Sleep(Max(0, end_time - GameTime()))
    PlayFX("Spawn", "end", projectile, false)
    DoneObject(projectile)

end
