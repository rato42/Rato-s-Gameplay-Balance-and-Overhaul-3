-- ========== 4.6x30mm ==========
-- = Group 3: High-Velocity Small Calibers =
-- CritChance+2 CritDamage-2
function GBO_4_6x30()
	print("GBO _4_6x30 4.6x30mm ...")

	_4_6x30_AP.Cost = 300
	_4_6x30_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_4_6x30_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -22,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 16,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritChance",
		}),
	}

	_4_6x30_Basic.Cost = 150
	_4_6x30_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 16,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "CritDamage",
		}),
	}

	_4_6x30_HP.Cost = 300
	_4_6x30_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_4_6x30_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 48,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 16,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritChance",
		}),
	}
	_4_6x30_HP.AppliedEffects = {
		"Bleeding",
	}

	_4_6x30_Match.Cost = 300
	_4_6x30_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_4_6x30_Match.Modifications = {
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
			mod_add = 16,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "CritDamage",
		}),
	}
	_4_6x30_Match.AppliedEffects = {}

	print("GBO _4_6x30 4.6x30mm DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_4_6x30
