UndefineClass('ProximityTNT_RAT_1')
DefineClass.ProximityTNT_RAT_1 = {
	__parents = { "ThrowableTrapItem" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "ThrowableTrapItem",
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Items/proximity_tnt",
	ItemType = "Grenade",
	DisplayName = T(215184120147, --[[ModItemInventoryItemCompositeDef ProximityTNT_RAT_1 DisplayName]] "Proximity TNT"),
	DisplayNamePlural = T(208513153288, --[[ModItemInventoryItemCompositeDef ProximityTNT_RAT_1 DisplayNamePlural]] "Proximity TNT"),
	AdditionalHint = T(341104644756, --[[ModItemInventoryItemCompositeDef ProximityTNT_RAT_1 AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Explodes when an enemy enters a small area around it\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High mishap chance"),
	UnitStat = "Explosives",
	Cost = 850,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 1,
	RestockWeight = 20,
	MinMishapChance = 2,
	MaxMishapChance = 30,
	MaxMishapRange = 6,
	AttackAP = 7000,
	BaseRange = 3,
	ThrowMaxRange = 7,
	CanBounce = false,
	Noise = 30,
	Entity = "Explosive_TNT",
	ActionIcon = "UI/Icons/Hud/throw_proximity_explosive",
	TriggerType = "Proximity",
}

