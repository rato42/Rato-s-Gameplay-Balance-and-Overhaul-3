UndefineClass('M14SAW')
DefineClass.M14SAW = {
	__parents = { "AssaultRifle" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	comment = "------------ 7.62 NATO ----- ASSAULT",
	object_class = "AssaultRifle",
	ScrapParts = 10,
	Reliability = 80,
	Icon = "UI/Icons/Weapons/M14",
	DisplayName = T(324182055121, --[[ModItemInventoryItemCompositeDef M14SAW DisplayName]] "M-1A"),
	DisplayNamePlural = T(966925374873, --[[ModItemInventoryItemCompositeDef M14SAW DisplayNamePlural]] "M-1As"),
	Description = T(228666868540, --[[ModItemInventoryItemCompositeDef M14SAW Description]] "Take a semi-auto Garand rifle, then don't make it heavier or capable of firing full auto. Simply put, it's a better weapon."),
	AdditionalHint = T(517364861436, --[[ModItemInventoryItemCompositeDef M14SAW AdditionalHint]] "<description_hints>\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Civilian issued, most commonly found variant. Only fires in semi-auto"),
	LargeItem = 1,
	UnitStat = "Marksmanship",
	Cost = 6000,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 80,
	CategoryPair = "AssaultRifles",
	Caliber = "762NATO",
	Damage = 29,
	AimAccuracy = 4,
	MagazineSize = 10,
	WeaponRange = 28,
	PointBlankBonus = 1,
	OverwatchAngle = 870,
	HandSlot = "TwoHanded",
	Entity = "Weapon_M14",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Barrel",
			'AvailableComponents', {
				"BarrelLong",
				"BarrelLongImproved",
				"BarrelNormal",
				"BarrelNormalImproved",
				"BarrelShort",
				"BarrelShortImproved",
				"BarrelHeavyLong",
				"BarrelLight",
				"long_barrel_light",
				"BarrelShort_Light",
				"BarrelHeavy",
			},
			'DefaultComponent', "BarrelNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Stock",
			'AvailableComponents', {
				"StockHeavy",
				"StockNormal",
				"StockLight",
			},
			'DefaultComponent', "StockHeavy",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Magazine",
			'AvailableComponents', {
				"MagLarge_5",
				"MagLargeFine_5",
				"MagNormal",
				"MagNormalFine",
				"MagQuick",
			},
			'DefaultComponent', "MagNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Under",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"GrenadeLauncher_M14",
				"TacGrip_M14",
				"Bipod_Under",
				"VerticalGrip_M14",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Muzzle",
			'AvailableComponents', {
				"M14_Default_Muzzle",
				"Compensator",
				"Suppressor",
				"ImprovisedSuppressor",
				"MuzzleBooster",
			},
			'DefaultComponent', "M14_Default_Muzzle",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Side",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"LaserDot",
				"FlashlightDot",
				"UVDot",
				"Flashlight",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Scope",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"ImprovedIronsight",
				"LROptics",
				"LROpticsAdvanced",
				"ReflexSight",
				"ReflexSightAdvanced",
				"ScopeCOG",
				"ScopeCOGQuick",
				"ThermalScope",
				"WideScope",
				"_ReflexSIghtVigilance",
			},
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
	APStance = 4,
	PBbonus_base = -1,
	wep_base_recoil_mul = 89,
	placeholder_recoil = 115,
	wep_base_hip_mul = 97,
	wep_base_snapshot_mul = 109,
	weigth_held_mul = 137,
	Rat_swap_ap = 3,
	is_vanilla_firearm = true,
	Rat_cycling = "SemiAuto",
	recoil_mechanism = "Gas_Operated",
	rat_weigth = 5220,
	rat_barrel_len = 457,
}

