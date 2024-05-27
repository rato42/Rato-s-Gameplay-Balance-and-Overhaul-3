-- ========== 12-gauge [Vanilla 12-gauge] ==========
function GBO_12gauge()
	print("GBO 12gauge ...")

	_12gauge_Breacher.Cost = 240
	_12gauge_Breacher.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Very short range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Wide attack cone\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Prevents Grazing hits due to opponents Taking Cover\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Suppressed</color>",
	})
	_12gauge_Breacher.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "IgnoreCoverReduction",
		}),
		PlaceObj("CaliberModification", {
			mod_mul = 500,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_mul = 2000,
			target_prop = "ObjDamageMod",
		}),
		PlaceObj("CaliberModification", {
			mod_mul = 1700,
			target_prop = "BuckshotConeAngle",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 34,
			target_prop = "Noise",
		}),
	}
	_12gauge_Breacher.AppliedEffects = {
		"Suppressed",
	}

	_12gauge_Buckshot.Cost = 120
	_12gauge_Buckshot.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 34,
			target_prop = "Noise",
		}),
	}
	_12gauge_Buckshot.AppliedEffects = {}

	_12gauge_Flechette.Cost = 240
	_12gauge_Flechette.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Longer range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Less damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Narrow attack cone\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>",
	})
	_12gauge_Flechette.Modifications = {
		PlaceObj("CaliberModification", {
			mod_mul = 800,
			target_prop = "BuckshotConeAngle",
		}),
		PlaceObj("CaliberModification", {
			mod_mul = 750,
			target_prop = "Damage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 34,
			target_prop = "Noise",
		}),
	}
	_12gauge_Flechette.AppliedEffects = {
		"Bleeding",
	}

	_12gauge_Saltshot.Cost = 240
	_12gauge_Saltshot.AdditionalHint = T({
		"<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Low damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Shorter range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Wide attack cone\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Inaccurate</color> and <color EmStyle>Slowed</color>",
	})
	_12gauge_Saltshot.Modifications = {
		PlaceObj("CaliberModification", {
			mod_mul = 500,
			target_prop = "Damage",
		}),
		PlaceObj("CaliberModification", {
			mod_mul = 1700,
			target_prop = "BuckshotConeAngle",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 34,
			target_prop = "Noise",
		}),
	}
	_12gauge_Saltshot.AppliedEffects = {
		"Inaccurate",
		"Slowed",
	}

	print("GBO 12gauge DONE")
end

OnMsg.ClassesGenerate = GBO_12gauge
