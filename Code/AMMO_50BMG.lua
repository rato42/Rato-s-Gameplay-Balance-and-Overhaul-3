-- ========== .50 BMG[Vanilla] (12,7 × 99 mm NATO)(.50 Browning Machine Gun) ==========
function GBO_50BMG()
	print("GBO 50BMG ...")

	_50BMG_Basic.Cost = 400
	_50BMG_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 41,
			target_prop = "Noise",
		}),
	}

	_50BMG_HE.Cost = 850
	_50BMG_HE.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Crit chance",
	})
	_50BMG_HE.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 41,
			target_prop = "Noise",
		}),
	}

	_50BMG_Incendiary.Cost = 850
	_50BMG_Incendiary.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Exposed</color> and lose the benefits of Cover\n<bullet_point> Inflicts <color EmStyle>Burning</color>",
	})
	_50BMG_Incendiary.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 41,
			target_prop = "Noise",
		}),
	}
	_50BMG_Incendiary.AppliedEffects = {
		"Exposed",
		"Burning",
	}

	_50BMG_SLAP.Cost = 850
	_50BMG_SLAP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Slightly higher Crit chance",
	})
	_50BMG_SLAP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 5,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 41,
			target_prop = "Noise",
		}),
	}

	print("GBO 50BMG DONE")
end

OnMsg.ClassesGenerate = GBO_50BMG
