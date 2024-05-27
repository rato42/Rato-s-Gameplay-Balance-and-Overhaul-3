-- ========== .338 Lapua Magnum ==========
-- = Group 7: Precision and Long-Range Rifle Cartridges =
-- Extreme long-range, superior accuracy 
function GBO_338_Lapua_Magnum()
	print("GBO _338_Lapua_Magnum .338 Lapua Magnum ...")

	_338_Lapua_Magnum_AP.Cost = 460
	_338_Lapua_Magnum_AP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil",
	})
	_338_Lapua_Magnum_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -15,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 27,
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
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
	}
	_338_Lapua_Magnum_AP.AppliedEffects = {}

	_338_Lapua_Magnum_Basic.Cost = 230
	_338_Lapua_Magnum_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 27,
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
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 5,
			target_prop = "CritDamage",
		}),
	}
	_338_Lapua_Magnum_Basic.AppliedEffects = {}

	_338_Lapua_Magnum_HP.Cost = 460
	_338_Lapua_Magnum_HP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_338_Lapua_Magnum_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 55,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 27,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
	}
	_338_Lapua_Magnum_HP.AppliedEffects = {
		"Bleeding",
	}

	_338_Lapua_Magnum_Match.Cost = 460
	_338_Lapua_Magnum_Match.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling",
	})
	_338_Lapua_Magnum_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 27,
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
	_338_Lapua_Magnum_Match.AppliedEffects = {}

	print("GBO _338_Lapua_Magnum .338 Lapua Magnum DONE")
end

OnMsg.ClassesGenerate = GBO_338_Lapua_Magnum

