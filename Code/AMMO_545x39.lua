-- ========== 5,45 x 39 mm - successor to 7.62x39 [762WP Vanilla] ==========

function GBO_545x39()
    print("GBO 545x39 ...")

    _5_45x39_AP.Icon = "Mod/cfahRED/Images/545ap.png"
    _5_45x39_AP.Cost = 300
    _5_45x39_AP.Description = T({ "5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns." })
    _5_45x39_AP.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Tumbling effects increase Critical Chance\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil" })
    _5_45x39_AP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 3,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 22,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 15,
            target_prop = "CritChance",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -10,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "ArmorPir",
        }),
    }

    _5_45x39_Basic.Icon = "Mod/cfahRED/Images/545standard 2.png"
    _5_45x39_Basic.Cost = 150
    _5_45x39_Basic.Description = T({ "5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns." })
    _5_45x39_Basic.AdditionalHint = T({ "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Tumbling effects increase Critical Chance" })
    _5_45x39_Basic.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 15,
            target_prop = "CritChance",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 22,
            target_prop = "Noise",
        }),
    }

    _5_45x39_HP.Icon = "Mod/cfahRED/Images/545hp.png"
    _5_45x39_HP.Cost = 300
    _5_45x39_HP.Description = T({ "5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns." })
    _5_45x39_HP.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Tumbling effects increase Critical Chance\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>" })
    _5_45x39_HP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 15,
            target_prop = "CritChance",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -4,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 22,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 50,
            target_prop = "CritDamage",
        }),
    }
    _5_45x39_HP.AppliedEffects = {
        "Bleeding",
    }

    _5_45x39_Match.Icon = "Mod/cfahRED/Images/545match.png"
    _5_45x39_Match.Cost = 400
    _5_45x39_Match.Description = T({ "5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns." })
    _5_45x39_Match.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Tumbling effects increase Critical Chance\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling" })
    _5_45x39_Match.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "WeaponRange",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 10,
            target_prop = "CritChanceScaled",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 22,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "AimAccuracy",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 15,
            target_prop = "CritChance",
        }),
    }

    -- TODO _545x39_Subsonic.lua
    -- TODO _54539_Tracer.lua

    print("GBO 545x39 DONE")
end

OnMsg.ClassesGenerate = GBO_545x39
