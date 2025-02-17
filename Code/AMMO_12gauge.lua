-- ========== 12-gauge [Vanilla 12-gauge] ==========
function GBO_12gauge()
    print("GBO 12gauge ...")

    _12gauge_Breacher.Cost = 240
    _12gauge_Breacher.AdditionalHint = T({
        "<bullet_point> Very short range\n<bullet_point> Wide attack cone\n<bullet_point> Improved armor penetration\n<bullet_point> Prevents Grazing hits due to opponents Taking Cover\n<bullet_point> Inflicts <color EmStyle>Suppressed</color>"
    })
    _12gauge_Breacher.Modifications = {
        PlaceObj("CaliberModification", {mod_add = 1, target_prop = "IgnoreCoverReduction"}),
        PlaceObj("CaliberModification", {mod_mul = 500, target_prop = "WeaponRange"}),
        PlaceObj("CaliberModification", {mod_add = 2, target_prop = "PenetrationClass"}),
        PlaceObj("CaliberModification", {mod_mul = 2000, target_prop = "ObjDamageMod"}),
        PlaceObj("CaliberModification", {mod_mul = 1700, target_prop = "BuckshotConeAngle"}),
        PlaceObj("CaliberModification", {mod_add = 34, target_prop = "Noise"})
    }
    _12gauge_Breacher.AppliedEffects = {"Suppressed"}

    _12gauge_Buckshot.Cost = 120
    _12gauge_Buckshot.Modifications = {
        PlaceObj("CaliberModification", {mod_add = 34, target_prop = "Noise"})
    }
    _12gauge_Buckshot.AppliedEffects = {}

    _12gauge_Flechette.Cost = 240
    _12gauge_Flechette.AdditionalHint = T({
        "<bullet_point> Longer range\n<bullet_point> Less damage\n<bullet_point> Narrow attack cone\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>"
    })
    _12gauge_Flechette.Modifications = {
        PlaceObj("CaliberModification", {mod_mul = 800, target_prop = "BuckshotConeAngle"}),
        PlaceObj("CaliberModification", {mod_mul = 750, target_prop = "Damage"}),
        PlaceObj("CaliberModification", {mod_add = 2, target_prop = "WeaponRange"}),
        PlaceObj("CaliberModification", {mod_add = 34, target_prop = "Noise"})
    }
    _12gauge_Flechette.AppliedEffects = {"Bleeding"}

    _12gauge_Saltshot.Cost = 240
    _12gauge_Saltshot.AdditionalHint = T({
        "<bullet_point> Low damage\n<bullet_point> Shorter range\n<bullet_point> Wide attack cone\n<bullet_point> Inflicts <color EmStyle>Inaccurate</color> and <color EmStyle>Slowed</color>"
    })
    _12gauge_Saltshot.Modifications = {
        PlaceObj("CaliberModification", {mod_mul = 500, target_prop = "Damage"}),
        PlaceObj("CaliberModification", {mod_mul = 1700, target_prop = "BuckshotConeAngle"}),
        PlaceObj("CaliberModification", {mod_add = 34, target_prop = "Noise"})
    }
    _12gauge_Saltshot.AppliedEffects = {"Inaccurate", "Slowed"}

    print("GBO 12gauge DONE")
end

-- OnMsg.ClassesGenerate = GBO_12gauge
