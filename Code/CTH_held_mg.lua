--[[function place_held_mg_CTH() 
    PlaceObj('ChanceToHitModifier', {
        CalcValue = function(self, attacker, target, body_part_def, action, weapon1, weapon2, lof,
                             aim, opportunity_attack, attacker_pos, target_pos)
            if not attacker or not target then
                return false, 0
            end

            if not IsKindOf(weapon1, "MachineGun") then
                return false, 0
            end

            ----could see about adding the barret here too

            local overwatch = g_Overwatch[attacker]

            if action.id == "GrizzlyPerk" or overwatch and overwatch.permanent then
                return false, 0
            end

            local weapon = weapon1

            local metaText = {}

            local str = attacker.Strength
            local penalty = -12 * (weapon.weigth_held_mul / 100.0)
            local hip_mod =
                (GetWeaponHipfireOrSnapshotMul(weapon, attacker, action, false, 1) * 0.5 *
                    (weapon.weigth_held_mul / 100.0)) ^ 1.5

            print("hipmod", hip_mod)
            penalty = penalty * hip_mod
            if str > 49 then
                local str_mod_mg = 0.5 + 0.5 * (1 - (str - 50 * 1.00) / 50 * 1.00)
                print("strmod", str_mod_mg)
                penalty = penalty * str_mod_mg
                print("penalty", penalty)
            end

            return true, cRound(penalty), false, #metaText ~= 0 and metaText
        end,
        RequireActionType = "Any Ranged Attack",
        display_name = T(753869797593, "Held MG"),
        group = "Default",
        id = "mg_held"
    })

end

---------------------------------------------------------------------------------------------------------

local t_id_table = {[753869797593] = "Held MG"}

ratG_T_table['CTH_held_mg.lua'] = t_id_table
]] 
