-- ========== .45 ACP ==========
-- = Group 2: Standard Service and Self-Defense Pistols =
-- Delivers substantial energy on target. CritDamage+2, CritChance+1
function GBO_45ACP()
	print("GBO _45ACP .45 ACP ...")

	_45ACP_AP.Cost = 190
	_45ACP_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_45ACP_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -18,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 17,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_45ACP_Basic.Cost = 100
	_45ACP_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 17,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
	}

	_45ACP_Tracer.Cost = 190
	_45ACP_Tracer.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks",
	})
	_45ACP_Tracer.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 17,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "tracer",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
	}
	_45ACP_Tracer.AppliedEffects = {
		"Marked",
		"Revealed_R",
	}

	_45ACP_HP.Cost = 190
	_45ACP_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_45ACP_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 52,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 17,
			target_prop = "Noise",
		}),
	}
	_45ACP_HP.AppliedEffects = {
		"Bleeding",
	}

	_45ACP_Match.Cost = 250
	_45ACP_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_45ACP_Match.Modifications = {
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
			mod_add = 2,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 17,
			target_prop = "Noise",
		}),
	}
	_45ACP_Match.AppliedEffects = {}

	_45ACP_Subsonic.Cost = 190
	_45ACP_Subsonic.AdditionalHint = T({
		"<bullet_point> Less noisy\n<bullet_point> Less bullet speed, resulting in less Aim Accuracy, Range and Armor Penetration",
	})
	_45ACP_Subsonic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 17,
			mod_mul = 500,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -2,
			target_prop = "WeaponRange",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -1,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritChance",
		}),
	}
	_45ACP_Subsonic.AppliedEffects = {}

	print("GBO _45ACP .45 ACP DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_45ACP
