UndefineClass('_50BMG_Basic')
DefineClass._50BMG_Basic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Repairable = false,
	Icon = "UI/Icons/Items/50bmg_basic",
	DisplayName = T(205090018120, --[[ModItemInventoryItemCompositeDef _50BMG_Basic DisplayName]] ".50 Standard"),
	DisplayNamePlural = T(570487837923, --[[ModItemInventoryItemCompositeDef _50BMG_Basic DisplayNamePlural]] ".50 Standard"),
	colorStyle = "AmmoBasicColor",
	Description = T(215774189221, --[[ModItemInventoryItemCompositeDef _50BMG_Basic Description]] ".50 Ammo for Machine Guns, Snipers and Handguns."),
	Cost = 400,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	CategoryPair = "50BMG",
	ShopStackSize = 10,
	MaxStacks = 500,
	Caliber = "50BMG",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 41,
			target_prop = "Noise",
		}),
	},
}

