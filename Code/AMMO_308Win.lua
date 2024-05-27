-- ========== .308 Winchester ==========
-- = Group 6: Battle Rifle and Full-Power Rifle Cartridges =
-- The civilian counterpart of the 7.62x51mm NATO (7.62 NATO) [762NATO Vanilla]
function GBO_308Win()
	print("GBO _308Win .308 Winchester ...")

	_308Win_AP.Cost = 340
	_308Win_AP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil",
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
	_Win_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 30,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	}

	_308Win_HP.Cost = 340
	_308Win_HP.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> ",
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
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling",
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

OnMsg.ClassesGenerate = GBO_308Win

