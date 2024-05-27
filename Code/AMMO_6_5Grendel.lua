-- ========== 6.5mm Grendel ==========
-- = Group 7: Precision and Long-Range Rifle Cartridges = 
-- It provides superior ballistic performance compared to the standard 5.56mm NATO round. CritDamage +10
function GBO_6_5Grendel()
	print("GBO _6_5Grendel 6.5mm Grendel ...")

	_6_5Grendel_AP.Cost = 320
	_6_5Grendel_AP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil",
	})
	_6_5Grendel_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -10,
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
	_6_5Grendel_AP.AppliedEffects = {}

	_6_5Grendel_Basic.Cost = 160
	_6_5Grendel_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 24,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritDamage",
		}),
	}
	_6_5Grendel_Basic.AppliedEffects = {}

	_6_5Grendel_HP.Cost = 320
	_6_5Grendel_HP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_6_5Grendel_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 60,
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
	_6_5Grendel_HP.AppliedEffects = {
		"Bleeding",
	}

	_6_5Grendel_Match.Cost = 320
	_6_5Grendel_Match.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling",
	})
	_6_5Grendel_Match.Modifications = {
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
			mod_add = 10,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 24,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	}
	_6_5Grendel_Match.AppliedEffects = {}

	print("GBO _6_5Grendel 6.5mm Grendel DONE")
end

OnMsg.ClassesGenerate = GBO_6_5Grendel

