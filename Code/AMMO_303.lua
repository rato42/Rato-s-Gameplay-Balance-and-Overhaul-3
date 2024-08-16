-- ========== .303 British ==========
-- = Group 8: Military Surplus and Obsolete Cartridges =
-- Historically significant, used in older military rifles.
function GBO_303()
	print("GBO _303 .303 British ...")

	_303_AP.Cost = 200
	_303_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_303_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
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
	}
	_303_AP.AppliedEffects = {}

	_303_Basic.Cost = 100
	_303_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
	}
	_303_Basic.AppliedEffects = {}

	_303_Tracer.Cost = 200
	_303_Tracer.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks",
	})
	_303_Tracer.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "tracer",
		}),
	}
	_303_Tracer.AppliedEffects = {
		"Marked",
		"Revealed_R",
	}

	_303_HP.Cost = 200
	_303_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_303_HP.Modifications = {
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
	}
	_303_HP.AppliedEffects = {
		"Bleeding",
	}

	_303_Match.Cost = 200
	_303_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_303_Match.Modifications = {
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
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	}
	_303_Match.AppliedEffects = {}

	print("GBO _303 .303 British DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_303

