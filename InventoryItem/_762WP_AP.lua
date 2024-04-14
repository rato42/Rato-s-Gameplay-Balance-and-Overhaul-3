UndefineClass('_762WP_AP')
DefineClass._762WP_AP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_wp_bullets_armor_piercing",
	DisplayName = T(267788900512, --[[ModItemInventoryItemCompositeDef _762WP_AP DisplayName]] "7.62 mm WP Armor Piercing"),
	DisplayNamePlural = T(356892535306, --[[ModItemInventoryItemCompositeDef _762WP_AP DisplayNamePlural]] "7.62 mm WP Armor Piercing"),
	colorStyle = "AmmoAPColor",
	Description = T(643968489814, --[[ModItemInventoryItemCompositeDef _762WP_AP Description]] "7.62 Warsaw Pact ammo for Assault Rifles, SMGs, Machine Guns, and Rifles."),
	AdditionalHint = T(890506330615, --[[ModItemInventoryItemCompositeDef _762WP_AP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil"),
	Cost = 180,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762WP",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762WP",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -20,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

