-- ========== 7.62x54mmR ==========
-- = Group 6: Battle Rifle and Full-Power Rifle Cartridges =
function GBO_762x54()
	print("GBO 762x54 ...")

	_7_62x54_AP.Cost = 360
	_7_62x54_AP.Icon = "Mod/cfahRED/Images/bearAP.png"
	_7_62x54_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_7_62x54_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 32,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_7_62x54_Basic.Cost = 180
	_7_62x54_Basic.Icon = "Mod/cfahRED/Images/standardBewar.png"
	_7_62x54_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 32,
			target_prop = "Noise",
		}),
	}

	_7_62x54_Tracer.Cost = 360
	_7_62x54_Tracer.Icon = "Mod/cfahRED/Images/bearTracer.png"
	_7_62x54_Tracer.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks",
	})
	_7_62x54_Tracer.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 32,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "tracer",
		}),
	}
	_7_62x54_Tracer.AppliedEffects = {
		"Marked",
		"Revealed_R",
	}

	_7_62x54_HP.Cost = 360
	_7_62x54_HP.Icon = "Mod/cfahRED/Images/bearHP.png"
	_7_62x54_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_7_62x54_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 32,
			target_prop = "Noise",
		}),
	}
	_7_62x54_HP.AppliedEffects = {
		"Bleeding",
	}

	_7_62x54_Match.Cost = 400
	_7_62x54_Match.Icon = "Mod/cfahRED/Images/MAtchBear.png"
	_7_62x54_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_7_62x54_Match.Modifications = {
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
			mod_add = 32,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	}

	print("GBO 762x54 DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_762x54
