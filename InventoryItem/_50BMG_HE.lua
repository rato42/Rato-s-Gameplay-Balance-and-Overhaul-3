UndefineClass('_50BMG_HE')
DefineClass._50BMG_HE = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/50bmg_he",
	DisplayName = T(738668600705, --[[ModItemInventoryItemCompositeDef _50BMG_HE DisplayName]] ".50 Explosive"),
	DisplayNamePlural = T(250096960003, --[[ModItemInventoryItemCompositeDef _50BMG_HE DisplayNamePlural]] ".50 Explosive"),
	colorStyle = "AmmoHPColor",
	Description = T(992448606469, --[[ModItemInventoryItemCompositeDef _50BMG_HE Description]] ".50 Ammo for Machine Guns, Snipers and Handguns."),
	AdditionalHint = T(814749886173, --[[ModItemInventoryItemCompositeDef _50BMG_HE AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Crit chance"),
	Cost = 850,
	CanAppearInShop = true,
	Tier = 3,
	RestockWeight = 25,
	CategoryPair = "50BMG",
	ShopStackSize = 10,
	MaxStacks = 500,
	Caliber = "50BMG",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 50,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 41,
			target_prop = "Noise",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

