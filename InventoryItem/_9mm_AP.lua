UndefineClass('_9mm_AP')
DefineClass._9mm_AP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/9mm_bullets_armor_piercing",
	DisplayName = T(950748336625, --[[ModItemInventoryItemCompositeDef _9mm_AP DisplayName]] "9 mm Armor Piercing"),
	DisplayNamePlural = T(642479905286, --[[ModItemInventoryItemCompositeDef _9mm_AP DisplayNamePlural]] "9 mm Armor Piercing"),
	colorStyle = "AmmoAPColor",
	Description = T(552305790881, --[[ModItemInventoryItemCompositeDef _9mm_AP Description]] "9 mm ammo for Handguns and SMGs."),
	AdditionalHint = T(675888786517, --[[ModItemInventoryItemCompositeDef _9mm_AP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil"),
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
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 15,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

