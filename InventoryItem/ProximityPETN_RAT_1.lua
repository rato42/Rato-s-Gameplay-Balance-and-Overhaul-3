UndefineClass('ProximityPETN_RAT_1')
DefineClass.ProximityPETN_RAT_1 = {
	__parents = { "ThrowableTrapItem" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "ThrowableTrapItem",
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Items/proximity_petn",
	ItemType = "Grenade",
	DisplayName = T(282364480662, --[[ModItemInventoryItemCompositeDef ProximityPETN_RAT_1 DisplayName]] "Proximity PETN"),
	DisplayNamePlural = T(314769385285, --[[ModItemInventoryItemCompositeDef ProximityPETN_RAT_1 DisplayNamePlural]] "Proximity PETN"),
	AdditionalHint = T(376655766622, --[[ModItemInventoryItemCompositeDef ProximityPETN_RAT_1 AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Explodes when an enemy enters a small area around it"),
	UnitStat = "Explosives",
	Cost = 1500,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 1,
	RestockWeight = 10,
	CategoryPair = "Grenade",
	MinMishapChance = 2,
	MaxMishapChance = 30,
	MaxMishapRange = 6,
	AttackAP = 7000,
	BaseRange = 3,
	ThrowMaxRange = 8,
	CanBounce = false,
	Noise = 30,
	Entity = "Explosive_PETN",
	ActionIcon = "UI/Icons/Hud/throw_proximity_explosive",
	TriggerType = "Proximity",
	ExplosiveType = "PETN",
}

