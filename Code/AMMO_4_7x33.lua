-- ========== 4.7x33mm ==========
-- = Group 5: Assault Rifle and Intermediate Cartridges =
-- Limited armor penetration capability due to its smaller size and lower energy compared to other cartridges in this group. CritDamage-10 CritChance-5
function GBO_4_7x33()
	print("GBO _4_7x33 4.7x33mm ...")

	_4_7x33_AP.Cost = 270
	_4_7x33_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_4_7x33_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -30,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -5,
			target_prop = "CritChance",
		}),
	}
	_4_7x33_AP.AppliedEffects = {}

	_4_7x33_Basic.Cost = 140
	_4_7x33_Basic.AdditionalHint = T({
		"",
	})
	_4_7x33_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -10,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -5,
			target_prop = "CritChance",
		}),
	}
	_4_7x33_Basic.AppliedEffects = {}

	_4_7x33_HP.Cost = 270
	_4_7x33_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color>",
	})
	_4_7x33_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 40,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -5,
			target_prop = "CritChance",
		}),
	}
	_4_7x33_HP.AppliedEffects = {
		"Bleeding",
	}

	_4_7x33_Match.Cost = 270
	_4_7x33_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_4_7x33_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 1,
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
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -10,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -5,
			target_prop = "CritChance",
		}),
	}
	_4_7x33_Match.AppliedEffects = {}

	print("GBO _4_7x33 4.7x33mm DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_4_7x33

