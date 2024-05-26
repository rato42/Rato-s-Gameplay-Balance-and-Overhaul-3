-- ========== 9×18mm Makarov ==========
-- = Group 1: Small Caliber Pistols =
-- Significally less powerful than 9x19mm but easier to control and little less noisy. CritChance-2 CritDamage-2

function GBO_9x18()
    print("GBO 9x18 ...")

    _9x18_AP.AdditionalHint = T({ "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil" })
    _9x18_AP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -22,
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
        PlaceObj('CaliberModification', {
            mod_add = -2,
            target_prop = "CritChance",
        }),
    }

    _9x18_Basic.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 13,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -2,
            target_prop = "CritChance",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -2,
            target_prop = "CritDamage",
        }),
    }

    _9x18_HP.AdditionalHint = T({
        "<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>" })
    _9x18_HP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 48,
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
        PlaceObj('CaliberModification', {
            mod_add = -2,
            target_prop = "CritChance",
        }),
    }
    _9x18_HP.AppliedEffects = {}

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
        PlaceObj('CaliberModification', {
            mod_add = -2,
            target_prop = "CritChance",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -2,
            target_prop = "CritDamage",
        }),
    }

    print("GBO 9x18 DONE")
end

OnMsg.ClassesGenerate = GBO_9x18
