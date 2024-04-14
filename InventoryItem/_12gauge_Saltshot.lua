UndefineClass('_12gauge_Saltshot')
DefineClass._12gauge_Saltshot = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/12_gauge_bullets_saltshot",
	DisplayName = T(274776590700, --[[ModItemInventoryItemCompositeDef _12gauge_Saltshot DisplayName]] "12-gauge Saltshot"),
	DisplayNamePlural = T(589959369700, --[[ModItemInventoryItemCompositeDef _12gauge_Saltshot DisplayNamePlural]] "12-gauge Saltshot"),
	colorStyle = "AmmoTracerColor",
	Description = T(556079576029, --[[ModItemInventoryItemCompositeDef _12gauge_Saltshot Description]] "12-gauge ammo for Shotguns."),
	AdditionalHint = T(954435470101, --[[ModItemInventoryItemCompositeDef _12gauge_Saltshot AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Low damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Shorter range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Wide attack cone\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Inaccurate</color> and <color EmStyle>Slowed</color>"),
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
			mod_mul = 500,
			target_prop = "Damage",
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
		"Inaccurate",
		"Slowed",
	},
	ammo_type_icon = "UI/Icons/Items/ta_shock.png",
}

