UndefineClass('Galil_FlagHill')
DefineClass.Galil_FlagHill = {
	__parents = { "AssaultRifle" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	comment = "------------ 7.62 NATO ----- ASSAULT - UNIQUE",
	object_class = "AssaultRifle",
	ScrapParts = 10,
	RepairCost = 50,
	Reliability = 77,
	Icon = "UI/Icons/Weapons/Galil_Flaghill",
	DisplayName = T(475982501214, --[[ModItemInventoryItemCompositeDef Galil_FlagHill DisplayName]] "The Hired Gun"),
	DisplayNamePlural = T(815023992971, --[[ModItemInventoryItemCompositeDef Galil_FlagHill DisplayNamePlural]] "The Hired Guns"),
	colorStyle = "AmmoAPColor",
	Description = T(544067750367, --[[ModItemInventoryItemCompositeDef Galil_FlagHill Description]] "Mercenary contract termination tool."),
	AdditionalHint = T(811371938636, --[[ModItemInventoryItemCompositeDef Galil_FlagHill AdditionalHint]] "<description_hints>"),
	LargeItem = 1,
	UnitStat = "Marksmanship",
	Cost = 13100,
	Caliber = "762NATO",
	Damage = 30,
	AimAccuracy = 4,
	CritChanceScaled = 40,
	MagazineSize = 25,
	WeaponRange = 28,
	PointBlankBonus = 1,
	OverwatchAngle = 1080,
	Noise = 22,
	HandSlot = "TwoHanded",
	Entity = "Weapon_Galil",
	fxClass = "Galil_FlagHill",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Barrel",
			'Modifiable', false,
			'AvailableComponents', {
				"long_barrel_light",
			},
			'DefaultComponent', "long_barrel_light",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Stock",
			'Modifiable', false,
			'AvailableComponents', {
				"StockNormal",
			},
			'DefaultComponent', "StockNormal",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Muzzle",
			'Modifiable', false,
			'AvailableComponents', {
				"Galil_Brake_Default",
			},
			'DefaultComponent', "Galil_Brake_Default",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Under",
			'Modifiable', false,
			'AvailableComponents', {
				"Bipod_Galil",
			},
			'DefaultComponent', "Bipod_Galil",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Scope",
			'Modifiable', false,
			'AvailableComponents', {
				"WideScope",
			},
			'DefaultComponent', "WideScope",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Magazine",
			'Modifiable', false,
			'AvailableComponents', {
				"MagNormal",
			},
			'DefaultComponent', "MagNormal",
		}),
	},
	Color = "Black",
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
	PBbonus_base = 2,
	wep_base_hip_mul = 93,
	wep_base_snapshot_mul = 106,
	Rat_swap_ap = 3,
	is_vanilla_firearm = true,
	Rat_cycling = "Auto",
	recoil_mechanism = "Gas_Operated",
}

