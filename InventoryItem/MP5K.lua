UndefineClass('MP5K')
DefineClass.MP5K = {
	__parents = { "SubmachineGun" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	comment = "------------ 9mm ----- SMG",
	object_class = "SubmachineGun",
	ScrapParts = 8,
	Reliability = 85,
	Icon = "Mod/cfahRED/Images/mp5k.png",
	DisplayName = T(133013619836, --[[ModItemInventoryItemCompositeDef MP5K DisplayName]] "MP5K"),
	DisplayNamePlural = T(858432588275, --[[ModItemInventoryItemCompositeDef MP5K DisplayNamePlural]] "MP5Ks"),
	Description = T(354513524341, --[[ModItemInventoryItemCompositeDef MP5K Description]] "Brutally short MP5 designed for close quarters engagements and personal defense. There is even a suitcase with a trigger on the handle for covert escort jobs."),
	AdditionalHint = T(793746590177, --[[ModItemInventoryItemCompositeDef MP5K AdditionalHint]] "<description_hints>"),
	UnitStat = "Marksmanship",
	Cost = 3600,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 30,
	CategoryPair = "SubmachineGuns",
	Caliber = "9mm",
	Damage = 19,
	AimAccuracy = 4,
	MagazineSize = 15,
	PointBlankBonus = 1,
	OverwatchAngle = 1437,
	HandSlot = "TwoHanded",
	Entity = "Weapon_MP5",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Under",
			'AvailableComponents', {
				"VerticalGrip",
			},
			'DefaultComponent', "VerticalGrip",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Barrel",
			'AvailableComponents', {
				"BarrelShort_handgun",
			},
			'DefaultComponent', "BarrelShort_handgun",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Magazine",
			'AvailableComponents', {
				"MagNormal",
				"MagLarge_5",
				"MagQuick",
			},
			'DefaultComponent', "MagNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Stock",
			'AvailableComponents', {
				"StockLight",
				"StockHeavy",
				"StockNo",
			},
			'DefaultComponent', "StockNo",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Side",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"Flashlight",
				"LaserDot",
				"FlashlightDot",
				"UVDot",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Scope",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"ReflexSight",
				"ReflexSightAdvanced",
				"ScopeCOG",
				"ScopeCOGQuick",
				"_ReflexSIghtVigilance",
				"WideScope",
				"ImprovedIronsight",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Muzzle",
			'AvailableComponents', {
				"Suppressor",
				"Compensator",
				"ImprovisedSuppressor",
			},
		}),
	},
	HolsterSlot = "Leg",
	AvailableAttacks = {
		"BurstFire",
		"AutoFire",
		"SingleShot",
		"DualShot",
		"RunAndGun",
		"CancelShot",
	},
	ShootAP = 3000,
	ReloadAP = 3000,
	PBbonus_base = 9,
	wep_base_recoil_mul = 109,
	wep_base_hip_mul = 110,
	wep_base_snapshot_mul = 74,
	weigth_held_mul = 114,
	is_vanilla_firearm = true,
	Rat_cycling = "Auto",
	recoil_mechanism = "Roller_Delayed",
	rat_weigth = 2000,
	rat_barrel_len = 110,
}

