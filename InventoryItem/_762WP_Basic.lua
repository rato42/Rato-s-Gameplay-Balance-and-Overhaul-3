UndefineClass('_762WP_Basic')
DefineClass._762WP_Basic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_wp_bullets_basic",
	DisplayName = T(227414057145, --[[ModItemInventoryItemCompositeDef _762WP_Basic DisplayName]] "7.62 mm WP Standard"),
	DisplayNamePlural = T(902260839054, --[[ModItemInventoryItemCompositeDef _762WP_Basic DisplayNamePlural]] "7.62 mm WP Standard"),
	colorStyle = "AmmoBasicColor",
	Description = T(730812560449, --[[ModItemInventoryItemCompositeDef _762WP_Basic Description]] "7.62 Warsaw Pact ammo for Assault Rifles, SMGs, Machine Guns, and Rifles."),
	Cost = 90,
	CanAppearInShop = true,
	MaxStock = 10,
	CategoryPair = "762WP",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762WP",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
	},
}

