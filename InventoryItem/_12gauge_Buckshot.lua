UndefineClass('_12gauge_Buckshot')
DefineClass._12gauge_Buckshot = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/12_gauge_bullets_buckshot",
	DisplayName = T(915310636425, --[[ModItemInventoryItemCompositeDef _12gauge_Buckshot DisplayName]] "12-gauge Buckshot"),
	DisplayNamePlural = T(251890089031, --[[ModItemInventoryItemCompositeDef _12gauge_Buckshot DisplayNamePlural]] "12-gauge Buckshot"),
	colorStyle = "AmmoBasicColor",
	Description = T(741335390585, --[[ModItemInventoryItemCompositeDef _12gauge_Buckshot Description]] "12-gauge ammo for Shotguns."),
	AdditionalHint = "",
	Cost = 120,
	CanAppearInShop = true,
	MaxStock = 5,
	RestockWeight = 80,
	ShopStackSize = 12,
	MaxStacks = 500,
	Caliber = "12gauge",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 34,
			target_prop = "Noise",
		}),
	},
}

