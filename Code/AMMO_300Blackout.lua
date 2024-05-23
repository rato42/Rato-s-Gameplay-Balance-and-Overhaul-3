-- ========== _300Blackout ==========

function GBO_300Blackout()
	print("GBO _300Blackout ...")

	_300Blackout_AP.Cost = 300
	_300Blackout_AP.AdditionalHint = T({ "" }) -- TODO
	_300Blackout_AP.Modifications = {
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
	_300Blackout_AP.AppliedEffects = { -- TODO
	}

	_300Blackout_Basic.Cost = 150
	_300Blackout_Basic.AdditionalHint = T({ "" }) -- TODO
	_300Blackout_Basic.Modifications = {
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
	_300Blackout_Basic.AppliedEffects = { -- TODO
	}

	_300Blackout_HP.Cost = 300
	_300Blackout_HP.AdditionalHint = T({ "" }) -- TODO
	_300Blackout_HP.Modifications = {
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
	_300Blackout_HP.AppliedEffects = { -- TODO
		"Bleeding"
	}

	_300Blackout_Match.Cost = 300
	_300Blackout_Match.AdditionalHint = T({ "" }) -- TODO
	_300Blackout_Match.Modifications = {
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
	_300Blackout_Match.AppliedEffects = { -- TODO
	}

	print("GBO _300Blackout DONE")
end

OnMsg.ClassesGenerate = GBO_300Blackout

