UndefineClass('AK47')
DefineClass.AK47 = {
	__parents = { "AssaultRifle" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	comment = "------------ 7.62 WP ----- ASSAULT",
	object_class = "AssaultRifle",
	msg_reactions = {},
	unit_reactions = {},
	ScrapParts = 10,
	RepairCost = 20,
	Reliability = 95,
	Icon = "UI/Icons/Weapons/AK47",
	DisplayName = T(938544942262, --[[ModItemInventoryItemCompositeDef AK47 DisplayName]] "AK-47"),
	DisplayNamePlural = T(502972714813, --[[ModItemInventoryItemCompositeDef AK47 DisplayNamePlural]] "AK-47s"),
	Description = T(826047568801, --[[ModItemInventoryItemCompositeDef AK47 Description]] "You should not be surprised to find an AK-47 anywhere there is conflict around the world. Simple to use, reliable and dirt cheap. Over 75 million are in circulation worldwide."),
	AdditionalHint = T(720411688179, --[[ModItemInventoryItemCompositeDef AK47 AdditionalHint]] "<description_hints>"),
	LargeItem = 1,
	UnitStat = "Marksmanship",
	Cost = 2800,
	CanAppearInShop = true,
	MaxStock = 5,
	RestockWeight = 120,
	CategoryPair = "AssaultRifles",
	Caliber = "762WP",
	Damage = 26,
	AimAccuracy = 3,
	MagazineSize = 30,
	WeaponRange = 24,
	PointBlankBonus = 1,
	OverwatchAngle = 1086,
	Noise = 22,
	HandSlot = "TwoHanded",
	Entity = "Weapon_AK47",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Bipod",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"Bipod",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Grenadelauncher",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"AK47_Launcher",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Stock",
			'AvailableComponents', {
				"StockNormal",
				"StockLight",
				"StockNo",
				"StockHeavy",
			},
			'DefaultComponent', "StockNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Magazine",
			'AvailableComponents', {
				"MagNormal",
				"MagLarge",
				"MagQuick",
			},
			'DefaultComponent', "MagNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Handguard",
			'AvailableComponents', {
				"AK47_VerticalGrip",
				"AK47_Handguard_basic",
			},
			'DefaultComponent', "AK47_Handguard_basic",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Scope",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"LROptics",
				"ReflexSight",
				"ScopeCOG",
				"ThermalScope",
				"LROptics_DragunovDefault",
				"WideScope",
				"ScopeCOGQuick",
				"ReflexSightAdvanced",
				"_ReflexSIghtVigilance",
				"ImprovedIronsight",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Muzzle",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"Compensator",
				"MuzzleBooster",
				"Suppressor",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Side",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"Flashlight",
				"FlashlightDot",
				"LaserDot",
				"UVDot",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Barrel",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"BarrelLight",
				"BarrelHeavy",
			},
		}),
	},
	HolsterSlot = "Shoulder",
	AvailableAttacks = {
		"BurstFire",
		"AutoFire",
		"SingleShot",
		"CancelShot",
	},
	ShootAP = 4000,
	ReloadAP = 3000,
	APStance = 4,
	PBbonus_base = 4,
	wep_base_recoil_mul = 99,
	wep_base_snapshot_mul = 103,
	weigth_held_mul = 131,
	Rat_swap_ap = 3,
	is_vanilla_firearm = true,
	Rat_cycling = "Auto",
	recoil_mechanism = "Gas_Operated",
	rat_weigth = 4400,
	rat_barrel_len = 410,
}

