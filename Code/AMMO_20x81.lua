-- ========== 20x82mm utilized in anti-materiel rifles and heavy machine guns. Similar to the .50 BMG ==========
function GBO_20x81()
	print("GBO _20x81 ...")

	_20x82_Basic.Cost = 420
	_20x82_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 39,
			target_prop = "Noise",
		}),
	}

	_20x82_HE.Cost = 830
	_20x82_HE.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Crit chance",
	})
	_20x82_HE.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 50,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 39,
			target_prop = "Noise",
		}),
	}
	_20x82_HE.AppliedEffects = {
		"Bleeding",
	}

	_20x81_Incendiary.Cost = 830
	_20x81_Incendiary.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Exposed</color> and lose the benefits of Cover\n<bullet_point> Inflicts <color EmStyle>Burning</color>",
	})
	_20x81_Incendiary.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 39,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
	}
	_20x81_Incendiary.AppliedEffects = {
		"Exposed",
		"Burning",
	}

	_20x82_SLAP.Cost = 830
	_20x82_SLAP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Slightly higher Crit chance",
	})
	_20x82_SLAP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 39,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 5,
			target_prop = "PenetrationClass",
		}),
	}

	print("GBO _20x81 DONE")
end

OnMsg.ClassesGenerate = GBO_20x81
