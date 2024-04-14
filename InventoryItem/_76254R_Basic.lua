UndefineClass('_76254R_Basic')
DefineClass._76254R_Basic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/standardBewar.png",
	DisplayName = T(153597847062, --[[ModItemInventoryItemCompositeDef _76254R_Basic DisplayName]] "7.62x54 mmR Standard"),
	DisplayNamePlural = T(605220232033, --[[ModItemInventoryItemCompositeDef _76254R_Basic DisplayNamePlural]] "7.62x54 mmR Standard"),
	colorStyle = "AmmoBasicColor",
	Description = T(652416980425, --[[ModItemInventoryItemCompositeDef _76254R_Basic Description]] "7.62x54 mmR ammo for Soviet Snipers."),
	Cost = 180,
	CanAppearInShop = true,
	MaxStock = 5,
	CategoryPair = "762x54R",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762x54R",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 32,
			target_prop = "Noise",
		}),
	},
}

