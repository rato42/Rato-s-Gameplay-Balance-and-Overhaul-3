UndefineClass('ShapedCharge_RAT_1')
DefineClass.ShapedCharge_RAT_1 = {
	__parents = { "Grenade" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Grenade",
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Weapons/ShapedCharge",
	ItemType = "Grenade",
	DisplayName = T(936240571453, --[[ModItemInventoryItemCompositeDef ShapedCharge_RAT_1 DisplayName]] "Shaped Charge"),
	DisplayNamePlural = T(750458914595, --[[ModItemInventoryItemCompositeDef ShapedCharge_RAT_1 DisplayNamePlural]] "Shaped Charges"),
	AdditionalHint = T(467089091430, --[[ModItemInventoryItemCompositeDef ShapedCharge_RAT_1 AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Cone-shaped explosion\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High mishap risk when used by anyone except Barry \n"),
	UnitStat = "Explosives",
	Cost = 1500,
	MinMishapChance = 30,
	MaxMishapChance = 90,
	MinMishapRange = 0,
	AreaOfEffect = 8,
	PenetrationClass = 3,
	coneShaped = true,
	BurnGround = false,
	DeathType = "BlowUp",
	BaseDamage = 38,
	Scatter = 4,
	CanBounce = false,
	InaccurateMaxOffset = 4000,
	Entity = "MilitaryCamp_Grenade_01",
	ActionIcon = "UI/Icons/Hud/shaped_charge",
}

