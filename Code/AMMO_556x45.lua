-- ========== 5,56 × 45 mm [556 Vanilla] ==========
-- = Group ?: 5/6 =
function GBO_556x45()
	print("GBO 556x45 ...")

	_556_AP.Cost = 300
	_556_AP.AdditionalHint = T({
		"<bullet_point> Fragmentation effects increase Critical Damage\n<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil"})
	_556_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = 20,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = 23,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		})}

	_556_Basic.Cost = 150
	_556_Basic.AdditionalHint = T({"<bullet_point> Fragmentation effects increase Critical Damage"})
	_556_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 23,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = 30,
			target_prop = "CritDamage",
		})}

	_556_HP.Cost = 300
	_556_HP.AdditionalHint = T({
		"<bullet_point> Fragmentation effects increase Critical Damage\n<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color> "})
	_556_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 80,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = 23,
			target_prop = "Noise",
		})}
	_556_HP.AppliedEffects = {"Bleeding"}

	_556_Match.Cost = 400
	_556_Match.AdditionalHint = T({
		"<bullet_point> Fragmentation effects increase Critical Damage\n<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling"})
	_556_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}), PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}), PlaceObj("CaliberModification", {
			mod_add = 30,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = 23,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		})}

	_556_Tracer.Cost = 300
	_556_Tracer.AdditionalHint = T({
		"<bullet_point> Fragmentation effects increase Critical Damage\n<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks"})
	_556_Tracer.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 30,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = 23,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "tracer",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		})}
	_556_Tracer.AppliedEffects = {"Marked", "Revealed_R"}

	print("GBO 556x45 DONE")
end

OnMsg.ClassesGenerate = GBO_556x45
