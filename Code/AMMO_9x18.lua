-- ========== 9×18mm Makarov - significally less powerful than 9x19mm but easier to control and little less noisy ==========

function GBO_9x18()
    print("GBO 9x18 ...")

    _9x18_AP.AdditionalHint = T({ "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil" })
    _9x18_AP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -23,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 13,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "ArmorPir",
        }),
    }

    _9x18_Basic.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 13,
            target_prop = "Noise",
        }),
    }

    _9x18_HP.AdditionalHint = T({
        "<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>" })
    _9x18_HP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 45,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -4,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 13,
            target_prop = "Noise",
        }),
    }

    _9x18_Match.AdditionalHint = T({
        "<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling" })
    _9x18_Match.Modifications = {
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
            mod_add = 13,
            target_prop = "Noise",
        }),
    }

    print("GBO 9x18 DONE")
end

OnMsg.ClassesGenerate = GBO_9x18
