UndefineClass('_44CAL_Subsonic')
DefineClass._44CAL_Subsonic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/44_cal_bullets_basic",
	SubIcon = "Mod/cfahRED/icons/silence4.png",
	DisplayName = T(163213942965, --[[ModItemInventoryItemCompositeDef _44CAL_Subsonic DisplayName]] ".44 Subsonic "),
	DisplayNamePlural = T(494852842373, --[[ModItemInventoryItemCompositeDef _44CAL_Subsonic DisplayNamePlural]] ".44 Subsonic "),
	colorStyle = "AmmoMatchColor",
	Description = T(153053493331, --[[ModItemInventoryItemCompositeDef _44CAL_Subsonic Description]] ".44 Subsonic Ammo for Revolvers and Rifles."),
	AdditionalHint = T(635624034469, --[[ModItemInventoryItemCompositeDef _44CAL_Subsonic AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Less noisy\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128\n120> Less bullet speed, resulting in less Aim Accuracy, Range and no armor penetration\n"),
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
			mod_add = 18,
			mod_mul = 400,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -1,
			target_prop = "AimAccuracy",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_subsonic.png",
}

