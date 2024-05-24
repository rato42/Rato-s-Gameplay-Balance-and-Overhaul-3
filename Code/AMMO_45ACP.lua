-- ========== .45 ACP ==========

function GBO_45ACP()
	print("GBO _45ACP ...")

	_45ACP_AP.Cost = 190
	_45ACP_AP.AdditionalHint = T({ "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil" })
	_45ACP_AP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 17,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_45ACP_Basic.Cost = 100
	_45ACP_Basic.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 17,
			target_prop = "Noise",
		}),
	}

	_45ACP_HP.Cost = 190
	_45ACP_HP.AdditionalHint = T({ "<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>" })
	_45ACP_HP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 17,
			target_prop = "Noise",
		}),
	}
	_45ACP_HP.AppliedEffects = {
		"Bleeding",
	}

	_45ACP_Match.Cost = 250
	_45ACP_Match.AdditionalHint = T({ "<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling" })
	_45ACP_Match.Modifications = {
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
			mod_add = 17,
			target_prop = "Noise",
		}),
	}
	_45ACP_Match.AppliedEffects = {}

	print("GBO _45ACP DONE")
end

OnMsg.ClassesGenerate = GBO_45ACP
