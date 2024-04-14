UndefineClass('Super_HE_Grenade_RAT_1')
DefineClass.Super_HE_Grenade_RAT_1 = {
	__parents = { "Grenade" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Grenade",
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Weapons/HEGrenade",
	ItemType = "Grenade",
	DisplayName = T(686163312421, --[[ModItemInventoryItemCompositeDef Super_HE_Grenade_RAT_1 DisplayName]] "Demo Charge"),
	DisplayNamePlural = T(713907941092, --[[ModItemInventoryItemCompositeDef Super_HE_Grenade_RAT_1 DisplayNamePlural]] "Demo Charges"),
	UnitStat = "Explosives",
	Cost = 1500,
	MinMishapChance = 35,
	MaxMishapChance = 90,
	MinMishapRange = 0,
	CenterObjDamageMod = 500,
	AreaOfEffect = 1,
	AreaObjDamageMod = 500,
	DeathType = "BlowUp",
	BaseDamage = 110,
	Scatter = 4,
	AttackAP = 2000,
	BaseRange = 3,
	InaccurateMaxOffset = 3000,
	IgnoreCoverReduction = 1,
	Entity = "Weapon_FragGrenadeM67",
}

