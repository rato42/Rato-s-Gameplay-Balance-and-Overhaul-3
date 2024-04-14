UndefineClass('PipeBomb_RAT_1')
DefineClass.PipeBomb_RAT_1 = {
	__parents = { "ThrowableTrapItem" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "ThrowableTrapItem",
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Weapons/PipeBomb",
	ItemType = "Grenade",
	DisplayName = T(232826112174, --[[ModItemInventoryItemCompositeDef PipeBomb_RAT_1 DisplayName]] "Pipe Bomb"),
	DisplayNamePlural = T(523993988098, --[[ModItemInventoryItemCompositeDef PipeBomb_RAT_1 DisplayNamePlural]] "Pipe Bombs"),
	AdditionalHint = T(129032934614, --[[ModItemInventoryItemCompositeDef PipeBomb_RAT_1 AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Explodes after 1 turn (or 5 seconds out of combat)\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High mishap chance\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>."),
	UnitStat = "Explosives",
	Cost = 300,
	CanAppearInShop = true,
	RestockWeight = 50,
	CategoryPair = "Grenade",
	MinMishapChance = 25,
	MaxMishapChance = 90,
	MinMishapRange = 0,
	CenterUnitDamageMod = 130,
	CenterAppliedEffects = {
		"Bleeding",
	},
	Scatter = 4,
	AttackAP = 3000,
	BaseRange = 3,
	ThrowMaxRange = 12,
	InaccurateMaxOffset = 3000,
	Entity = "Explosive_TNT",
	ActionIcon = "UI/Icons/Hud/pipe_bomb",
	TriggerType = "Timed",
	ExplosiveType = "BlackPowder",
}

