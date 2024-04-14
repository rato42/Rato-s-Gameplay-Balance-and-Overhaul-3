UndefineClass('_9mm_Subsonic')
DefineClass._9mm_Subsonic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/9mm_bullets_subsonic",
	SubIcon = "Mod/cfahRED/icons/silence4.png",
	DisplayName = T(262681206470, --[[ModItemInventoryItemCompositeDef _9mm_Subsonic DisplayName]] "9 mm Subsonic"),
	DisplayNamePlural = T(567791763976, --[[ModItemInventoryItemCompositeDef _9mm_Subsonic DisplayNamePlural]] "9 mm Subsonic"),
	colorStyle = "AmmoMatchColor",
	Description = T(173540095780, --[[ModItemInventoryItemCompositeDef _9mm_Subsonic Description]] "9 mm Subsonic ammo for Handguns and SMGs."),
	AdditionalHint = T(433073250972, --[[ModItemInventoryItemCompositeDef _9mm_Subsonic AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Less noisy\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128\n120> Less bullet speed, resulting in less Aim Accuracy, Range and no armor penetration\n"),
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
			mod_add = 15,
			mod_mul = 350,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -2,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -1,
			target_prop = "AimAccuracy",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_subsonic.png",
}

