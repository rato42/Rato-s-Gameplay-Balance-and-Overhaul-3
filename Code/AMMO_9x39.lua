-- ========== 9x39 mm ==========
-- Group 10: Miscellaneous and Special Purpose Cartridges
-- Subsonic cartridge, used in suppressed firearms. 7.62x39mm is the closest standard caliber to the 9x39mm when not considering the subsonic nature of the latter. Both cartridges share a similar case design and are used in similar role.
function GBO_9x39()
	print("GBO _9x39 9x39 mm ...")

	_9x39_AP.Cost = 360
	_9x39_AP.AdditionalHint = T({
		"<bullet_point> Quieter due to its subsonic nature\n<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_9x39_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -20,
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
	}

	_9x39_Basic.Cost = 180
	_9x39_Basic.AdditionalHint = T({
		"<bullet_point> Quieter due to its subsonic nature",
	})
	_9x39_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 13,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
	}

	_9x39_HP.Cost = 360
	_9x39_HP.AdditionalHint = T({
		"<bullet_point> Quieter due to its subsonic nature\n<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_9x39_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
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
	}
	_9x39_HP.AppliedEffects = { -- TODO
		"Bleeding",
	}

	_9x39_Match.Cost = 360
	_9x39_Match.AdditionalHint = T({
		"<bullet_point> Quieter due to its subsonic nature\n<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_9x39_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 13,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	}
	_9x39_Match.AppliedEffects = {}

	print("GBO _9x39 9x39 mm DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_9x39
