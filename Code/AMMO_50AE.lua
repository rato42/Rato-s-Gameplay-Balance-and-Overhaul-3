-- ========== .50 AE ==========
-- = Group 4: Magnum and Large Caliber Pistols =
-- CritDamage+4 CritChance+2
function GBO_50AE()
	print("GBO _50AE .50 AE ...")

	_50AE_AP.Cost = 240
	_50AE_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_50AE_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -16,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 21,
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

	_50AE_Basic.Cost = 120
	_50AE_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 21,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "CritDamage",
		}),
	}

	_50AE_HP.Cost = 240
	_50AE_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_50AE_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 54,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 21,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritChance",
		}),
	}
	_50AE_HP.AppliedEffects = {
		"Bleeding",
	}

	_50AE_Match.Cost = 240
	_50AE_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_50AE_Match.Modifications = {
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
			mod_add = 21,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "CritDamage",
		}),
	}
	_50AE_Match.AppliedEffects = {}

	print("GBO _50AE .50 AE DONE")
end

OnMsg.ClassesGenerate = GBO_50AE
