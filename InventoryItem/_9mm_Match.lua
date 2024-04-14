UndefineClass('_9mm_Match')
DefineClass._9mm_Match = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/9mm_bullets_match",
	DisplayName = T(537478850508, --[[ModItemInventoryItemCompositeDef _9mm_Match DisplayName]] "9 mm Match"),
	DisplayNamePlural = T(194038869135, --[[ModItemInventoryItemCompositeDef _9mm_Match DisplayNamePlural]] "9 mm Match"),
	colorStyle = "AmmoMatchColor",
	Description = T(590812072897, --[[ModItemInventoryItemCompositeDef _9mm_Match Description]] "9 mm ammo for Handguns and SMGs."),
	AdditionalHint = T(311544344177, --[[ModItemInventoryItemCompositeDef _9mm_Match AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling"),
	Cost = 160,
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
			mod_add = 15,
			target_prop = "Noise",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_match.png",
}

