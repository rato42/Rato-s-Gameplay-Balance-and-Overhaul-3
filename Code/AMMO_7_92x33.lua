-- ========== 7.92x33mm Kurz ==========
-- = Group 5: Assault Rifle and Intermediate Cartridges =
-- Both calibers have similar stopping power, with the 7.62x39mm having a slight edge due to its higher velocity and energy. CritDamage-2 CritChance-2
function GBO_7_92x33()
	print("GBO _7_92x33 7.92x33mm ...")

	_7_92x33_AP.Cost = 270
	_7_92x33_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_7_92x33_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -22,
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
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "CritChance",
		}),
	}
	_7_92x33_AP.AppliedEffects = {}

	_7_92x33_Basic.Cost = 140
	_7_92x33_Basic.AdditionalHint = T({
		"",
	})
	_7_92x33_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 24,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "CritChance",
		}),
	}
	_7_92x33_Basic.AppliedEffects = {}

	_7_92x33_HP.Cost = 270
	_7_92x33_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_7_92x33_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 48,
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
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "CritChance",
		}),
	}
	_7_92x33_HP.AppliedEffects = {
		"Bleeding",
	}

	_7_92x33_Match.Cost = 270
	_7_92x33_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_7_92x33_Match.Modifications = {
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
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "CritChance",
		}),
	}
	_7_92x33_Match.AppliedEffects = {}

	print("GBO _7_92x33 7.92x33mm DONE")
end

OnMsg.ClassesGenerate = GBO_7_92x33

