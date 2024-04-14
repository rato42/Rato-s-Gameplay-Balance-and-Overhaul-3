UndefineClass('_54539_AP')
DefineClass._54539_AP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/545ap.png",
	DisplayName = T(435656572771, --[[ModItemInventoryItemCompositeDef _54539_AP DisplayName]] "5.45x39 mm Armor Piercing"),
	DisplayNamePlural = T(289115251261, --[[ModItemInventoryItemCompositeDef _54539_AP DisplayNamePlural]] "5.45x39 mm Armor Piercing"),
	colorStyle = "AmmoAPColor",
	Description = T(788343361474, --[[ModItemInventoryItemCompositeDef _54539_AP Description]] "5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns."),
	AdditionalHint = T(250462996756, --[[ModItemInventoryItemCompositeDef _54539_AP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Tumbling effects increase Critical Chance\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil"),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "545x39",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "545x39",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -10,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

