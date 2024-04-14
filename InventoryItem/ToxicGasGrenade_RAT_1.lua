UndefineClass('ToxicGasGrenade_RAT_1')
DefineClass.ToxicGasGrenade_RAT_1 = {
	__parents = { "Grenade" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Grenade",
	Repairable = false,
	Reliability = 100,
	Icon = "UI/Icons/Weapons/ToxicGrenade",
	ItemType = "GrenadeGas",
	DisplayName = T(272828573354, --[[ModItemInventoryItemCompositeDef ToxicGasGrenade_RAT_1 DisplayName]] "Mustard Gas Grenade"),
	DisplayNamePlural = T(822962788136, --[[ModItemInventoryItemCompositeDef ToxicGasGrenade_RAT_1 DisplayNamePlural]] "Mustard Gas Grenades"),
	AdditionalHint = T(962303582938, --[[ModItemInventoryItemCompositeDef ToxicGasGrenade_RAT_1 AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Choking</color>\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Ranged attacks passing through gas become grazing hits\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High mishap chance\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Almost silent"),
	UnitStat = "Explosives",
	Cost = 1500,
	MinMishapChance = 35,
	MaxMishapChance = 90,
	MinMishapRange = 0,
	CenterUnitDamageMod = 0,
	CenterObjDamageMod = 0,
	AreaUnitDamageMod = 0,
	AreaObjDamageMod = 0,
	PenetrationClass = 3,
	BaseDamage = 0,
	Scatter = 4,
	AttackAP = 4000,
	InaccurateMaxOffset = 3000,
	Noise = 0,
	aoeType = "toxicgas",
	Entity = "Weapon_MolotovCocktail",
	ActionIcon = "UI/Icons/Hud/toxic_grenade",
}

