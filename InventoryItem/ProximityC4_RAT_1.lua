UndefineClass('ProximityC4_RAT_1')
DefineClass.ProximityC4_RAT_1 = {
	__parents = { "ThrowableTrapItem" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "ThrowableTrapItem",
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Items/proximity_c4",
	ItemType = "Grenade",
	DisplayName = T(863096155060, --[[ModItemInventoryItemCompositeDef ProximityC4_RAT_1 DisplayName]] "Proximity C4"),
	DisplayNamePlural = T(260652867879, --[[ModItemInventoryItemCompositeDef ProximityC4_RAT_1 DisplayNamePlural]] "Proximity C4"),
	AdditionalHint = T(461714012626, --[[ModItemInventoryItemCompositeDef ProximityC4_RAT_1 AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Explodes when an enemy enters a small area around it"),
	UnitStat = "Explosives",
	Cost = 1200,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 1,
	RestockWeight = 10,
	CategoryPair = "Grenade",
	MinMishapChance = 2,
	MaxMishapChance = 30,
	MaxMishapRange = 6,
	Scatter = 2,
	AttackAP = 7000,
	BaseRange = 3,
	ThrowMaxRange = 8,
	CanBounce = false,
	IgnoreCoverReduction = 1,
	Noise = 30,
	Entity = "Explosive_C4",
	ActionIcon = "UI/Icons/Hud/throw_proximity_explosive",
	TriggerType = "Proximity",
	ExplosiveType = "C4",
}

