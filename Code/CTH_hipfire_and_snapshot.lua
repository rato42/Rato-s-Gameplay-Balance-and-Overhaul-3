function place_hipfire_cth()
    PlaceObj('ChanceToHitModifier', {
        CalcValue = function(self, attacker, target, body_part_def, action, weapon1, weapon2, lof,
                             aim, opportunity_attack, attacker_pos, target_pos)

            if not action then
                return false, 0
            end

            local side = attacker and attacker.team and attacker.team.side or ''

            if not IsKindOf(weapon1, "Firearm") and action.id ~= "KnifeThrow" then
                return false, 0
            end

            if action.id == "MGSetup" then
                return false, 0
            end

            if action.id == "PinDown" then
                return false, 0
            end

            if action.id == "AutoFire" and HasPerk(attacker, "shooting_stance") and
                not opportunity_attack then
                return false, 0
            end

            if action.id == "AutoFire" and aim > 0 and not opportunity_attack then
                return false, 0
            end

            if aim > 0 and (target and attacker:GetLastAttack() == target) then
                return false, 0
            end

            if aim > 2 then
                return false, 0
            end

            ------

            local metaText = {}

            local dist = (attacker_pos and target_pos and attacker_pos:Dist(target_pos)) or
                             (attacker and target and attacker:GetDist(target))

            ---------------------------

            local weapon = weapon1

            local penalty = 1.0

            if opportunity_attack or attacker:HasStatusEffect("shooting_stance") or
                attacker:HasStatusEffect("ManningEmplacement") or
                attacker:HasStatusEffect("StationedMachineGun") then
                aim = Max(1, aim)
            end

            if action.id == "Overwatch" then
                aim = Max(1, aim)
            end

            if g_Overwatch[attacker] and g_Overwatch[attacker].permanent then
                aim = Max(1, aim)
            end

            local display = false

            local wep_hip_penal, wep_meta = GetWeaponHipfireOrSnapshotMul(weapon, attacker, action,
                                                                          display, aim)

            if action and action.id == "DualShot" then
                weapon = weapon2
                local wep_hip_penal2 = GetWeaponHipfireOrSnapshotMul(weapon, attacker, action,
                                                                     display, aim)
                weapon = weapon1
                wep_hip_penal = (wep_hip_penal + wep_hip_penal2) / 2
                wep_meta = {T {392849416519, "Average: Two Weapons"}}
            end

            penalty = penalty * wep_hip_penal

            for i, text in ipairs(wep_meta) do
                table.insert(metaText, text)
            end

            local reflex_s = 1.0
            local ratio

            if action.id == "BurstFire" then
                ratio = attacker.Strength / rGetReflex(attacker)
            end

            if not opportunity_attack and aim < 1 and
                ((action.id == "BuckshotBurst" or action.id == "MGBurstFire" or action.id ==
                    "GrizzlyPerk" or action.id == "AutoFire") or (ratio and ratio > 1)) then
                local reflex = attacker.Strength

                local min = 0.65
                local max = 1.35
                reflex_s = max - (max - min) * reflex / 100

                if reflex_s >= 1.00 then
                    metaText[#metaText + 1] = T {221848738467, "Low Strength"}
                elseif reflex_s <= 0.80 then
                    metaText[#metaText + 1] = T {413925295955, "High Strength"}
                else
                    metaText[#metaText + 1] = T {278838794679, "Strength"}
                end
            else
                local reflex = rGetReflex(attacker)

                local min = 0.65
                local max = 1.35
                reflex_s = max - (max - min) * reflex / 100

                if reflex_s >= 1.00 then
                    metaText[#metaText + 1] = T {645785968721, "Low Reflexes"}
                elseif reflex_s <= 0.80 then
                    metaText[#metaText + 1] = T {433649794796, "High Reflexes"}
                else
                    metaText[#metaText + 1] = T {253999664478, "Reflexes"}
                end
            end

            -- print("dist", dist / const.SlabSizeX)

            local max_dist = const.Combat.Hipfire_MaxDistforPenalty * const.SlabSizeX
            local max_penal = const.Combat.HipFireMaxPenalty

            local hip_penal = Min(0, MulDivRound(dist, max_penal, max_dist))

            local weapon_ref = reflex_s * penalty * 100
            local base_penal1 = const.Combat.Hipfire_BasePenalty
            local base_penal

            if not (side == 'player1' or side == 'player2') then
                weapon_ref = AIpenal_reduc(attacker, weapon_ref)
            end

            if action.id == "GrizzlyPerk" then
                weapon_ref = weapon_ref * 0.4
                base_penal1 = cRound(base_penal1 / 2)
                metaText[#metaText + 1] = "Off the Hip"
            end

            base_penal = MulDivRound(dist, base_penal1, 16 * const.SlabSizeX)

            if base_penal < base_penal1 then
                base_penal = base_penal1
            elseif base_penal > cRound(base_penal1 / 2) then
                base_penal = cRound(base_penal1 / 2)
            end

            local mobile_shot_penal = 0

            if action and action.id == "MobileShot" then
                mobile_shot_penal = -8
            end

            local name = T(588769789298, "Hipfire")
            local snap_name = T(335346378867, "Snapshot")

            if action and action.id == "KnifeThrow" then
                name = T(941222879324, "Quick Throw")
                snap_name = name
                if aim > 0 then
                    return false, 0
                end
            end

            if aim > 0 and aim < 3 then
                max_dist = const.Combat.Snapshot_MaxDistforPenalty * const.SlabSizeX
                max_penal = const.Combat.SnapshotMaxPenalty

                base_penal1 = const.Combat.Snapshot_BasePenalty

                base_penal = MulDivRound(dist, base_penal1, 16 * const.SlabSizeX)

                if base_penal < base_penal1 then
                    base_penal = base_penal1
                elseif base_penal > cRound(base_penal1 / 2) then
                    base_penal = cRound(base_penal1 / 2)
                end

                local snap_penal = Min(0, MulDivRound(dist, max_penal, max_dist))

                snap_penal = MulDivRound(snap_penal, weapon_ref, 100) + base_penal

                if (g_Overwatch[attacker] and g_Overwatch[attacker].permanent) then
                    metaText[#metaText + 1] = T {516951375425, "MG Setup"}
                    snap_penal = MulDivRound(snap_penal, 90, 100)
                end

                if aim == 2 then
                    snap_penal = MulDivRound(snap_penal, 25, 100)
                end

                snap_penal = snap_penal + mobile_shot_penal
                -- print("snap_penal", snap_penal)
                return true, snap_penal, snap_name, #metaText ~= 0 and metaText
            end

            hip_penal = MulDivRound(hip_penal, weapon_ref, 100) + base_penal

            if dist < const.Weapons.PointBlankRange * const.SlabSizeX then
                hip_penal = MulDivRound(hip_penal, 90, 100)
            end

            hip_penal = hip_penal + mobile_shot_penal

            -- print("hipfire", hip_penal)
            return true, hip_penal, name, #metaText ~= 0 and metaText

        end,
        RequireTarget = true,
        display_name = T(145534626581, "Hipshot Penalty"),
        group = "Default",
        id = "HipshotPenalty"
    })

end

---------------------------------------------------------------------------------------------------------

local t_id_table = {
    [588769789298] = "Hipfire",
    [335346378867] = "Snapshot",
    [941222879324] = "Quick Throw",
    [145534626581] = "Hipshot Penalty",
    [392849416519] = "Average: Two Weapons",
    [221848738467] = "Low Strength",
    [413925295955] = "High Strength",
    [278838794679] = "Strength",
    [645785968721] = "Low Reflexes",
    [433649794796] = "High Reflexes",
    [253999664478] = "Reflexes",
    [516951375425] = "MG Setup"
}

ratG_T_table['CTH_shooting_stance_hipfire.lua'] = t_id_table
