-- ==========  7.62x51mm NATO (7.62 NATO) [762NATO Vanilla] ==========
-- = Group 6: Battle Rifle and Full-Power Rifle Cartridges =
function GBO_762x51()
    print("GBO 762x51 7.62 NATO ...")

    _762NATO_AP.Cost = 340
    _762NATO_AP.AdditionalHint = T({
        "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil"
    })
    _762NATO_AP.Modifications = {
        PlaceObj("CaliberModification",
                 {
            mod_add = 4,
            target_prop = "PenetrationClass"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = -20,
            target_prop = "CritDamage"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 30,
            target_prop = "Noise"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 1,
            target_prop = "ArmorPir"
        })
    }

    _762NATO_Basic.Cost = 170
    _762NATO_Basic.Modifications = {
        PlaceObj("CaliberModification",
                 {
            mod_add = 30,
            target_prop = "Noise"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 2,
            target_prop = "PenetrationClass"
        })
    }

    _762NATO_HP.Cost = 340
    _762NATO_HP.AdditionalHint = T({
        "<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color> "
    })
    _762NATO_HP.Modifications = {
        PlaceObj("CaliberModification",
                 {
            mod_add = 50,
            target_prop = "CritDamage"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = -4,
            target_prop = "PenetrationClass"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 30,
            target_prop = "Noise"
        })
    }
    _762NATO_HP.AppliedEffects = {
        "Bleeding"
    }

    _762NATO_Match.Cost = 450
    _762NATO_Match.AdditionalHint = T({
        "<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling"
    })
    _762NATO_Match.Modifications = {
        PlaceObj("CaliberModification",
                 {
            mod_add = 2,
            target_prop = "PenetrationClass"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 10,
            target_prop = "CritChanceScaled"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 2,
            target_prop = "WeaponRange"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 30,
            target_prop = "Noise"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 2,
            target_prop = "AimAccuracy"
        })
    }

    _762NATO_Tracer.Cost = 340
    _762NATO_Tracer.AdditionalHint = T({
        "<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks"
    })
    _762NATO_Tracer.Modifications = {
        PlaceObj("CaliberModification",
                 {
            mod_add = 2,
            target_prop = "PenetrationClass"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 30,
            target_prop = "Noise"
        }),
        PlaceObj("CaliberModification",
                 {
            mod_add = 1,
            target_prop = "tracer"
        })
    }
    _762NATO_Tracer.AppliedEffects = {
        "Marked", "Revealed_R"
    }

    print("GBO 762x51 7.62 NATO DONE")
end

OnMsg.ClassesGenerate = GBO_762x51
