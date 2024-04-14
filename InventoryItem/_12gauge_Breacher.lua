UndefineClass('_12gauge_Breacher')
DefineClass._12gauge_Breacher = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/12_gauge_bullets_breacher",
	DisplayName = T(774145006154, --[[ModItemInventoryItemCompositeDef _12gauge_Breacher DisplayName]] "12-gauge Breacher"),
	DisplayNamePlural = T(566625716099, --[[ModItemInventoryItemCompositeDef _12gauge_Breacher DisplayNamePlural]] "12-gauge Breacher"),
	colorStyle = "AmmoAPColor",
	Description = T(564433529540, --[[ModItemInventoryItemCompositeDef _12gauge_Breacher Description]] "12-gauge ammo for Shotguns."),
	AdditionalHint = T(943424643860, --[[ModItemInventoryItemCompositeDef _12gauge_Breacher AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Very short range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Wide attack cone\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Improved armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Prevents Grazing hits due to opponents Taking Cover\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Suppressed</color>"),
	Cost = 240,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	ShopStackSize = 12,
	MaxStacks = 500,
	Caliber = "12gauge",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "IgnoreCoverReduction",
		}),
		PlaceObj('CaliberModification', {
			mod_mul = 500,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_mul = 2000,
			target_prop = "ObjDamageMod",
		}),
		PlaceObj('CaliberModification', {
			mod_mul = 1700,
			target_prop = "BuckshotConeAngle",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 34,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Suppressed",
	},
	ammo_type_icon = "UI/Icons/Items/ta_ap.png",
}

