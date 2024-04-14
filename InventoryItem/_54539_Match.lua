UndefineClass('_54539_Match')
DefineClass._54539_Match = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/545match.png",
	DisplayName = T(374713278792, --[[ModItemInventoryItemCompositeDef _54539_Match DisplayName]] "5.45x39 mm Match"),
	DisplayNamePlural = T(946177478831, --[[ModItemInventoryItemCompositeDef _54539_Match DisplayNamePlural]] "5.45x39 mm Match"),
	colorStyle = "AmmoMatchColor",
	Description = T(831414139146, --[[ModItemInventoryItemCompositeDef _54539_Match Description]] "545x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns."),
	AdditionalHint = T(489625771475, --[[ModItemInventoryItemCompositeDef _54539_Match AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Tumbling effects increase Critical Chance\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling"),
	Cost = 400,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "545x39",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "545x39",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
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
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 15,
			target_prop = "CritChance",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_match.png",
}

