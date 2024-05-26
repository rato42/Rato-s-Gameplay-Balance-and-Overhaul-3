-- ========== .44 [Vanilla 44CAL] ==========
-- = Group 4: Magnum and Large Caliber Pistols =
-- CritDamage+2

function GBO_44CAL()
    print("GBO .44CAL .44 [Vanilla 44CAL] ...")

    _44CAL_AP.Cost = 200
    _44CAL_AP.AdditionalHint = T({ "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil" })
    _44CAL_AP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 2,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -18,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 19,
            target_prop = "Noise",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 1,
            target_prop = "ArmorPir",
        }),
    }
    _44CAL_AP.AppliedEffects = {}

    _44CAL_Basic.Cost = 100
    _44CAL_Basic.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 19,
            target_prop = "Noise",
        }),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "CritDamage",
		}),
    }
    _44CAL_Basic.AppliedEffects = {}

    _44CAL_HP.Cost = 200
    _44CAL_HP.AdditionalHint = T({ "<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>" })
    _44CAL_HP.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 52,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -4,
            target_prop = "PenetrationClass",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 19,
            target_prop = "Noise",
        }),
    }
    _44CAL_HP.AppliedEffects = {
        "Bleeding",
    }

    _44CAL_Match.Cost = 260
    _44CAL_Match.AdditionalHint = T({ "<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling" })
    _44CAL_Match.Modifications = {
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
            mod_add = 19,
            target_prop = "Noise",
        }),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "CritDamage",
		}),
    }
    _44CAL_Match.AppliedEffects = {}

    _44CAL_Shock.Cost = 300
    _44CAL_Shock.AdditionalHint = T({
        "<bullet_point> Reduced range\n<bullet_point> No armor penetration\n<bullet_point> Greater Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>" })
    _44CAL_Shock.Modifications = {
        PlaceObj('CaliberModification', {
            mod_add = 72,
            target_prop = "CritDamage",
        }),
        PlaceObj('CaliberModification', {
            mod_add = -4,
            target_prop = "WeaponRange",
        }),
        PlaceObj('CaliberModification', {
            mod_add = 19,
            target_prop = "Noise",
        }),
    }
    _44CAL_Shock.AppliedEffects = {
        "Bleeding",
    }

    -- TODO _44CAL_Subsonic.lua

    print("GBO .44CAL .44 [Vanilla 44CAL] DONE")
end

OnMsg.ClassesGenerate = GBO_44CAL
