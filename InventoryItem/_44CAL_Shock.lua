UndefineClass('_44CAL_Shock')
DefineClass._44CAL_Shock = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/44_cal_bullets_shock",
	DisplayName = T(549850958268, --[[ModItemInventoryItemCompositeDef _44CAL_Shock DisplayName]] ".44 Shock"),
	DisplayNamePlural = T(803141678257, --[[ModItemInventoryItemCompositeDef _44CAL_Shock DisplayNamePlural]] ".44 Shock"),
	colorStyle = "AmmoHPColor",
	Description = T(329886057907, --[[ModItemInventoryItemCompositeDef _44CAL_Shock Description]] ".44 Ammo for Revolvers and Rifles."),
	AdditionalHint = T(211745536883, --[[ModItemInventoryItemCompositeDef _44CAL_Shock AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Reduced range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Greater Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>"),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 10,
	CategoryPair = "44CAL",
	ShopStackSize = 12,
	MaxStacks = 500,
	Caliber = "44CAL",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 70,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 18,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_shock.png",
}

