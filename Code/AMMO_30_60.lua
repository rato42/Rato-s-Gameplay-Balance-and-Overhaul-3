-- ========== .30-06 Springfield ==========
-- = Group 6: Battle Rifle and Full-Power Rifle Cartridges =
-- Higher velocity and energy, resulting in longer effective range and more powerful impact. CritDamage +10
function GBO_30_60()
	print("GBO _30_60 .30-06 Springfield ...")

	_30_60_AP.Cost = 300
	_30_60_AP.AdditionalHint = T({
		"<bullet_point> Fragmentation effects increase Critical Damage\n<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil",
	})
	_30_60_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -10,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	}

	_30_60_Basic.Cost = 150
	_30_60_Basic.AdditionalHint = T({
		"<bullet_point> Fragmentation effects increase Critical Damage",
	})
	_30_60_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritDamage",
		}),
	}

	_30_60_HP.Cost = 300
	_30_60_HP.AdditionalHint = T({
		"<bullet_point> Fragmentation effects increase Critical Damage\n<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color> ",
	})
	_30_60_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 60,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
	}
	_30_60_HP.AppliedEffects = {
		"Bleeding",
	}

	_30_60_Match.Cost = 400
	_30_60_Match.AdditionalHint = T({
		"<bullet_point> Fragmentation effects increase Critical Damage\n<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling",
	})
	_30_60_Match.Modifications = {
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
			mod_add = 10,
			target_prop = "CritDamage",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	}
	_30_60_Match.AppliedEffects = {}

	print("GBO _30_60 .30-06 Springfield DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_30_60

