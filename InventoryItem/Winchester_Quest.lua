UndefineClass('Winchester_Quest')
DefineClass.Winchester_Quest = {
	__parents = { "AssaultRifle" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	comment = "------------ .44 cal ----- SNIPER - UNIQUE",
	object_class = "AssaultRifle",
	ScrapParts = 8,
	Reliability = 95,
	Icon = "UI/Icons/Weapons/Winchester",
	DisplayName = T(712515447503, --[[ModItemInventoryItemCompositeDef Winchester_Quest DisplayName]] "Confidante"),
	DisplayNamePlural = T(530585719100, --[[ModItemInventoryItemCompositeDef Winchester_Quest DisplayNamePlural]] "Confidante"),
	Description = T(573327218117, --[[ModItemInventoryItemCompositeDef Winchester_Quest Description]] "Reward for keeping a secret that is used for secret keeping."),
	AdditionalHint = T(271837025192, --[[ModItemInventoryItemCompositeDef Winchester_Quest AdditionalHint]] "<description_hints>\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Backstabby and Silent\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Lever action\n"),
	LargeItem = 1,
	UnitStat = "Marksmanship",
	Cost = 3000,
	Caliber = "44CAL",
	Damage = 22,
	AimAccuracy = 3,
	CritChanceScaled = 40,
	MagazineSize = 4,
	WeaponRange = 26,
	PointBlankBonus = 1,
	OverwatchAngle = 1320,
	Noise = 30,
	HandSlot = "TwoHanded",
	Entity = "Weapon_Winchester",
	ComponentSlots = {
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Barrel",
			'Modifiable', false,
			'AvailableComponents', {
				"barrel_confidante",
			},
			'DefaultComponent', "barrel_confidante",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Scope",
			'Modifiable', false,
			'AvailableComponents', {
				"stealth_ironsight_confidante",
			},
			'DefaultComponent', "stealth_ironsight_confidante",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "Muzzle",
			'Modifiable', false,
			'AvailableComponents', {
				"Suppressor",
			},
			'DefaultComponent', "Suppressor",
		}),
		PlaceObj('WeaponComponentSlot', {
			'SlotType', "General",
			'Modifiable', false,
			'AvailableComponents', {
				"lever_action",
			},
			'DefaultComponent', "lever_action",
		}),
	},
	HolsterSlot = "Shoulder",
	ModifyRightHandGrip = true,
	PreparedAttackType = "Both",
	AvailableAttacks = {
		"SingleShot",
		"CancelShot",
		"MobileShot",
	},
	ShootAP = 4000,
	ReloadAP = 3000,
	APStance = 4,
	PBbonus_base = 2,
	wep_base_recoil_mul = 97,
	wep_base_hip_mul = 93,
	Rat_swap_ap = 3,
	is_vanilla_firearm = true,
	Rat_cycling = "LeverAction",
	recoil_mechanism = "Lever_Action",
}

