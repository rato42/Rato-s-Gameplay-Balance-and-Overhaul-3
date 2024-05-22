-- ========== 7.62x39mm [762WP Vanilla] ==========

function GBO_762x39()
    print("GBO 762x39 ...")

    _762WP_AP.Cost = 180
    _762WP_AP.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil" })
    _762WP_AP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 3,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -20,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 25,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "ArmorPir",
        }),
    }

    _762WP_Basic.Cost = 90
    _762WP_Basic.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 25,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "PenetrationClass",
        }),
    }

    _762WP_HP.Cost = 180
    _762WP_HP.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> " })
    _762WP_HP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 50,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -4,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 25,
            target_prop = "Noise",
        }),
    }
    _762WP_HP.AppliedEffects = {
        "Bleeding",
    }

    _762WP_Match.Cost = 240
    _762WP_Match.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling" })
    _762WP_Match.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 1,
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
            mod_add = 25,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "AimAccuracy",
        }),
    }

    _762WP_Tracer.Cost = 180
    _762WP_Tracer.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Hit enemies are <color EmStyle>Marked</color> \n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Easier to compensate recoil in multishot attacks" })
    _762WP_Tracer.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 25,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "tracer",
        }),
    }
    _762WP_Tracer.AppliedEffects = {
        "Marked",
        "Revealed_R",
    }

    print("GBO 762x39 DONE")
end

OnMsg.ClassesGenerate = GBO_762x39
