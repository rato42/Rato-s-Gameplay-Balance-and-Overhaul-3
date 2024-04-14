UndefineClass('_44CAL_AP')
DefineClass._44CAL_AP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/44_cal_bullets_armor_piercing",
	DisplayName = T(133626859401, --[[ModItemInventoryItemCompositeDef _44CAL_AP DisplayName]] ".44 Armor Piercing"),
	DisplayNamePlural = T(145793499029, --[[ModItemInventoryItemCompositeDef _44CAL_AP DisplayNamePlural]] ".44 Armor Piercing"),
	colorStyle = "AmmoAPColor",
	Description = T(580267111838, --[[ModItemInventoryItemCompositeDef _44CAL_AP Description]] ".44 Ammo for Revolvers and Rifles."),
	AdditionalHint = T(904635884529, --[[ModItemInventoryItemCompositeDef _44CAL_AP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil"),
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
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 18,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

