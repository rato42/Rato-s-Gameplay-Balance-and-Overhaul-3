-- ========== .300 Blackout ==========
-- = Group 5: Assault Rifle and Intermediate Cartridges =
function GBO_300Blackout()
	print("GBO _300Blackout .300 Blackout ...")

	_300Blackout_AP.Cost = 400
	_300Blackout_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_300Blackout_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 23,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}
	_300Blackout_AP.AppliedEffects = {}

	_300Blackout_Basic.Cost = 200
	_300Blackout_Basic.AdditionalHint = T({
		"",
	})
	_300Blackout_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 23,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	}
	_300Blackout_Basic.AppliedEffects = {}

	_300Blackout_HP.Cost = 400
	_300Blackout_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_300Blackout_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 23,
			target_prop = "Noise",
		}),
	}
	_300Blackout_HP.AppliedEffects = {
		"Bleeding",
	}

	_300Blackout_Match.Cost = 400
	_300Blackout_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_300Blackout_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
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
			mod_add = 23,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	}
	_300Blackout_Match.AppliedEffects = {}

	-- TODO add Subsonic variant

	print("GBO _300Blackout .300 Blackout DONE")
end

OnMsg.ClassesGenerate = GBO_300Blackout

