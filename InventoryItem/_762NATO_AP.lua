UndefineClass('_762NATO_AP')
DefineClass._762NATO_AP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_nato_bullets_armor_piercing",
	DisplayName = T(432086535015, --[[ModItemInventoryItemCompositeDef _762NATO_AP DisplayName]] "7.62 mm NATO Armor Piercing"),
	DisplayNamePlural = T(948782088109, --[[ModItemInventoryItemCompositeDef _762NATO_AP DisplayNamePlural]] "7.62 mm NATO Armor Piercing"),
	colorStyle = "AmmoAPColor",
	Description = T(762990944795, --[[ModItemInventoryItemCompositeDef _762NATO_AP Description]] "7.62 NATO ammo for Assault Rifles, Rifles, and Machine Guns."),
	AdditionalHint = T(459670675799, --[[ModItemInventoryItemCompositeDef _762NATO_AP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil"),
	Cost = 340,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762NATO",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762NATO",
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
			mod_add = 30,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

