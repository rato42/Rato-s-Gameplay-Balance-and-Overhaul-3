UndefineClass('_54539_HP')
DefineClass._54539_HP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/545hp.png",
	DisplayName = T(566550874710, --[[ModItemInventoryItemCompositeDef _54539_HP DisplayName]] "5.45x39 mm Hollow Point"),
	DisplayNamePlural = T(740678411371, --[[ModItemInventoryItemCompositeDef _54539_HP DisplayNamePlural]] "5.45x39 mm Hollow Point"),
	colorStyle = "AmmoHPColor",
	Description = T(748237552261, --[[ModItemInventoryItemCompositeDef _54539_HP Description]] "5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns."),
	AdditionalHint = T(866354746761, --[[ModItemInventoryItemCompositeDef _54539_HP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Tumbling effects increase Critical Chance\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>\n"),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "545x39",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "545x39",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 22,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

