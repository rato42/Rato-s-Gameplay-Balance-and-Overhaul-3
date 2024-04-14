UndefineClass('_762NATO_Basic')
DefineClass._762NATO_Basic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_nato_basic",
	DisplayName = T(935477693270, --[[ModItemInventoryItemCompositeDef _762NATO_Basic DisplayName]] "7.62 mm NATO Standard"),
	DisplayNamePlural = T(211805067677, --[[ModItemInventoryItemCompositeDef _762NATO_Basic DisplayNamePlural]] "7.62 mm NATO Standard"),
	colorStyle = "AmmoBasicColor",
	Description = T(593788801634, --[[ModItemInventoryItemCompositeDef _762NATO_Basic Description]] "7.62 NATO ammo for Assault Rifles, SMGs, and Machine Guns."),
	AdditionalHint = "",
	Cost = 170,
	CanAppearInShop = true,
	MaxStock = 10,
	CategoryPair = "762NATO",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762NATO",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 30,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	},
}

