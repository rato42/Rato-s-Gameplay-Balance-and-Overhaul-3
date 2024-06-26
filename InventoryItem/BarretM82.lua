UndefineClass('BarretM82')
DefineClass.BarretM82 = {
	__parents = { "SniperRifle" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	comment = "------------ .50 ----- SNIPER",
	object_class = "SniperRifle",
	ScrapParts = 16,
	Reliability = 10,
	Icon = "UI/Icons/Weapons/M82",
	DisplayName = T(583738754123, --[[ModItemInventoryItemCompositeDef BarretM82 DisplayName]] "M82"),
	DisplayNamePlural = T(195197045724, --[[ModItemInventoryItemCompositeDef BarretM82 DisplayNamePlural]] "M82s"),
	Description = T(730017883688, --[[ModItemInventoryItemCompositeDef BarretM82 Description]] 'The .50 BMG is a heavy machine gun cartridge - hence the name. But place it in a semi auto long range gun and you have a great anti-materiel rifle. Or "shoot through walls" gun. It does need a muzzle break the size of a small shovel to counteract that recoil however. '),
	AdditionalHint = T(614748331117, --[[ModItemInventoryItemCompositeDef BarretM82 AdditionalHint]] "<description_hints>"),
	LargeItem = 1,
	Cumbersome = 1,
	UnitStat = "Marksmanship",
	Valuable = 1,
	Cost = 24900,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 1,
	RestockWeight = 20,
	CategoryPair = "Rifles",
	Caliber = "50BMG",
	Damage = 90,
	AimAccuracy = 8,
	CritChanceScaled = 20,
	MagazineSize = 5,
	WeaponRange = 36,
	PointBlankBonus = 1,
	OverwatchAngle = 545,
	Noise = 22,
	HandSlot = "TwoHanded",
	Entity = "Weapon_BarrettM82",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Bipod",
			'AvailableComponents', {
				"Bipod_m82",
			},
			'DefaultComponent', "Bipod_m82",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Magazine",
			'AvailableComponents', {
				"MagNormal",
				"MagLarge_5",
			},
			'DefaultComponent', "MagNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Scope",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"LROptics",
				"ScopeCOG",
				"ScopeCOGQuick",
				"ThermalScope",
				"LROpticsAdvanced",
				"ImprovedIronsight",
				"PSG_DefaultScope",
				"WideScope",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Muzzle",
			'AvailableComponents', {
				"Compensator",
				"Suppressor",
			},
			'DefaultComponent', "Compensator",
		}),
	},
	HolsterSlot = "Shoulder",
	PreparedAttackType = "Both",
	AvailableAttacks = {
		"SingleShot",
		"CancelShot",
	},
	ShootAP = 4000,
	ReloadAP = 3000,
	APStance = 6,
	default_long_barrel = true,
	PBbonus_base = -10,
	wep_base_recoil_mul = 85,
	placeholder_recoil = 90,
	wep_base_hip_mul = 83,
	wep_base_snapshot_mul = 159,
	unwieldy_weapon = true,
	weigth_held_mul = 200,
	Rat_swap_ap = 4,
	is_vanilla_firearm = true,
	Rat_cycling = "SemiAuto",
	recoil_mechanism = "Recoil_Operated",
	rat_weigth = 14000,
	rat_barrel_len = 730,
}

