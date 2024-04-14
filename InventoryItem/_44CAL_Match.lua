UndefineClass('_44CAL_Match')
DefineClass._44CAL_Match = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/44_cal_bullets_match",
	DisplayName = T(880950322273, --[[ModItemInventoryItemCompositeDef _44CAL_Match DisplayName]] ".44 Match"),
	DisplayNamePlural = T(539926541779, --[[ModItemInventoryItemCompositeDef _44CAL_Match DisplayNamePlural]] ".44 Match"),
	colorStyle = "AmmoMatchColor",
	Description = T(211272178702, --[[ModItemInventoryItemCompositeDef _44CAL_Match Description]] ".44 Ammo for Revolvers and Rifles."),
	AdditionalHint = T(817408014097, --[[ModItemInventoryItemCompositeDef _44CAL_Match AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling"),
	Cost = 260,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "44CAL",
	ShopStackSize = 12,
	MaxStacks = 500,
	Caliber = "44CAL",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 18,
			target_prop = "Noise",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_match.png",
}

