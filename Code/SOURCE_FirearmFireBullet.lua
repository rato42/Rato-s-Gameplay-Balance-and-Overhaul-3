-- local GBO_originalFirearmFireBullet = Firearm.FireBullet
local dmg_table = {}

function res_dmgtbl()
    dmg_table = {}
end

function insp_dmgtbl()
    Inspect(dmg_table)
end

local tabuao = {}

function reset_tabuao()
    tabuao = {}
end

function ins_tabuao()
    Inspect(tabuao)

end

local debug = Platform.developer and Platform.rat
function PelletDebugAverageValues()

    local num_tables = #tabuao
    if num_tables == 0 then
        print("No data to calculate averages.")
        return
    end

    -- Storage for accumulated values per session_id
    local session_totals = {}

    -- Accumulate values from each stored debug_table
    for _, debug_table in ipairs(tabuao) do
        for session_id, data in pairs(debug_table) do
            -- Initialize if not exists
            if not session_totals[session_id] then
                session_totals[session_id] = {total_dmg = 0, total_hits = 0, bodypart_hits = {}}
            end

            -- Accumulate damage and number of hits
            session_totals[session_id].total_dmg = session_totals[session_id].total_dmg + data.dmg
            session_totals[session_id].total_hits =
                session_totals[session_id].total_hits + data.num_hits

            -- Accumulate bodypart hits
            for bodypart, count in pairs(data.bodypart_hits) do
                session_totals[session_id].bodypart_hits[bodypart] =
                    (session_totals[session_id].bodypart_hits[bodypart] or 0) + count
            end
        end
    end

    -- Compute and print averages
    print("=====  Number of shots: ", num_tables)
    print("-----  BuckAngle =: ", tabuao[1].pellet_angle)
    print("-----  VerticalFactor =: ", tabuao[1].vertical_factor)
    for session_id, totals in pairs(session_totals) do
        local avg_dmg = totals.total_dmg / num_tables
        local avg_hits = totals.total_hits / num_tables

        print("Session ID:", session_id)

        print("  Average Damage per shot:", avg_dmg)
        print("  Average Hits per shot:", avg_hits)

        print("  Average Bodypart Hits per shot:")
        for bodypart, count in pairs(totals.bodypart_hits) do
            print("    ", bodypart, ":", count / num_tables)
        end
    end
end

function Firearm:FireBullet(attacker, shot, threads, results, attack_args)
    local pellets = shot.pellets
    local debug_table = {}
    if pellets and #pellets > 0 then
        for i = 1, #pellets do

            if debug then
                for i, hit in ipairs(pellets[i].hits) do
                    if hit.obj and IsKindOf(hit.obj, "Unit") then
                        local unit = hit.obj
                        debug_table[unit.session_id] =
                            debug_table[unit.session_id] or {
                                dmg = 0,
                                num_hits = 0,
                                bodypart_hits = {},
                                distance = attack_args.distance,
                                pellet_angle = self.BuckshotConeAngle,
                                vertical_factor = self.VerticalPelletSpreadFactorMul,
                                gun = self.object_class or self.class
                            }
                        debug_table[unit.session_id].dmg =
                            debug_table[unit.session_id].dmg + hit.damage
                        debug_table[unit.session_id].num_hits =
                            debug_table[unit.session_id].num_hits + 1
                        debug_table[unit.session_id].bodypart_hits[hit.spot_group] =
                            debug_table[unit.session_id].bodypart_hits[hit.spot_group] and
                                debug_table[unit.session_id].bodypart_hits[hit.spot_group] + 1 or 1
                    end
                end
            end

            self:FirePellets(attacker, pellets[i], threads, results, attack_args, GameTime())
        end
        if debug then
            table.insert(tabuao, debug_table)
        end
        return
    end
    ratG_originalFirearmFireBullet(self, attacker, shot, threads, results, attack_args)
end

