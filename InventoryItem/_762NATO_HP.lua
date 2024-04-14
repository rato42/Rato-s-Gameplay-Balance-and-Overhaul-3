UndefineClass('_762NATO_HP')
DefineClass._762NATO_HP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_nato_bullets_hollow_point",
	DisplayName = T(134192824079, --[[ModItemInventoryItemCompositeDef _762NATO_HP DisplayName]] "7.62 mm NATO Hollow Point"),
	DisplayNamePlural = T(878088803504, --[[ModItemInventoryItemCompositeDef _762NATO_HP DisplayNamePlural]] "7.62 mm NATO Hollow Point"),
	colorStyle = "AmmoHPColor",
	Description = T(681496686004, --[[ModItemInventoryItemCompositeDef _762NATO_HP Description]] "7.62 NATO ammo for Assault Rifles, SMGs, and Machine Guns."),
	AdditionalHint = T(519059061039, --[[ModItemInventoryItemCompositeDef _762NATO_HP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> "),
	Cost = 340,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762NATO",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762NATO",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 50,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 30,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

