-- ========== .408 CheyTac ==========
-- = Group 7: Precision and Long-Range Rifle Cartridges = 
-- Ultra-long-range, unmatched performance
function GBO_408_ChayTac()
	print("GBO _408_ChayTac .408 CheyTac ...")

	_408_ChayTac_AP.Cost = 500
	_408_ChayTac_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_408_ChayTac_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -15,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 28,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
	}
	_408_ChayTac_AP.AppliedEffects = {}

	_408_ChayTac_Basic.Cost = 250
	_408_ChayTac_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 28,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
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
	_408_ChayTac_Basic.AppliedEffects = {}

	_408_ChayTac_HP.Cost = 500
	_408_ChayTac_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_408_ChayTac_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 55,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 28,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
	}
	_408_ChayTac_HP.AppliedEffects = {
		"Bleeding",
	}

	_408_ChayTac_Match.Cost = 500
	_408_ChayTac_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_408_ChayTac_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
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
			mod_add = 28,
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
	_408_ChayTac_Match.AppliedEffects = {}

	print("GBO _408_ChayTac .408 CheyTac DONE")
end

OnMsg.ClassesGenerate = GBO_408_ChayTac

