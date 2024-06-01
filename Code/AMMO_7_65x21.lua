-- ========== 7.65x21mm ==========
-- = Group 1: Small Caliber Pistols =
-- CritChance-3 CritDamage-4
function GBO_7_65x21()
	print("GBO _7_65x21 7.65x21mm ...")

	_7_65x21_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_7_65x21_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -24,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 14,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -3,
			target_prop = "CritChance",
		}),
	}

	_7_65x21_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 14,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -3,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "CritDamage",
		}),
	}

	_7_65x21_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_7_65x21_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 46,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 14,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -3,
			target_prop = "CritChance",
		}),
	}
	_7_65x21_HP.AppliedEffects = {}

	_7_65x21_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_7_65x21_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 14,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -3,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "CritDamage",
		}),
	}
	_7_65x21_Match.AppliedEffects = {}

	print("GBO _7_65x21 7.65x21mm DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_7_65x21
