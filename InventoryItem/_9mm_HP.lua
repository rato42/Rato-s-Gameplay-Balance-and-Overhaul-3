UndefineClass('_9mm_HP')
DefineClass._9mm_HP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/9mm_bullets_hollow_point",
	DisplayName = T(787173840617, --[[ModItemInventoryItemCompositeDef _9mm_HP DisplayName]] "9 mm Hollow Point"),
	DisplayNamePlural = T(561334254858, --[[ModItemInventoryItemCompositeDef _9mm_HP DisplayNamePlural]] "9 mm Hollow Point"),
	colorStyle = "AmmoHPColor",
	Description = T(193998098852, --[[ModItemInventoryItemCompositeDef _9mm_HP Description]] "9 mm ammo for Handguns and SMGs."),
	AdditionalHint = T(806356247751, --[[ModItemInventoryItemCompositeDef _9mm_HP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>"),
	Cost = 120,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "9mm",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "9mm",
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
			mod_add = 15,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

