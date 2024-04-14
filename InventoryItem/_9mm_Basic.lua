UndefineClass('_9mm_Basic')
DefineClass._9mm_Basic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/9mm_bullets_basic",
	DisplayName = T(978437267960, --[[ModItemInventoryItemCompositeDef _9mm_Basic DisplayName]] "9 mm Standard"),
	DisplayNamePlural = T(518204169122, --[[ModItemInventoryItemCompositeDef _9mm_Basic DisplayNamePlural]] "9 mm Standard"),
	colorStyle = "AmmoBasicColor",
	Description = T(744632544722, --[[ModItemInventoryItemCompositeDef _9mm_Basic Description]] "9 mm ammo for Handguns and SMGs."),
	Cost = 60,
	CanAppearInShop = true,
	MaxStock = 10,
	CategoryPair = "9mm",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "9mm",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 15,
			target_prop = "Noise",
		}),
	},
}

