UndefineClass('_79257_Match')
DefineClass._79257_Match = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/mausermatch.png",
	DisplayName = T(896093733337, --[[ModItemInventoryItemCompositeDef _79257_Match DisplayName]] "7.92x57 mm Match"),
	DisplayNamePlural = T(805840788770, --[[ModItemInventoryItemCompositeDef _79257_Match DisplayNamePlural]] "7.92x57 mm Match"),
	colorStyle = "AmmoMatchColor",
	Description = T(450673135031, --[[ModItemInventoryItemCompositeDef _79257_Match Description]] "7.92x57 mm ammo for Rifles and Machine Guns. Also known as 8mm Mauser."),
	AdditionalHint = T(455550566338, --[[ModItemInventoryItemCompositeDef _79257_Match AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling"),
	Cost = 400,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "792x57",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "792x57",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 31,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_match.png",
}

