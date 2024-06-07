-- ========== .308 Winchester ==========
-- = Group 6: Battle Rifle and Full-Power Rifle Cartridges =
-- The civilian counterpart of the 7.62x51mm NATO (7.62 NATO) [762NATO Vanilla]
function GBO_308Win()
	print("GBO _308Win .308 Winchester ...")

	_308Win_AP.Cost = 340
	_308Win_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_308Win_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 30,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_308Win_Basic.Cost = 170
	_308Win_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 30,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	}

	_308Win_Tracer.Cost = 340
	_308Win_Tracer.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks",
	})
	_308Win_Tracer.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 30,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "tracer",
		}),
	}
	_308Win_Tracer.AppliedEffects = {
		"Marked",
		"Revealed_R",
	}

	_308Win_HP.Cost = 340
	_308Win_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_308Win_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 30,
			target_prop = "Noise",
		}),
	}
	_308Win_HP.AppliedEffects = {
		"Bleeding",
	}

	_308Win_Match.Cost = 450
	_308Win_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_308Win_Match.Modifications = {
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
			mod_add = 30,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	}
	_308Win_Match.AppliedEffects = {}

	print("GBO _308Win .308 Winchester DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_308Win

