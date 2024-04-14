UndefineClass('_44CAL_Basic')
DefineClass._44CAL_Basic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/44_cal_bullets_basic",
	DisplayName = T(240220463831, --[[ModItemInventoryItemCompositeDef _44CAL_Basic DisplayName]] ".44 Standard"),
	DisplayNamePlural = T(551984671374, --[[ModItemInventoryItemCompositeDef _44CAL_Basic DisplayNamePlural]] ".44 Standard"),
	colorStyle = "AmmoBasicColor",
	Description = T(789775097287, --[[ModItemInventoryItemCompositeDef _44CAL_Basic Description]] ".44 Ammo for Revolvers and Rifles."),
	Cost = 100,
	CanAppearInShop = true,
	MaxStock = 5,
	CategoryPair = "44CAL",
	ShopStackSize = 12,
	MaxStacks = 500,
	Caliber = "44CAL",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 18,
			target_prop = "Noise",
		}),
	},
}

