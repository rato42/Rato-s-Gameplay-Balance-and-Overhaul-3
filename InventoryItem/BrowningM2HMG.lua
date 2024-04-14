UndefineClass('BrowningM2HMG')
DefineClass.BrowningM2HMG = {
	__parents = { "MachineGun" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "MachineGun",
	ScrapParts = 20,
	Reliability = 80,
	Icon = "UI/Icons/Weapons/M2Browning",
	DisplayName = T(187632089463, --[[ModItemInventoryItemCompositeDef BrowningM2HMG DisplayName]] "M2 Browning"),
	DisplayNamePlural = T(285160738167, --[[ModItemInventoryItemCompositeDef BrowningM2HMG DisplayNamePlural]] "M2 Brownings"),
	Description = T(958118537736, --[[ModItemInventoryItemCompositeDef BrowningM2HMG Description]] "When you're a dime short of buying some tank ordnance but you won't make a compromise with power."),
	AdditionalHint = T(891996501927, --[[ModItemInventoryItemCompositeDef BrowningM2HMG AdditionalHint]] "<description_hints>\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Stationary weapon\n"),
	LargeItem = 1,
	Cumbersome = 1,
	UnitStat = "Marksmanship",
	Cost = 4200,
	Caliber = "50BMG",
	Damage = 45,
	MagazineSize = 100,
	WeaponRange = 32,
	OverwatchAngle = 3600,
	Noise = 30,
	HandSlot = "TwoHanded",
	Entity = "Weapon_M2Browning",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "General",
			'Modifiable', false,
			'AvailableComponents', {
				"browning_bipod",
			},
			'DefaultComponent', "browning_bipod",
		}),
	},
	HolsterSlot = "Shoulder",
	PreparedAttackType = "Machine Gun",
	AvailableAttacks = {
		"MGBurstFire",
	},
	ShootAP = 6000,
	ReloadAP = 6000,
	PBbonus_base = 0,
	wep_base_recoil_mul = 70,
	long_shots = 5,
	Rat_swap_ap = 3,
	is_vanilla_firearm = true,
	Rat_cycling = "Auto",
	recoil_mechanism = "Recoil_Operated",
}

