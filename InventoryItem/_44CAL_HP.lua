UndefineClass('_44CAL_HP')
DefineClass._44CAL_HP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/44_cal_bullets_hollow_point",
	DisplayName = T(306503306348, --[[ModItemInventoryItemCompositeDef _44CAL_HP DisplayName]] ".44 Hollow Point"),
	DisplayNamePlural = T(272011439681, --[[ModItemInventoryItemCompositeDef _44CAL_HP DisplayNamePlural]] ".44 Hollow Point"),
	colorStyle = "AmmoHPColor",
	Description = T(488101908638, --[[ModItemInventoryItemCompositeDef _44CAL_HP Description]] ".44 Ammo for Revolvers and Rifles."),
	AdditionalHint = T(631917069606, --[[ModItemInventoryItemCompositeDef _44CAL_HP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>"),
	Cost = 200,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "44CAL",
	ShopStackSize = 12,
	MaxStacks = 500,
	Caliber = "44CAL",
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
			mod_add = 18,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

