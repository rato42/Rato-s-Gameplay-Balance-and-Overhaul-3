-- ========== .40 S&W ==========
-- = Group 2: Standard Service and Self-Defense Pistols =
-- Designed as a compromise between 9x19mm and .45 ACP. CritDamage+1

function GBO_40SW()
	print("GBO _40SW .40 S&W ...")

	_40SW_AP.Cost = 190
	_40SW_AP.AdditionalHint = T({ "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil" })
	_40SW_AP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -19,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 16,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_40SW_Basic.Cost = 100
	_40SW_Basic.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 16,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "CritDamage",
		}),
	}

	_40SW_HP.Cost = 200
	_40SW_HP.AdditionalHint = T({ "<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>" })
	_40SW_HP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 51,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 16,
			target_prop = "Noise",
		}),
	}
	_40SW_HP.AppliedEffects = {
		"Bleeding",
	}

	_40SW_Match.Cost = 260
	_40SW_Match.AdditionalHint = T({ "<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling" })
	_40SW_Match.Modifications = {
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
			mod_add = 1,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 16,
			target_prop = "Noise",
		}),
	}
	_40SW_Match.AppliedEffects = {}

	print("GBO _40SW .40 S&W DONE")
end

OnMsg.ClassesGenerate = GBO_40SW
