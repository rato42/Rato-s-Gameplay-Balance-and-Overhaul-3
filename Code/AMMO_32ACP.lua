-- ========== .32 ACP ==========
-- = Group 1: Small Caliber Pistols =
-- CritChance-4 CritDamage-3

function GBO_32ACP()
	print("GBO _32ACP .32 ACP ...")

	_32ACP_AP.AdditionalHint = T({ "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil" })
	_32ACP_AP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -23,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 12,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "CritChance",
		}),
	}

	_32ACP_Basic.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 12,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -3,
			target_prop = "CritDamage",
		}),
	}

	_32ACP_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>" })
	_32ACP_HP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 47,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 12,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "CritChance",
		}),
	}
	_32ACP_HP.AppliedEffects = {}

	_32ACP_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling" })
	_32ACP_Match.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 12,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -3,
			target_prop = "CritDamage",
		}),
	}
	_32ACP_Match.AppliedEffects = {}

	print("GBO _32ACP .32 ACP DONE")
end

OnMsg.ClassesGenerate = GBO_32ACP
