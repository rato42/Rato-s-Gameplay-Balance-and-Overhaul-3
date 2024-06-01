-- ========== 5,45 x 39 mm ==========
-- = Group 5: Assault Rifle and Intermediate Cartridges =
-- Successor to 7.62x39 [762WP Vanilla]. CritChance+15
function GBO_545x39()
	print("GBO 545x39 ...")

	_5_45x39_AP.Icon = "Mod/cfahRED/Images/545ap.png"
	_5_45x39_AP.Cost = 300
	_5_45x39_AP.Description = T({
		"5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns.",
	})
	_5_45x39_AP.AdditionalHint = T({
		"<bullet_point> Tumbling effects increase Critical Chance\n<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_5_45x39_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -10,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_5_45x39_Basic.Icon = "Mod/cfahRED/Images/545standard 2.png"
	_5_45x39_Basic.Cost = 150
	_5_45x39_Basic.Description = T({
		"5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns.",
	})
	_5_45x39_Basic.AdditionalHint = T({
		"<bullet_point> Tumbling effects increase Critical Chance",
	})
	_5_45x39_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 22,
			target_prop = "Noise",
		}),
	}

	_5_45x39_HP.Icon = "Mod/cfahRED/Images/545hp.png"
	_5_45x39_HP.Cost = 300
	_5_45x39_HP.Description = T({
		"5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns.",
	})
	_5_45x39_HP.AdditionalHint = T({
		"<bullet_point> Tumbling effects increase Critical Chance\n<bullet_point> No armor penetration\n<bullet_point> Increased Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_5_45x39_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
	}
	_5_45x39_HP.AppliedEffects = {
		"Bleeding",
	}

	_5_45x39_Match.Icon = "Mod/cfahRED/Images/545match.png"
	_5_45x39_Match.Cost = 400
	_5_45x39_Match.Description = T({
		"5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns.",
	})
	_5_45x39_Match.AdditionalHint = T({
		"<bullet_point> Tumbling effects increase Critical Chance\n<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_5_45x39_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
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
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "CritChance",
		}),
	}

	-- TODO _54539_Tracer.lua

	print("GBO 545x39 DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_545x39
