-- ========== 7.5×54mm French ==========
-- = Group 8: Military Surplus and Obsolete Cartridges =
-- Historically significant, used in older military rifles.
function GBO_7_5x54()
	print("GBO _7_5x54 7.5×54mm French ...")

	_7_5x54_AP.Cost = 200
	_7_5x54_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_7_5x54_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 24,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}
	_7_5x54_AP.AppliedEffects = {}

	_7_5x54_Basic.Cost = 100
	_7_5x54_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 24,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
	}
	_7_5x54_Basic.AppliedEffects = {}

	_7_5x54_Tracer.Cost = 200
	_7_5x54_Tracer.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks",
	})
	_7_5x54_Tracer.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 24,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "tracer",
		}),
	}
	_7_5x54_Tracer.AppliedEffects = {
		"Marked",
		"Revealed_R",
	}

	_7_5x54_HP.Cost = 200
	_7_5x54_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_7_5x54_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 24,
			target_prop = "Noise",
		}),
	}
	_7_5x54_HP.AppliedEffects = {
		"Bleeding",
	}

	_7_5x54_Match.Cost = 200
	_7_5x54_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_7_5x54_Match.Modifications = {
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
			mod_add = 24,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	}
	_7_5x54_Match.AppliedEffects = {}

	print("GBO _7_5x54 7.5×54mm French DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_7_5x54

