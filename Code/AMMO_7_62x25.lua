-- ========== 7.62x25mm ==========
-- = Group 3: High-Velocity Small Calibers =
-- CritChance+1 CritDamage+1
function GBO_7_62x25()
	print("GBO _7_62x25 7.62x25mm ...")

	_7_62x25_AP.Cost = 300
	_7_62x25_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_7_62x25_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -19,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 17,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
	}

	_7_62x25_Basic.Cost = 150
	_7_62x25_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 17,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritDamage",
		}),
	}

	_7_62x25_HP.Cost = 300
	_7_62x25_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_7_62x25_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 51,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 17,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
	}
	_7_62x25_HP.AppliedEffects = {
		"Bleeding",
	}

	_7_62x25_Match.Cost = 300
	_7_62x25_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_7_62x25_Match.Modifications = {
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
			mod_add = 17,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritDamage",
		}),
	}
	_7_62x25_Match.AppliedEffects = {}

	print("GBO _7_62x25 7.62x25mm DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_7_62x25
