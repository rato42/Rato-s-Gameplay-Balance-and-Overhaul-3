-- ========== 6.5 Creedmoor ==========
-- = Group 7: Precision and Long-Range Rifle Cartridges = 
-- Long-range precision, moderate recoil.
function GBO_6_5Creedmoor()
	print("GBO _6_5Creedmoor 6.5 Creedmoor ...")

	_6_5Creedmoor_AP.Cost = 350
	_6_5Creedmoor_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_6_5Creedmoor_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "WeaponRange",
		}),
	}
	_6_5Creedmoor_AP.AppliedEffects = {}

	_6_5Creedmoor_Basic.Cost = 180
	_6_5Creedmoor_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "WeaponRange",
		}),
	}
	_6_5Creedmoor_Basic.AppliedEffects = {}

	_6_5Creedmoor_HP.Cost = 350
	_6_5Creedmoor_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_6_5Creedmoor_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "WeaponRange",
		}),
	}
	_6_5Creedmoor_HP.AppliedEffects = {
		"Bleeding",
	}

	_6_5Creedmoor_Match.Cost = 350
	_6_5Creedmoor_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_6_5Creedmoor_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	}
	_6_5Creedmoor_Match.AppliedEffects = {}

	print("GBO _6_5Creedmoor 6.5 Creedmoor DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_6_5Creedmoor

