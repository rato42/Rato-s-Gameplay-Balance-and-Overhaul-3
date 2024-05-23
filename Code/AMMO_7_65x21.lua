-- ========== _7_65x21 ==========

function GBO_7_65x21()
	print("GBO _7_65x21 ...")

	_7_65x21_AP.Cost = 180
	_7_65x21_AP.AdditionalHint = T({ "" }) -- TODO
	_7_65x21_AP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "AimAccuracy",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "ArmorPir",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "WeaponRange",
		}),
	}
	_7_65x21_AP.AppliedEffects = { -- TODO
	}

	_7_65x21_Basic.Cost = 90
	_7_65x21_Basic.AdditionalHint = T({ "" }) -- TODO
	_7_65x21_Basic.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "AimAccuracy",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "ArmorPir",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "WeaponRange",
		}),
	}
	_7_65x21_Basic.AppliedEffects = { -- TODO
	}

	_7_65x21_HP.Cost = 180
	_7_65x21_HP.AdditionalHint = T({ "" }) -- TODO
	_7_65x21_HP.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "AimAccuracy",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "ArmorPir",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "WeaponRange",
		}),
	}
	_7_65x21_HP.AppliedEffects = { -- TODO
		"Bleeding"
	}

	_7_65x21_Match.Cost = 180
	_7_65x21_Match.AdditionalHint = T({ "" }) -- TODO
	_7_65x21_Match.Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "AimAccuracy",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "ArmorPir",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 0, -- TODO
			target_prop = "WeaponRange",
		}),
	}
	_7_65x21_Match.AppliedEffects = { -- TODO
	}

	print("GBO _7_65x21 DONE")
end

OnMsg.ClassesGenerate = GBO_7_65x21

