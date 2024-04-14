UndefineClass('_556_HP')
DefineClass._556_HP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	msg_reactions = {},
	Icon = "UI/Icons/Items/556_nato_bullets_hollow_point",
	DisplayName = T(275226346358, --[[ModItemInventoryItemCompositeDef _556_HP DisplayName]] "5.56 mm Hollow Point"),
	DisplayNamePlural = T(614648558919, --[[ModItemInventoryItemCompositeDef _556_HP DisplayNamePlural]] "5.56 mm Hollow Point"),
	colorStyle = "AmmoHPColor",
	Description = T(652468104254, --[[ModItemInventoryItemCompositeDef _556_HP Description]] "5.56 Ammo for Assault Rifles, SMGs, and Machine Guns."),
	AdditionalHint = T(555702520499, --[[ModItemInventoryItemCompositeDef _556_HP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Fragmentation effects increase Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> "),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "556",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "556",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 80,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 23,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

