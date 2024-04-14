UndefineClass('_556_AP')
DefineClass._556_AP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/556_nato_bullets_armor_piercing",
	DisplayName = T(600557632961, --[[ModItemInventoryItemCompositeDef _556_AP DisplayName]] "5.56 mm Armor Piercing"),
	DisplayNamePlural = T(924283823767, --[[ModItemInventoryItemCompositeDef _556_AP DisplayNamePlural]] "5.56 mm Armor Piercing"),
	colorStyle = "AmmoAPColor",
	Description = T(710104102855, --[[ModItemInventoryItemCompositeDef _556_AP Description]] "5.56 Ammo for Assault Rifles, SMGs, and Machine Guns."),
	AdditionalHint = T(933257695658, --[[ModItemInventoryItemCompositeDef _556_AP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Fragmentation effects increase Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil"),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "556",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "556",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 20,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 23,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

