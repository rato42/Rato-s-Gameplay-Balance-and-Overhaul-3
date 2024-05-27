-- ========== 6.5 Creedmoor ==========
-- = Group 7: Precision and Long-Range Rifle Cartridges = 
-- Long-range precision, moderate recoil.
function GBO_6_5Creedmoor()
	print("GBO _6_5Creedmoor 6.5 Creedmoor ...")

	_6_5Creedmoor_AP.Cost = 350
	_6_5Creedmoor_AP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil",
	})
	_6_5Creedmoor_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
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
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "WeaponRange",
		}),
	}
	_6_5Creedmoor_AP.AppliedEffects = {}

	_6_5Creedmoor_Basic.Cost = 180
	_6_5Creedmoor_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "WeaponRange",
		}),
	}
	_6_5Creedmoor_Basic.AppliedEffects = {}

	_6_5Creedmoor_HP.Cost = 350
	_6_5Creedmoor_HP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_6_5Creedmoor_HP.Modifications = {
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
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "WeaponRange",
		}),
	}
	_6_5Creedmoor_HP.AppliedEffects = {
		"Bleeding",
	}

	_6_5Creedmoor_Match.Cost = 350
	_6_5Creedmoor_Match.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling",
	})
	_6_5Creedmoor_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	}
	_6_5Creedmoor_Match.AppliedEffects = {}

	print("GBO _6_5Creedmoor 6.5 Creedmoor DONE")
end

OnMsg.ClassesGenerate = GBO_6_5Creedmoor

