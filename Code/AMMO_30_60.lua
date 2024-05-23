-- ========== _30_60 ==========

function GBO_30_60()
	print("GBO _30_60 ...")

	_30_60_AP.Cost = 180
	_30_60_AP.AdditionalHint = T({ "" }) -- TODO
	_30_60_AP.Modifications = {
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
	_30_60_AP.AppliedEffects = { -- TODO
	}

	_30_60_Basic.Cost = 90
	_30_60_Basic.AdditionalHint = T({ "" }) -- TODO
	_30_60_Basic.Modifications = {
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
	_30_60_Basic.AppliedEffects = { -- TODO
	}

	_30_60_HP.Cost = 180
	_30_60_HP.AdditionalHint = T({ "" }) -- TODO
	_30_60_HP.Modifications = {
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
	_30_60_HP.AppliedEffects = { -- TODO
		"Bleeding"
	}

	_30_60_Match.Cost = 180
	_30_60_Match.AdditionalHint = T({ "" }) -- TODO
	_30_60_Match.Modifications = {
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
	_30_60_Match.AppliedEffects = { -- TODO
	}

	print("GBO _30_60 DONE")
end

OnMsg.ClassesGenerate = GBO_30_60

