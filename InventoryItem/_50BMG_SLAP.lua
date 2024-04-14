UndefineClass('_50BMG_SLAP')
DefineClass._50BMG_SLAP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/50bmg_slap",
	DisplayName = T(744285738454, --[[ModItemInventoryItemCompositeDef _50BMG_SLAP DisplayName]] ".50 SLAP"),
	DisplayNamePlural = T(215269486125, --[[ModItemInventoryItemCompositeDef _50BMG_SLAP DisplayNamePlural]] ".50 SLAP"),
	colorStyle = "AmmoAPColor",
	Description = T(756896868744, --[[ModItemInventoryItemCompositeDef _50BMG_SLAP Description]] ".50 Ammo for Machine Guns, Snipers and Handguns."),
	AdditionalHint = T(299625828312, --[[ModItemInventoryItemCompositeDef _50BMG_SLAP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Slightly higher Crit chance"),
	Cost = 850,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "50BMG",
	ShopStackSize = 10,
	MaxStacks = 500,
	Caliber = "50BMG",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 5,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 41,
			target_prop = "Noise",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

