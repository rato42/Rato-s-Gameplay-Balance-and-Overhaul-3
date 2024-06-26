UndefineClass('M16A2')
DefineClass.M16A2 = {
	__parents = { "AssaultRifle" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	comment = "------------ 5.56  ----- ASSAULT",
	object_class = "AssaultRifle",
	ScrapParts = 10,
	Reliability = 80,
	Icon = "UI/Icons/Weapons/M16A2",
	DisplayName = T(780181648209, --[[ModItemInventoryItemCompositeDef M16A2 DisplayName]] "M16A2"),
	DisplayNamePlural = T(589956228778, --[[ModItemInventoryItemCompositeDef M16A2 DisplayNamePlural]] "M16A2s"),
	Description = T(169185683982, --[[ModItemInventoryItemCompositeDef M16A2 Description]] "The most iconic firearm of the western world, the M16 introduced the 5.56 NATO cartridge which was made for its 20 inch barrel. It's higher bullet velocity improves accuracy at long range and auto-fire handling, though it has less stopping power than its main rival - the AK-47. Don't ask about the forward assist..."),
	AdditionalHint = T(550693603298, --[[ModItemInventoryItemCompositeDef M16A2 AdditionalHint]] "<description_hints>\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No Auto firing mode"),
	LargeItem = 1,
	UnitStat = "Marksmanship",
	Cost = 9900,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 40,
	CategoryPair = "AssaultRifles",
	Caliber = "556",
	Damage = 24,
	AimAccuracy = 5,
	MagazineSize = 20,
	WeaponRange = 28,
	PointBlankBonus = 1,
	OverwatchAngle = 1024,
	Noise = 18,
	HandSlot = "TwoHanded",
	Entity = "Weapon_M16A2",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Handguard",
			'Modifiable', false,
			'CanBeEmpty', true,
			'AvailableComponents', {
				"",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Scope",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"ScopeCOG",
				"ScopeCOGQuick",
				"LROptics",
				"ThermalScope",
				"ReflexSight",
				"WideScope",
				"_ReflexSIghtVigilance",
				"ImprovedIronsight",
			},
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Muzzle",
			'CanBeEmpty', true,
			'AvailableComponents', {
				"Compensator",
				"Suppressor",
				"ImprovisedSuppressor",
			},
			'DefaultComponent', "Compensator",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Barrel",
			'AvailableComponents', {
				"BarrelNormal",
				"BarrelLight",
				"BarrelHeavy",
			},
			'DefaultComponent', "BarrelNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Magazine",
			'AvailableComponents', {
				"MagLarge",
				"MagNormal",
				"R_MagQuickLarge",
			},
			'DefaultComponent', "MagNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Stock",
			'AvailableComponents', {
				"StockNormal",
				"StockLight",
				"StockNo",
			},
			'DefaultComponent', "StockNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Under",
			'AvailableComponents', {
				"GrenadeLauncher_M16A1",
				"VerticalGrip_M16",
				"M16_Handguard",
			},
			'DefaultComponent', "M16_Handguard",
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
	},
	HolsterSlot = "Shoulder",
	AvailableAttacks = {
		"BurstFire",
		"SingleShot",
		"CancelShot",
	},
	ShootAP = 4000,
	ReloadAP = 3000,
	APStance = 4,
	PBbonus_base = 1,
	wep_base_recoil_mul = 98,
	placeholder_recoil = 95,
	burst_recoil_delta = 90,
	burst_selective = true,
	wep_base_hip_mul = 95,
	wep_base_snapshot_mul = 106,
	weigth_held_mul = 125,
	Rat_swap_ap = 3,
	is_vanilla_firearm = true,
	Rat_cycling = "Auto",
	recoil_mechanism = "Gas_Operated",
	rat_weigth = 3600,
	rat_barrel_len = 500,
}

