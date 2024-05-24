-- ========== .44 Magnum(Revolvers) ==========

function GBO_44MAG()
    print("GBO .44MAG ...")

    _44MAG_AP.Cost = 200
    _44MAG_AP.AdditionalHint = T({ "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil" })
    _44MAG_AP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -20,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 18,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "ArmorPir",
        }),
    }
    _44MAG_AP.AppliedEffects = {}

    _44MAG_Basic.Cost = 100
    _44MAG_Basic.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 18,
            target_prop = "Noise",
        }),
    }
    _44MAG_Basic.AppliedEffects = {}


    _44MAG_HP.Cost = 200
    _44MAG_HP.AdditionalHint = T({ "<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>" })
    _44MAG_HP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 50,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -4,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 18,
            target_prop = "Noise",
        }),
    }
    _44MAG_HP.AppliedEffects = {
        "Bleeding",
    }

    _44MAG_Match.Cost = 260
    _44MAG_Match.AdditionalHint = T({ "<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling" })
    _44MAG_Match.Modifications = {
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
            mod_add = 18,
            target_prop = "Noise",
        }),
    }
    _44MAG_Match.AppliedEffects = {}

    -- TODO Shock Subsonic MAG

    print("GBO .44MAG DONE")
end

OnMsg.ClassesGenerate = GBO_44MAG