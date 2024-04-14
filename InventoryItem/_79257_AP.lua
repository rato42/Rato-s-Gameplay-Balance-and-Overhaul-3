UndefineClass('_79257_AP')
DefineClass._79257_AP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/mouserap.png",
	DisplayName = T(475999538064, --[[ModItemInventoryItemCompositeDef _79257_AP DisplayName]] "7.92x57 mm Armor Piercing"),
	DisplayNamePlural = T(985646479437, --[[ModItemInventoryItemCompositeDef _79257_AP DisplayNamePlural]] "7.92x57 mm Armor Piercing"),
	colorStyle = "AmmoAPColor",
	Description = T(339597228425, --[[ModItemInventoryItemCompositeDef _79257_AP Description]] "7.92x57 mm ammo for Rifles and Machine Guns. Also known as 8mm Mauser."),
	AdditionalHint = T(865327027225, --[[ModItemInventoryItemCompositeDef _79257_AP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil"),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "792x57",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "792x57",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 31,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

