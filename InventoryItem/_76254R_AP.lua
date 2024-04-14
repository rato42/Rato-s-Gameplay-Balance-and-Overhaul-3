UndefineClass('_76254R_AP')
DefineClass._76254R_AP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/bearAP.png",
	DisplayName = T(656791150837, --[[ModItemInventoryItemCompositeDef _76254R_AP DisplayName]] "7.62x54 mmR Armor Piercing"),
	DisplayNamePlural = T(499328191390, --[[ModItemInventoryItemCompositeDef _76254R_AP DisplayNamePlural]] "7.62x54 mmR Armor Piercing"),
	colorStyle = "AmmoAPColor",
	Description = T(990715196230, --[[ModItemInventoryItemCompositeDef _76254R_AP Description]] "7.62x54mmR Armor Pìercing ammo for Soviet Snipers."),
	AdditionalHint = T(232979048783, --[[ModItemInventoryItemCompositeDef _76254R_AP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Decreased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased recoil"),
	Cost = 360,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762x54R",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762x54R",
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
			mod_add = 32,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "ArmorPir",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

