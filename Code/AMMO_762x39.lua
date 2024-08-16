-- ========== 7.62x39mm [762WP Vanilla] ==========
-- = Group 5: Assault Rifle and Intermediate Cartridges =
function GBO_762x39()
	print("GBO 762x39 ...")

	_762WP_AP.Cost = 180
	_762WP_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_762WP_AP.Modifications = {
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

	_762WP_Basic.Cost = 90
	_762WP_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
	}

	_762WP_HP.Cost = 180
	_762WP_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_762WP_HP.Modifications = {
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
	_762WP_HP.AppliedEffects = {
		"Bleeding",
	}

	_762WP_Match.Cost = 240
	_762WP_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_762WP_Match.Modifications = {
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

	_762WP_Tracer.Cost = 180
	_762WP_Tracer.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks",
	})
	_762WP_Tracer.Modifications = {
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
	_762WP_Tracer.AppliedEffects = {
		"Marked",
		"Revealed_R",
	}

	print("GBO 762x39 DONE")
end

OnMsg.ClassesGenerate = GBO_762x39
