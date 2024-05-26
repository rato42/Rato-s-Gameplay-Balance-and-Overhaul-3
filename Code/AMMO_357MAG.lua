-- ========== .357 Magnum ==========
-- = Group 2: Standard Service and Self-Defense Pistols =
--  High stopping power. CritChance+1

function GBO_357MAG()
	print("GBO _357MAG .357 Magnum ...")

	_357MAG_AP.Cost = 220
	_357MAG_AP.AdditionalHint = T({ "<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil" })
	_357MAG_AP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 20,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_357MAG_Basic.Cost = 110
	_357MAG_Basic.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 20,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "CritChance",
		}),
	}

	_357MAG_HP.Cost = 220
	_357MAG_HP.AdditionalHint = T({ "<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>" })
	_357MAG_HP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 20,
			target_prop = "Noise",
		}),
	}
	_357MAG_HP.AppliedEffects = {
		"Bleeding"
	}

	_357MAG_Match.Cost = 220
	_357MAG_Match.AdditionalHint = T({ "<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling" })
	_357MAG_Match.Modifications = {
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
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 20,
			target_prop = "Noise",
		}),
	}
	_357MAG_Match.AppliedEffects = {}

	print("GBO _357MAG .357 Magnum DONE")
end

OnMsg.ClassesGenerate = GBO_357MAG
