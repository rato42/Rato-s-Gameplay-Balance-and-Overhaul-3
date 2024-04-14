UndefineClass('FlareHandgun')
DefineClass.FlareHandgun = {
	__parents = { "FlareGun" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "FlareGun",
	ScrapParts = 2,
	RepairCost = 70,
	Reliability = 20,
	Icon = "UI/Icons/Weapons/FlareGun",
	ItemType = "FlareGun",
	DisplayName = T(749253793503, --[[ModItemInventoryItemCompositeDef FlareHandgun DisplayName]] "Flare Gun"),
	DisplayNamePlural = T(453199394025, --[[ModItemInventoryItemCompositeDef FlareHandgun DisplayNamePlural]] "Flare Guns"),
	Description = T(989205745744, --[[ModItemInventoryItemCompositeDef FlareHandgun Description]] "Single-shot breech-loading pistol you can use to light up the sky. "),
	AdditionalHint = T(501434818283, --[[ModItemInventoryItemCompositeDef FlareHandgun AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Illuminates a large area\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Long range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Silent"),
	UnitStat = "Marksmanship",
	Valuable = 1,
	Cost = 600,
	CanAppearInShop = true,
	Tier = 2,
	Caliber = "Flare",
	ObjDamageMod = 0,
	CritChanceScaled = 0,
	WeaponRange = 35,
	OverwatchAngle = 2160,
	Noise = 3,
	Entity = "Weapon_FlareGun",
	HolsterSlot = "Leg",
	PreparedAttackType = "None",
	AvailableAttacks = {
		"FireFlare",
	},
	is_vanilla_firearm = true,
	MinMishapChance = 20,
	MaxMishapChance = 60,
}

