-- ========== 5.7x28mm ==========
-- = Group 3: High-Velocity Small Calibers =
-- CritChance+1 CritDamage-1
function GBO_5_7x28()
    print("GBO _5_7x28 5.7x28mm ...")

    _5_7x28_AP.Cost = 300
    _5_7x28_AP.AdditionalHint = T({
        "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil"
    })
    _5_7x28_AP.Modifications = {
        PlaceObj("CaliberModification", {mod_add = 3, target_prop = "PenetrationClass"}),
        PlaceObj("CaliberModification", {mod_add = -21, target_prop = "CritDamage"}),
        PlaceObj("CaliberModification", {mod_add = 16, target_prop = "Noise"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "ArmorPir"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "CritChance"})
    }

    _5_7x28_Basic.Cost = 150
    _5_7x28_Basic.Modifications = {
        PlaceObj("CaliberModification", {mod_add = 16, target_prop = "Noise"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "PenetrationClass"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "CritChance"}),
        PlaceObj("CaliberModification", {mod_add = -1, target_prop = "CritDamage"})
    }

    _5_7x28_Tracer.Cost = 300
    _5_7x28_Tracer.AdditionalHint = T({
        "<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks"
    })
    _5_7x28_Tracer.Modifications = {
        PlaceObj("CaliberModification", {mod_add = 16, target_prop = "Noise"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "PenetrationClass"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "tracer"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "CritChance"}),
        PlaceObj("CaliberModification", {mod_add = -1, target_prop = "CritDamage"})
    }
    _5_7x28_Tracer.AppliedEffects = {"Marked", "Revealed_R"}

    _5_7x28_HP.Cost = 300
    _5_7x28_HP.AdditionalHint = T({
        "<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>"
    })
    _5_7x28_HP.Modifications = {
        PlaceObj("CaliberModification", {mod_add = 49, target_prop = "CritDamage"}),
        PlaceObj("CaliberModification", {mod_add = -4, target_prop = "PenetrationClass"}),
        PlaceObj("CaliberModification", {mod_add = 16, target_prop = "Noise"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "CritChance"})
    }
    _5_7x28_HP.AppliedEffects = {"Bleeding"}

    _5_7x28_Match.Cost = 300
    _5_7x28_Match.AdditionalHint = T({
        "<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling"
    })
    _5_7x28_Match.Modifications = {
        PlaceObj("CaliberModification", {mod_add = 2, target_prop = "AimAccuracy"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "PenetrationClass"}),
        PlaceObj("CaliberModification", {mod_add = 2, target_prop = "WeaponRange"}),
        PlaceObj("CaliberModification", {mod_add = 10, target_prop = "CritChanceScaled"}),
        PlaceObj("CaliberModification", {mod_add = 16, target_prop = "Noise"}),
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "CritChance"}),
        PlaceObj("CaliberModification", {mod_add = -1, target_prop = "CritDamage"})
    }
    _5_7x28_Match.AppliedEffects = {}

    print("GBO _5_7x28 5.7x28mm DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_5_7x28

