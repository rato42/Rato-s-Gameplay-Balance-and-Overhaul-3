UndefineClass('Auto5_quest')
DefineClass.Auto5_quest = {
	__parents = { "Shotgun" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	comment = "------------ 12ga ----- SHOTGUN - UNIQUE",
	object_class = "Shotgun",
	ScrapParts = 10,
	RepairCost = 50,
	Reliability = 20,
	Icon = "UI/Icons/Weapons/Auto5Quest",
	ItemType = "Shotgun",
	DisplayName = T(564072948598, --[[ModItemInventoryItemCompositeDef Auto5_quest DisplayName]] "Ma Baxter's Argument Invalidator"),
	DisplayNamePlural = T(235774181933, --[[ModItemInventoryItemCompositeDef Auto5_quest DisplayNamePlural]] "Ma Baxter's Argument Invalidators"),
	Description = T(333016804110, --[[ModItemInventoryItemCompositeDef Auto5_quest Description]] "The legendary owner of the bar in Port Cacao used this custom Auto-5 shotgun to end bar fights in the most final way possible."),
	AdditionalHint = T(732527392585, --[[ModItemInventoryItemCompositeDef Auto5_quest AdditionalHint]] "<description_hints>\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Rapid Invalidation"),
	LargeItem = 1,
	Cost = 1200,
	Caliber = "12gauge",
	Damage = 24,
	ObjDamageMod = 150,
	AimAccuracy = 1,
	MagazineSize = 8,
	WeaponRange = 10,
	PointBlankBonus = 1,
	OverwatchAngle = 959,
	BuckshotConeAngle = 1200,
	BuckshotFalloffDamage = 100,
	Noise = 25,
	HandSlot = "TwoHanded",
	Entity = "Weapon_Auto5",
	fxClass = "Auto5_quest",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Barrel",
			'Modifiable', false,
			'AvailableComponents', {
				"Auto5_Basic_LMag",
			},
			'DefaultComponent', "Auto5_Basic_NMag",
		}),
	},
	HolsterSlot = "Shoulder",
	AvailableAttacks = {
		"BuckshotBurst",
	},
	ShootAP = 3000,
	ReloadAP = 4000,
	PBbonus_base = -1,
	wep_base_recoil_mul = 98,
	placeholder_recoil = 125,
	Rat_swap_ap = 3,
	is_vanilla_firearm = true,
	Rat_cycling = "Auto",
	recoil_mechanism = "Recoil_Operated",
}

