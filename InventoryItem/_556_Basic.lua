UndefineClass('_556_Basic')
DefineClass._556_Basic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/556_nato_bullets_basic",
	DisplayName = T(237082947551, --[[ModItemInventoryItemCompositeDef _556_Basic DisplayName]] "5.56 mm Standard"),
	DisplayNamePlural = T(620840656247, --[[ModItemInventoryItemCompositeDef _556_Basic DisplayNamePlural]] "5.56 mm Standard"),
	colorStyle = "AmmoBasicColor",
	Description = T(244611028370, --[[ModItemInventoryItemCompositeDef _556_Basic Description]] "5.56 Ammo for Assault Rifles, SMGs, and Machine Guns."),
	AdditionalHint = T(137656285071, --[[ModItemInventoryItemCompositeDef _556_Basic AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Fragmentation effects increase Critical Damage"),
	Cost = 150,
	CanAppearInShop = true,
	MaxStock = 10,
	CategoryPair = "556",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "556",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 23,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 30,
			target_prop = "CritDamage",
		}),
	},
}

