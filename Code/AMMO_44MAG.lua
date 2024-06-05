-- ========== .44 Magnum(Revolvers) ==========
-- = Group 4: Magnum and Large Caliber Pistols =
-- CritDamage+2
function GBO_44MAG()
	print("GBO .44MAG .44 Magnum ...")

	_44MAG_AP.Cost = 200
	_44MAG_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil"})
	_44MAG_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = -18,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = 19,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		})}
	_44MAG_AP.AppliedEffects = {}

	_44MAG_Basic.Cost = 100
	_44MAG_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = 19,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritDamage",
		})}
	_44MAG_Basic.AppliedEffects = {}

	_44MAG_HP.Cost = 200
	_44MAG_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>"})
	_44MAG_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 52,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = 19,
			target_prop = "Noise",
		})}
	_44MAG_HP.AppliedEffects = {"Bleeding"}

	_44MAG_Match.Cost = 260
	_44MAG_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling"})
	_44MAG_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}), PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}), PlaceObj("CaliberModification", {
			mod_add = 19,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritDamage",
		})}
	_44MAG_Match.AppliedEffects = {}

	_44MAG_Tracer.Cost = 200
	_44MAG_Tracer.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks"})
	_44MAG_Tracer.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = 19,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "tracer",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritDamage",
		})}
	_44MAG_Tracer.AppliedEffects = {"Marked", "Revealed_R"}

	_44MAG_Shock.Cost = 300
	_44MAG_Shock.AdditionalHint = T({
		"<bullet_point> Reduced range\n<bullet_point> Greater Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>"})
	_44MAG_Shock.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 72,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "WeaponRange",
		}), PlaceObj("CaliberModification", {
			mod_add = 19,
			target_prop = "Noise",
		})}
	_44MAG_Shock.AppliedEffects = {"Exposed", "Bleeding"}

	_44MAG_Subsonic.Cost = 260
	_44MAG_Subsonic.AdditionalHint = T({
		"<bullet_point> Less noisy\n<bullet_point> Less bullet speed, resulting in less Aim Accuracy, Range and Armor Penetration"})
	_44MAG_Subsonic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 19,
			mod_mul = 500,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "WeaponRange",
		}), PlaceObj("CaliberModification", {
			mod_add = -1,
			target_prop = "AimAccuracy",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritDamage",
		})}
	_44MAG_Subsonic.AppliedEffects = {}

	print("GBO .44MAG .44 Magnum DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_44MAG
