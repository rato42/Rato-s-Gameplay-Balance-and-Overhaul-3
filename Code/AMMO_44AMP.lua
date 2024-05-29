-- ========== .44 AMP(Auto Magnum Pistol) ==========
-- = Group 4: Magnum and Large Caliber Pistols =
-- CritDamage+2
function GBO_44AMP()
	print("GBO .44AMP .44 AMP ...")

	_44AMP_AP.Cost = 200
	_44AMP_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_44AMP_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -18,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 19,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}
	_44AMP_AP.AppliedEffects = {}

	_44AMP_Basic.Cost = 100
	_44AMP_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 19,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "CritDamage",
		}),
	}
	_44AMP_Basic.AppliedEffects = {}

	_44AMP_HP.Cost = 200
	_44AMP_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_44AMP_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 52,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 19,
			target_prop = "Noise",
		}),
	}
	_44AMP_HP.AppliedEffects = {
		"Bleeding",
	}

	_44AMP_Match.Cost = 260
	_44AMP_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_44AMP_Match.Modifications = {
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
			mod_add = 2,
			target_prop = "CritDamage",
		}),
	}
	_44AMP_Match.AppliedEffects = {}

	-- TODO Shock Subsonic AMP

	print("GBO .44AMP .44 AMP DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_44AMP
