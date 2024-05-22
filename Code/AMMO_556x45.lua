-- ========== 5,56 × 45 mm [556 Vanilla] ==========

function GBO_556x45()
    print("GBO 556x45 ...")

    _556_AP.Cost = 300
    _556_AP.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Fragmentation effects increase Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil" })
    _556_AP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 3,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 20,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 23,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "ArmorPir",
        }),
    }

    _556_Basic.Cost = 150
    _556_Basic.AdditionalHint = T({ "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Fragmentation effects increase Critical Damage" })
    _556_Basic.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 23,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 30,
            target_prop = "CritDamage",
        }),
    }

    _556_HP.Cost = 300
    _556_HP.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Fragmentation effects increase Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> " })
    _556_HP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 80,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -4,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 23,
            target_prop = "Noise",
        }),
    }
    _556_HP.AppliedEffects = {
        "Bleeding",
    }

    _556_Match.Cost = 400
    _556_Match.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Fragmentation effects increase Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling" })
    _556_Match.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "AimAccuracy",
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
            mod_add = 30,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 23,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
    }

    _556_Tracer.Cost = 300
    _556_Tracer.AdditionalHint = T({
        "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Less noisy\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128\n120> Less bullet speed, resulting in less Aim Accuracy, Range and no armor penetration\n" })
    _556_Tracer.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 20,
            mod_mul = 550,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -6,
            target_prop = "WeaponRange",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -1,
            target_prop = "AimAccuracy",
        }),
    }

    print("GBO 556x45 DONE")
end

OnMsg.ClassesGenerate = GBO_556x45
