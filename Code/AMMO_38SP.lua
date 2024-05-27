-- ========== .38 Special ==========
-- = Group 2: Standard Service and Self-Defense Pistols =
-- Lacks raw power. CritDamage-1
function GBO_38SP()
	print("GBO _38SP .38 Special ...")

	_38SP_AP.Cost = 220
	_38SP_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_38SP_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -21,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 18,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_38SP_Basic.Cost = 110
	_38SP_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 18,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -1,
			target_prop = "CritDamage",
		}),
	}

	_38SP_HP.Cost = 220
	_38SP_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_38SP_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 49,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 18,
			target_prop = "Noise",
		}),
	}
	_38SP_HP.AppliedEffects = {
		"Bleeding",
	}

	_38SP_Match.Cost = 220
	_38SP_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_38SP_Match.Modifications = {
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
			mod_add = -1,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 18,
			target_prop = "Noise",
		}),
	}
	_38SP_Match.AppliedEffects = {}

	print("GBO _38SP .38 Special DONE")
end

OnMsg.ClassesGenerate = GBO_38SP
