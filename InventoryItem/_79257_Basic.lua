UndefineClass('_79257_Basic')
DefineClass._79257_Basic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/mauserstandard.png",
	DisplayName = T(541505833631, --[[ModItemInventoryItemCompositeDef _79257_Basic DisplayName]] "7.92x57 mm Standard"),
	DisplayNamePlural = T(401106337259, --[[ModItemInventoryItemCompositeDef _79257_Basic DisplayNamePlural]] "7.92x57 mm Standard"),
	colorStyle = "AmmoBasicColor",
	Description = T(427217931354, --[[ModItemInventoryItemCompositeDef _79257_Basic Description]] "7.92x57 mm ammo for Rifles and Machine Guns. Also known as 8mm Mauser."),
	AdditionalHint = "",
	Cost = 150,
	CanAppearInShop = true,
	MaxStock = 10,
	RestockWeight = 120,
	CategoryPair = "792x57",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "792x57",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 31,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	},
}

