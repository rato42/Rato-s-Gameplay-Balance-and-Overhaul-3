-- ========== .380ACP ==========
-- = Group 1: Small Caliber Pistols =
-- CritChance-3 CritDamage-3
function GBO_380ACP()
	print("GBO _380ACP .380ACP ...")

	_380ACP_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_380ACP_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -23,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 13,
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

	_380ACP_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 13,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -3,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -3,
			target_prop = "CritDamage",
		}),
	}

	_380ACP_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_380ACP_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 47,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 13,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -3,
			target_prop = "CritChance",
		}),
	}
	_380ACP_HP.AppliedEffects = {}

	_380ACP_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_380ACP_Match.Modifications = {
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
			mod_add = 13,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -3,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -3,
			target_prop = "CritDamage",
		}),
	}
	_380ACP_Match.AppliedEffects = {}

	print("GBO _380ACP .380ACP DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_380ACP
