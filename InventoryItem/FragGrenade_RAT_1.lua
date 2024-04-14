UndefineClass('FragGrenade_RAT_1')
DefineClass.FragGrenade_RAT_1 = {
	__parents = { "Grenade" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Grenade",
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Weapons/Frag Grenade",
	ItemType = "Grenade",
	DisplayName = T(146997848852, --[[ModItemInventoryItemCompositeDef FragGrenade_RAT_1 DisplayName]] "Stick Grenade"),
	DisplayNamePlural = T(124899742980, --[[ModItemInventoryItemCompositeDef FragGrenade_RAT_1 DisplayNamePlural]] "Stick Grenades"),
	Description = "",
	AdditionalHint = "",
	UnitStat = "Explosives",
	Cost = 400,
	CanAppearInShop = true,
	CategoryPair = "Grenade",
	MinMishapChance = 30,
	MaxMishapChance = 90,
	MinMishapRange = 0,
	MaxMishapRange = 3,
	CenterUnitDamageMod = 130,
	CenterObjDamageMod = 200,
	AreaObjDamageMod = 250,
	PenetrationClass = 4,
	DeathType = "BlowUp",
	BaseDamage = 22,
	Scatter = 4,
	BaseRange = 7,
	ThrowMaxRange = 17,
	CanBounce = false,
	InaccurateMaxOffset = 3000,
	Entity = "MilitaryCamp_Grenade_01",
	ActionIcon = "UI/Icons/Hud/frag_grenade",
}

