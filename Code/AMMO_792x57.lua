-- ==========  7.92x57mm Mauser ==========
-- = Group 6: Battle Rifle and Full-Power Rifle Cartridges =
function GBO_792x57()
	print("GBO 792x57 ...")

	_7_92x57_AP.Cost = 300
	_7_92x57_AP.Icon = "Mod/cfahRED/Images/mouserap.png"
	_7_92x57_AP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil",
	})
	_7_92x57_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 31,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_7_92x57_Basic.Cost = 150
	_7_92x57_Basic.Icon = "Mod/cfahRED/Images/mauserstandard.png"
	_7_92x57_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 31,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	}

	_7_92x57_HP.Cost = 300
	_7_92x57_HP.Icon = "Mod/cfahRED/Images/mouserhp.png"
	_7_92x57_HP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_7_92x57_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 31,
			target_prop = "Noise",
		}),
	}
	_7_92x57_HP.AppliedEffects = {
		"Bleeding",
	}

	_7_92x57_Match.Cost = 400
	_7_92x57_Match.Icon = "Mod/cfahRED/Images/mausermatch.png"
	_7_92x57_Match.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling",
	})
	_7_92x57_Match.Modifications = {
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
			mod_add = 31,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	}

	-- TODO _79257_Tracer.lua

	print("GBO 792x57 DONE")
end

OnMsg.ClassesGenerate = GBO_792x57
