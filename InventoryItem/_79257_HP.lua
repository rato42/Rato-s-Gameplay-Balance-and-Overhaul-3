UndefineClass('_79257_HP')
DefineClass._79257_HP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/mouserhp.png",
	DisplayName = T(607611100835, --[[ModItemInventoryItemCompositeDef _79257_HP DisplayName]] "7.92x57 mm Hollow Point"),
	DisplayNamePlural = T(933405594600, --[[ModItemInventoryItemCompositeDef _79257_HP DisplayNamePlural]] "7.92x57 mm Hollow Point"),
	colorStyle = "AmmoHPColor",
	Description = T(235076085944, --[[ModItemInventoryItemCompositeDef _79257_HP Description]] "7.92x57 mm ammo for Rifles and Machine Guns. Also known as 8mm Mauser."),
	AdditionalHint = T(211661937304, --[[ModItemInventoryItemCompositeDef _79257_HP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> "),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "792x57",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "792x57",
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
			mod_add = 31,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

