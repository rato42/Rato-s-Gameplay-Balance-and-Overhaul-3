UndefineClass('LionRoar')
DefineClass.LionRoar = {
	__parents = { "SubmachineGun" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	comment = "------------ 9mm ----- SMG - UNIQUE",
	object_class = "SubmachineGun",
	ScrapParts = 10,
	Reliability = 80,
	Icon = "UI/Icons/Weapons/LionRoar",
	DisplayName = T(986681927983, --[[ModItemInventoryItemCompositeDef LionRoar DisplayName]] "The Lion's Roar"),
	DisplayNamePlural = T(618224293127, --[[ModItemInventoryItemCompositeDef LionRoar DisplayNamePlural]] "The Lion's Roar"),
	Description = T(649341674296, --[[ModItemInventoryItemCompositeDef LionRoar Description]] "Imperialists cower before its voice!"),
	AdditionalHint = T(901243090653, --[[ModItemInventoryItemCompositeDef LionRoar AdditionalHint]] "<description_hints>\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> OUR weapon\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Burst fire has 4 shots\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Limited ammo capacity\n"),
	Cost = 3000,
	Caliber = "9mm",
	Damage = 18,
	AimAccuracy = 4,
	MagazineSize = 20,
	PointBlankBonus = 1,
	OverwatchAngle = 1410,
	Entity = "Weapon_Uzi_LionsRoar",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Muzzle",
			'Modifiable', false,
			'AvailableComponents', {
				"LionRoar_compensator",
			},
			'DefaultComponent', "LionRoar_compensator",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Internal",
			'Modifiable', false,
			'AvailableComponents', {
				"Internal_plus_burstshot",
			},
			'DefaultComponent', "Internal_plus_burstshot",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Stock",
			'Modifiable', false,
			'AvailableComponents', {
				"StockNo",
			},
			'DefaultComponent', "StockNo",
		}),
	},
	HolsterSlot = "Shoulder",
	AvailableAttacks = {
		"BurstFire",
		"AutoFire",
		"SingleShot",
		"RunAndGun",
	},
	ShootAP = 4000,
	ReloadAP = 3000,
	APStance = 2,
	PBbonus_base = 8,
	wep_base_recoil_mul = 108,
	wep_base_hip_mul = 110,
	wep_base_snapshot_mul = 95,
	Rat_swap_ap = 1,
	is_vanilla_firearm = true,
	Rat_cycling = "Auto",
	recoil_mechanism = "Gas_Operated",
}

