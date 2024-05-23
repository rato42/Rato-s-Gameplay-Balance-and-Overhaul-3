-- ========== _308Win ==========

function GBO_308Win()
	print("GBO _308Win ...")

	_308Win_AP.Cost = 300
	_308Win_AP.AdditionalHint = T({ "" }) -- TODO
	_308Win_AP.Modifications = {
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
	_308Win_AP.AppliedEffects = { -- TODO
	}

	_308Win_Basic.Cost = 150
	_308Win_Basic.AdditionalHint = T({ "" }) -- TODO
	_308Win_Basic.Modifications = {
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
	_308Win_Basic.AppliedEffects = { -- TODO
	}

	_308Win_HP.Cost = 300
	_308Win_HP.AdditionalHint = T({ "" }) -- TODO
	_308Win_HP.Modifications = {
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
	_308Win_HP.AppliedEffects = { -- TODO
		"Bleeding"
	}

	_308Win_Match.Cost = 300
	_308Win_Match.AdditionalHint = T({ "" }) -- TODO
	_308Win_Match.Modifications = {
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
	_308Win_Match.AppliedEffects = { -- TODO
	}

	print("GBO _308Win DONE")
end

OnMsg.ClassesGenerate = GBO_308Win

