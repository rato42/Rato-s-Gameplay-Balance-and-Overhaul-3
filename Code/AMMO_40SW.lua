-- ========== _40SW ==========

function GBO_40SW()
	print("GBO _40SW ...")

	_40SW_AP.Cost = 180
	_40SW_AP.AdditionalHint = T({ "" }) -- TODO
	_40SW_AP.Modifications = {
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
	_40SW_AP.AppliedEffects = { -- TODO
	}

	_40SW_Basic.Cost = 90
	_40SW_Basic.AdditionalHint = T({ "" }) -- TODO
	_40SW_Basic.Modifications = {
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
	_40SW_Basic.AppliedEffects = { -- TODO
	}

	_40SW_HP.Cost = 180
	_40SW_HP.AdditionalHint = T({ "" }) -- TODO
	_40SW_HP.Modifications = {
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
	_40SW_HP.AppliedEffects = { -- TODO
		"Bleeding"
	}

	_40SW_Match.Cost = 180
	_40SW_Match.AdditionalHint = T({ "" }) -- TODO
	_40SW_Match.Modifications = {
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
	_40SW_Match.AppliedEffects = { -- TODO
	}

	print("GBO _40SW DONE")
end

OnMsg.ClassesGenerate = GBO_40SW

