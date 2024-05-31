-- ========== .22LR ==========
-- = Group 1: Small Caliber Pistols =
-- CritChance-4 CritDamage-4
function GBO_22LR()
	print("GBO _22LR .22LR ...")

	_22LR_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_22LR_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -24,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 12,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "CritChance",
		}),
	}

	_22LR_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 12,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "CritDamage",
		}),
	}

	_22LR_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_22LR_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 46,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 12,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "CritChance",
		}),
	}
	_22LR_HP.AppliedEffects = {}

	_22LR_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_22LR_Match.Modifications = {
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
			mod_add = 12,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "CritDamage",
		}),
	}
	_22LR_Match.AppliedEffects = {}

	print("GBO _22LR .22LR DONE")
end

OnMsg.ClassesGenerate = GBO_22LR
