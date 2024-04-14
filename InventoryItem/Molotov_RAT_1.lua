UndefineClass('Molotov_RAT_1')
DefineClass.Molotov_RAT_1 = {
	__parents = { "Grenade" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Grenade",
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Weapons/Molotov",
	ItemType = "GrenadeFire",
	DisplayName = T(926860542333, --[[ModItemInventoryItemCompositeDef Molotov_RAT_1 DisplayName]] "Molotov Cocktail"),
	DisplayNamePlural = T(612102937782, --[[ModItemInventoryItemCompositeDef Molotov_RAT_1 DisplayNamePlural]] "Molotov Cocktails"),
	AdditionalHint = T(832973304223, --[[ModItemInventoryItemCompositeDef Molotov_RAT_1 AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Sets an area on fire and inflicts <color EmStyle>Burning</color>\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High mishap chance"),
	UnitStat = "Explosives",
	Cost = 300,
	CanAppearInShop = true,
	RestockWeight = 50,
	CategoryPair = "Grenade",
	MinMishapChance = 35,
	MaxMishapChance = 90,
	MinMishapRange = 0,
	CenterUnitDamageMod = 0,
	CenterObjDamageMod = 0,
	CenterAppliedEffects = {
		"Burning",
	},
	AreaUnitDamageMod = 0,
	AreaObjDamageMod = 0,
	AreaAppliedEffects = {
		"Burning",
	},
	PenetrationClass = 1,
	BaseDamage = 0,
	Scatter = 4,
	AttackAP = 4000,
	CanBounce = false,
	InaccurateMaxOffset = 4000,
	Noise = 0,
	aoeType = "fire",
	Entity = "Weapon_MolotovCocktail",
	ActionIcon = "UI/Icons/Hud/molotov",
}

