-- ========== .300 Winchester Magnum ==========
-- = Group 7: Precision and Long-Range Rifle Cartridges = 
-- Long-range, high power.
function GBO_300WinMag()
	print("GBO _300WinMag .300 Winchester Magnum ...")

	_300WinMag_AP.Cost = 400
	_300WinMag_AP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil",
	})
	_300WinMag_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -15,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 26,
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
	_300WinMag_AP.AppliedEffects = {}

	_300WinMag_Basic.Cost = 200
	_300WinMag_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 26,
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
		PlaceObj("CaliberModification", {
			mod_add = 5,
			target_prop = "CritDamage",
		}),
	}
	_300WinMag_Basic.AppliedEffects = {}

	_300WinMag_HP.Cost = 400
	_300WinMag_HP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_300WinMag_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 55,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 26,
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
	_300WinMag_HP.AppliedEffects = {
		"Bleeding",
	}

	_300WinMag_Match.Cost = 400
	_300WinMag_Match.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling",
	})
	_300WinMag_Match.Modifications = {
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
			mod_add = 26,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 5,
			target_prop = "CritDamage",
		}),
	}
	_300WinMag_Match.AppliedEffects = {}

	print("GBO _300WinMag .300 Winchester Magnum DONE")
end

OnMsg.ClassesGenerate = GBO_300WinMag

