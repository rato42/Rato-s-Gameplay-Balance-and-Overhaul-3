-- ========== 9×19mm Parabellum [Vanilla 9mm] [9mm Nato] ==========
-- = Group 2: Standard Service and Self-Defense Pistols =
function GBO_9x19()
	print("GBO 9x19 9×19mm Parabellum [Vanilla 9mm] ...")

	_9mm_AP.Cost = 120
	_9mm_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_9mm_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_9mm_Basic.Cost = 60
	_9mm_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "Noise",
		}),
	}

	_9mm_HP.Cost = 120
	_9mm_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_9mm_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "Noise",
		}),
	}

	_9mm_Match.Cost = 160
	_9mm_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_9mm_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "Noise",
		}),
	}

	_9mm_Shock.Cost = 180
	_9mm_Shock.AdditionalHint = T({
		"<bullet_point> Reduced range\n<bullet_point> Greater Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_9mm_Shock.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 70,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "Noise",
		}),
	}
	_9mm_Shock.AppliedEffects = {
		"Bleeding",
	}

	_9mm_Subsonic.Cost = 120
	_9mm_Subsonic.AdditionalHint = T({
		"<bullet_point> Less noisy\n<bullet_point> Less bullet speed, resulting in less Aim Accuracy, Range and no armor penetration",
	})
	_9mm_Subsonic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 15,
			mod_mul = 350,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -1,
			target_prop = "AimAccuracy",
		}),
	}

	_9mm_Tracer.Cost = 120
	_9mm_Tracer.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks",
	})
	_9mm_Tracer.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "tracer",
		}),
	}
	_9mm_Tracer.AppliedEffects = {
		"Marked",
		"Revealed_R",
	}

	print("GBO 9x19 9×19mm Parabellum [Vanilla 9mm] DONE")
end

OnMsg.ClassesGenerate = GBO_9x19
