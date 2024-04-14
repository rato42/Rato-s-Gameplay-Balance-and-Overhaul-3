UndefineClass('_54539_Basic')
DefineClass._54539_Basic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/545standard 2.png",
	DisplayName = T(927603767425, --[[ModItemInventoryItemCompositeDef _54539_Basic DisplayName]] "5.45x39 mm Standard"),
	DisplayNamePlural = T(600929895830, --[[ModItemInventoryItemCompositeDef _54539_Basic DisplayNamePlural]] "5.45x39 mm Standard"),
	colorStyle = "AmmoBasicColor",
	Description = T(486040919412, --[[ModItemInventoryItemCompositeDef _54539_Basic Description]] "5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns."),
	AdditionalHint = T(977131894837, --[[ModItemInventoryItemCompositeDef _54539_Basic AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Tumbling effects increase Critical Chance"),
	Cost = 150,
	CanAppearInShop = true,
	MaxStock = 5,
	RestockWeight = 80,
	CategoryPair = "545x39",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "545x39",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 22,
			target_prop = "Noise",
		}),
	},
}

