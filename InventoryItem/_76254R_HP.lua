UndefineClass('_76254R_HP')
DefineClass._76254R_HP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/bearHP.png",
	DisplayName = T(846418440449, --[[ModItemInventoryItemCompositeDef _76254R_HP DisplayName]] "7.62x54 mmR Hollow Point"),
	DisplayNamePlural = T(580211949695, --[[ModItemInventoryItemCompositeDef _76254R_HP DisplayNamePlural]] "7.62x54 mmR Hollow Point"),
	colorStyle = "AmmoHPColor",
	Description = T(847846994662, --[[ModItemInventoryItemCompositeDef _76254R_HP Description]] "7.62x54 mmR ammo for Soviet Snipers."),
	AdditionalHint = T(602212805896, --[[ModItemInventoryItemCompositeDef _76254R_HP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>"),
	Cost = 360,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762x54R",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762x54R",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 32,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

