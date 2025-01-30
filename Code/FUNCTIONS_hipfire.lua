function OnMsg.ClassesGenerate()
    AppendClass.Firearm = {
        properties = {
            {id = "class_base_hipfire_mul", editor = "number", default = 100, no_edit = true},
            {id = "class_base_snapshot_mul", editor = "number", default = 100, no_edit = true}
        }
    }

    Pistol.class_base_hipfire_mul = 145
    Revolver.class_base_hipfire_mul = 138
    SubmachineGun.class_base_hipfire_mul = 120
    Shotgun.class_base_hipfire_mul = 105
    ---
    Pistol.class_base_snapshot_mul = 60
    Revolver.class_base_snapshot_mul = 60
    SubmachineGun.class_base_snapshot_mul = 85
    Shotgun.class_base_snapshot_mul = 115
    SniperRifle.class_base_snapshot_mul = 135
    AssaultRifle.class_base_snapshot_mul = 125
    MachineGun.class_base_snapshot_mul = 135

end

function GetWeaponHipfireOrSnapshotMul(weapon, attacker, action, display, aim)

    local penalty = 1.00

    if not weapon then
        return penalty
    end

    local metaText = {}

    if IsKindOf(weapon, "MeleeWeapon") then
        return 0.85
    end

    ------------Weaponclass

    if aim == 0 then
        penalty = (weapon.wep_base_hip_mul or 100) / 100.00
        penalty = penalty * ((weapon.class_base_hipfire_mul or 100) / 100.00)
    elseif aim > 0 then
        penalty = (weapon.wep_base_snapshot_mul or 100) / 100.00
        penalty = penalty * ((weapon.class_base_snapshot_mul or 100) / 100.00)
    end

    if weapon and weapon:HasComponent("hipfire_dot_effect_laser") then
        penalty = penalty * 0.88
        metaText[#metaText + 1] = T(626578482223, "Laser Dot")
    end

    if weapon and weapon:HasComponent("hipfire_dot_effect_uv") then
        penalty = penalty * 0.88
        metaText[#metaText + 1] = T(887956959968, "UV Dot")
    end

    local w1, weapon2

    if attacker then
        w1, weapon2 = attacker:GetActiveWeapons()
    end

    if weapon and weapon:HasComponent("Vert_grip_recoil") then
        if weapon2 then
        else
            penalty = penalty * 0.95
            metaText[#metaText + 1] = T(253436571742, "Vertical Grip")
        end
    end

    if weapon and weapon:HasComponent("tac_grip_hipfire") then
        if weapon2 then
        else
            penalty = penalty * 0.9
            metaText[#metaText + 1] = T(646775269862, "Foldable Grip")
        end
    end

    if weapon and weapon:HasComponent("hipfire_light_stock") then
        penalty = penalty * 0.92
        metaText[#metaText + 1] = T(729651784671, "Light Stock")
    end

    local side = attacker and attacker.team and attacker.team.side or ''
    if not (side == 'player1' or side == 'player2') then
        penalty = AIpenal_reduc(attacker, penalty)
    end

    local modifyVal, compDef

    if aim == 0 then ------so p hipfire

        if weapon and weapon:HasComponent("handguard_short") then
            modifyVal, compDef = GetComponentEffectValue(weapon, "handguard_short", "hipfire_mul")
            local sign = "(-) "
            if modifyVal and modifyVal < 100 then
                sign = ""
            end
            penalty = penalty * (modifyVal / 100.00 or 1.00)
            metaText[#metaText + 1] = sign .. compDef.DisplayName
        end

        if weapon and weapon:HasComponent("bullpup") then
            penalty = penalty * 1.08
            metaText[#metaText + 1] = T(486687677418, "(-) Bullpup")
        end

        if (weapon and weapon:HasComponent("longbarrel")) or (weapon and weapon.default_long_barrel) then
            if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
                penalty = penalty * 0.94
            elseif IsKindOf(weapon, "Revolver") then
                penalty = penalty * 0.92
            else
                penalty = penalty * 0.89
            end
            metaText[#metaText + 1] = T(596547733965, "Extended Barrel")
        end

        if weapon and weapon:HasComponent("shortbarrel") then

            if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
                penalty = penalty * 1.06
            elseif IsKindOf(weapon, "Revolver") then
                penalty = penalty * 1.08
            else
                penalty = penalty * 1.11
            end

            metaText[#metaText + 1] = T(851834144682, "(-) Short Barrel")
        end

        if attacker and attacker.stance == "Prone" then
            penalty = penalty * 1.10
            metaText[#metaText + 1] = T(828597839679, "(-) Prone")
        elseif attacker and attacker.stance == "Crouch" then
            penalty = penalty * 1.05
            metaText[#metaText + 1] = T(254262498254, "(-) Crouching")
        end

    elseif aim > 0 then

        if weapon and weapon:HasComponent("handguard_short") then
            modifyVal, compDef = GetComponentEffectValue(weapon, "handguard_short", "snapshot_mul")
            local sign = "(-) "
            if modifyVal and modifyVal < 100 then
                sign = ""
            end
            penalty = penalty * (modifyVal / 100.00 or 1.00)
            metaText[#metaText + 1] = sign .. compDef.DisplayName
        end

        if weapon and weapon:HasComponent("drum_mag_hipfire") then
            penalty = penalty * 1.1
            metaText[#metaText + 1] = T(916663762238, "(-) Drum Mag")
        end

        if weapon and weapon:HasComponent("hipfire_no_stock") then

            penalty = penalty * 0.92
            metaText[#metaText + 1] = T(569535264469, "No Stock")

        end

        local modifyVal, compDef = GetComponentEffectValue(weapon, "scope_snapshot", "snap_reduc")
        if modifyVal then
            local reduc = (100.0 - modifyVal) / 100
            penalty = penalty * reduc
            metaText[#metaText + 1] = compDef.DisplayName
        end

        if weapon and weapon:HasComponent("bullpup") then
            penalty = penalty * 0.96
            metaText[#metaText + 1] = T(633298768714, "Bullpup")
        end

        if (weapon and weapon:HasComponent("longbarrel")) or (weapon and weapon.default_long_barrel) then

            if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
                penalty = penalty * 1.06
            elseif IsKindOf(weapon, "Revolver") then
                penalty = penalty * 1.07
            else
                penalty = penalty * 1.10
            end

            metaText[#metaText + 1] = T(224584566951, "(-) Extended Barrel")
        end

        if weapon and weapon:HasComponent("shortbarrel") then

            if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
                penalty = penalty * 0.94
            elseif IsKindOf(weapon, "Revolver") then
                penalty = penalty * 0.93
            else
                penalty = penalty * 0.90
            end

            metaText[#metaText + 1] = T(119591314866, "Short Barrel")
        end

        if weapon and weapon:HasComponent("hipfire_light_barrel") then
            penalty = penalty * 0.92
            metaText[#metaText + 1] = T(447116472426, "Light Barrel")
        end

        if weapon and weapon:HasComponent("heavy_barrel_effect") then
            penalty = penalty * 1.08
            metaText[#metaText + 1] = T(481487998456, "(-) Heavy Barrel")
        end

    end

    if action and (action.id == "RunAndGun" or action.id == "RecklessAssault") then
        penalty = penalty * const.Combat.RunAndGunSnapshotHipfirePenaltyMul
    end
    if action and action.id == "MobileShot" then
        penalty = penalty * const.Combat.MobileShotSnapshotHipfirePenaltyMul
    end

    if display == true then
        return penalty
    else
        return penalty, metaText
    end

end

---------------------------------------------------------------------------------------------------------

local t_id_table = {
    [626578482223] = "Laser Dot",
    [887956959968] = "UV Dot",
    [253436571742] = "Vertical Grip",
    [646775269862] = "Foldable Grip",
    [729651784671] = "Light Stock",
    [486687677418] = "(-) Bullpup",
    [596547733965] = "Extended Barrel",
    [851834144682] = "(-) Short Barrel",
    [828597839679] = "(-) Prone",
    [254262498254] = "(-) Crouching",
    [916663762238] = "(-) Drum Mag",
    [569535264469] = "No Stock",
    [633298768714] = "Bullpup",
    [224584566951] = "(-) Extended Barrel",
    [119591314866] = "Short Barrel",
    [447116472426] = "Light Barrel",
    [481487998456] = "(-) Heavy Barrel"
}

ratG_T_table['FUNCTIONS_hipfire.lua'] = t_id_table
