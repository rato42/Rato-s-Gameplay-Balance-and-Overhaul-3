-- ========== 7.62x54mmR ==========

function GBO_762x54()
    print("GBO 762x54 ...")

    _7_62x54_AP.Cost = 360
    _7_62x54_AP.Icon = "Mod/cfahRED/Images/bearAP.png"
    _7_62x54_AP.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil" })
    _7_62x54_AP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 4,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -20,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 32,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "ArmorPir",
        }),
    }

    _7_62x54_Basic.Cost = 180
    _7_62x54_Basic.Icon = "Mod/cfahRED/Images/standardBewar.png"
    _7_62x54_Basic.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 32,
            target_prop = "Noise",
        }),
    }

    _7_62x54_HP.Cost = 360
    _7_62x54_HP.Icon = "Mod/cfahRED/Images/bearHP.png"
    _7_62x54_HP.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>" })
    _7_62x54_HP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 50,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -4,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 32,
            target_prop = "Noise",
        }),
    }
    _7_62x54_HP.AppliedEffects = {
        "Bleeding",
    }

    _7_62x54_Match.Cost = 400
    _7_62x54_Match.Icon = "Mod/cfahRED/Images/MAtchBear.png"
    _7_62x54_Match.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling" })
    _7_62x54_Match.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 10,
            target_prop = "CritChanceScaled",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "WeaponRange",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 32,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "AimAccuracy",
        }),
    }

    -- TODO _76254R_Tracer.lua
    -- TODO _762x54R_Subsonic.lua

    print("GBO 762x54 DONE")
end

OnMsg.ClassesGenerate = GBO_762x54
