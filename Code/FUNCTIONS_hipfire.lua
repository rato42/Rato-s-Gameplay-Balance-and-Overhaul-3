function GetWeaponHipfireOrSnapshotMul(weapon, attacker, action, display, aim)

    local penalty = 1.00

    if not weapon then
        return penalty
    end

    local metaText = {}

    if IsKindOf(weapon, "MeleeWeapon") then
        return const.Combat.SnapshotHipfire.MeleeWeaponMul
    end

    ------------Weaponclass

    if aim == 0 then
        penalty = (weapon.wep_base_hip_mul or 100) / 100.00
        penalty = penalty * ((weapon.class_base_hipfire_mul or 100) / 100.00)
    elseif aim > 0 then
        penalty = (weapon.wep_base_snapshot_mul or 100) / 100.00
        penalty = penalty * ((weapon.class_base_snapshot_mul or 100) / 100.00)
    end

    local c_mods = const.Combat.SnapshotHipfire.Components
    if weapon and weapon:HasComponent("hipfire_dot_effect_laser") then
        penalty = penalty * c_mods.LaserMul
        metaText[#metaText + 1] = T(626578482223, "Laser Dot")
    end

    if weapon and weapon:HasComponent("hipfire_dot_effect_uv") then
        penalty = penalty * c_mods.LaserMul
        metaText[#metaText + 1] = T(887956959968, "UV Dot")
    end

    local w1, weapon2

    if attacker then
        w1, weapon2 = attacker:GetActiveWeapons()
    end

    if weapon and weapon:HasComponent("Vert_grip_recoil") then
        if weapon2 then
        else
            penalty = penalty * c_mods.VerticalGripMul
            metaText[#metaText + 1] = T(253436571742, "Vertical Grip")
        end
    end

    if weapon and weapon:HasComponent("tac_grip_hipfire") then
        if weapon2 then
        else
            penalty = penalty * c_mods.TacticalGripMul
            metaText[#metaText + 1] = T(646775269862, "Foldable Grip")
        end
    end

    if weapon and weapon:HasComponent("hipfire_light_stock") then
        penalty = penalty * c_mods.LightStockMul
        metaText[#metaText + 1] = T(729651784671, "Light Stock")
    end

    local side = attacker and attacker.team and attacker.team.side or ''
    if not (side == 'player1' or side == 'player2') then
        penalty = AIpenal_reduc(attacker, penalty)
    end

    local modifyVal, compDef

    if aim == 0 then ------so p hipfire
        c_mods = const.Combat.Hipfire.Components
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
            penalty = penalty * c_mods.BullpupMul
            metaText[#metaText + 1] = T(486687677418, "(-) Bullpup")
        end

        if (weapon and weapon:HasComponent("longbarrel")) or (weapon and weapon.default_long_barrel) then
            if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
                penalty = penalty * c_mods.LongBarrelMul.Pistol
            elseif IsKindOf(weapon, "Revolver") then
                penalty = penalty * c_mods.LongBarrelMul.Revolver
            else
                penalty = penalty * c_mods.LongBarrelMul.Other
            end
            metaText[#metaText + 1] = T(596547733965, "Extended Barrel")
        end

        if weapon and weapon:HasComponent("shortbarrel") then

            if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
                penalty = penalty * c_mods.ShortBarrelMul.Pistol
            elseif IsKindOf(weapon, "Revolver") then
                penalty = penalty * c_mods.ShortBarrelMul.Revolver
            else
                penalty = penalty * c_mods.ShortBarrelMul.Other
            end

            metaText[#metaText + 1] = T(851834144682, "(-) Short Barrel")
        end

        if attacker and attacker.stance == "Prone" then
            penalty = penalty * const.Combat.Hipfire.Other.Prone
            metaText[#metaText + 1] = T(828597839679, "(-) Prone")
        elseif attacker and attacker.stance == "Crouch" then
            penalty = penalty * const.Combat.Hipfire.Other.Crouch
            metaText[#metaText + 1] = T(254262498254, "(-) Crouching")
        end

    elseif aim > 0 then
        c_mods = const.Combat.Snapshot.Components
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
            penalty = penalty * c_mods.DrumMagMul
            metaText[#metaText + 1] = T(916663762238, "(-) Drum Mag")
        end

        if weapon and weapon:HasComponent("hipfire_no_stock") then

            penalty = penalty * c_mods.NoStockMul
            metaText[#metaText + 1] = T(569535264469, "No Stock")

        end

        local modifyVal, compDef = GetComponentEffectValue(weapon, "scope_snapshot", "snap_reduc")
        if modifyVal then
            local reduc = (100.0 - modifyVal) / 100
            penalty = penalty * reduc
            metaText[#metaText + 1] = compDef.DisplayName
        end

        if weapon and weapon:HasComponent("bullpup") then
            penalty = penalty * c_mods.BullpupMul
            metaText[#metaText + 1] = T(633298768714, "Bullpup")
        end

        if (weapon and weapon:HasComponent("longbarrel")) or (weapon and weapon.default_long_barrel) then

            if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
                penalty = penalty * c_mods.LongBarrelMul.Pistol
            elseif IsKindOf(weapon, "Revolver") then
                penalty = penalty * c_mods.LongBarrelMul.Revolver
            else
                penalty = penalty * c_mods.LongBarrelMul.Other
            end

            metaText[#metaText + 1] = T(224584566951, "(-) Extended Barrel")
        end

        if weapon and weapon:HasComponent("shortbarrel") then

            if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
                penalty = penalty * c_mods.ShortBarrelMul.Pistol
            elseif IsKindOf(weapon, "Revolver") then
                penalty = penalty * c_mods.ShortBarrelMul.Revolver
            else
                penalty = penalty * c_mods.ShortBarrelMul.Other
            end

            metaText[#metaText + 1] = T(119591314866, "Short Barrel")
        end

        if weapon and weapon:HasComponent("hipfire_light_barrel") then
            penalty = penalty * c_mods.LightBarrelMul
            metaText[#metaText + 1] = T(447116472426, "Light Barrel")
        end

        if weapon and weapon:HasComponent("heavy_barrel_effect") then
            penalty = penalty * c_mods.HeavyBarrelMul
            metaText[#metaText + 1] = T(481487998456, "(-) Heavy Barrel")
        end

    end

    if action and (action.id == "RunAndGun" or action.id == "RecklessAssault") then
        penalty = penalty * const.Combat.SnapshotHipfire.RunAndGunMul
    end
    if action and action.id == "MobileShot" then
        penalty = penalty * const.Combat.SnapshotHipfire.MobileShotMul
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
