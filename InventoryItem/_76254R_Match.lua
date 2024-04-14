UndefineClass('_76254R_Match')
DefineClass._76254R_Match = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/MAtchBear.png",
	DisplayName = T(698293087022, --[[ModItemInventoryItemCompositeDef _76254R_Match DisplayName]] "7.62x54 mmR Match"),
	DisplayNamePlural = T(607679677001, --[[ModItemInventoryItemCompositeDef _76254R_Match DisplayNamePlural]] "7.62x54 mmR Match"),
	colorStyle = "AmmoMatchColor",
	Description = T(469488049803, --[[ModItemInventoryItemCompositeDef _76254R_Match Description]] "7.62x54 mmR ammo for Soviet Snipers."),
	AdditionalHint = T(814572178083, --[[ModItemInventoryItemCompositeDef _76254R_Match AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling"),
	Cost = 480,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762x54R",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762x54R",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 32,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_match.png",
}

