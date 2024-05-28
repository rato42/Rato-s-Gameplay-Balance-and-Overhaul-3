-- ========== .32 HR Magnum ==========
-- = Group 4: Magnum and Large Caliber Pistols =
-- CritDamage+1
function GBO_32HRMAG()
	print("GBO _32HRMAG .32 HR Magnum ...")

	_32HRMAG_AP.Cost = 200
	_32HRMAG_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_32HRMAG_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -19,
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

	_32HRMAG_Basic.Cost = 100
	_32HRMAG_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 18,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritDamage",
		}),
	}

	_32HRMAG_HP.Cost = 200
	_32HRMAG_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_32HRMAG_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 51,
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
	_32HRMAG_HP.AppliedEffects = {
		"Bleeding",
	}

	_32HRMAG_Match.Cost = 200
	_32HRMAG_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_32HRMAG_Match.Modifications = {
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
			mod_add = 19,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "CritDamage",
		}),
	}
	_32HRMAG_Match.AppliedEffects = {}

	print("GBO _32HRMAG .32 HR Magnum DONE")
end

OnMsg.ClassesGenerate = GBO_32HRMAG