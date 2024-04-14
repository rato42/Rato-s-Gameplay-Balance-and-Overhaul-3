UndefineClass('_12gauge_Flechette')
DefineClass._12gauge_Flechette = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/12_gauge_bullets_flechette",
	DisplayName = T(503345694171, --[[ModItemInventoryItemCompositeDef _12gauge_Flechette DisplayName]] "12-gauge Flechette"),
	DisplayNamePlural = T(731954084266, --[[ModItemInventoryItemCompositeDef _12gauge_Flechette DisplayNamePlural]] "12-gauge Flechette"),
	colorStyle = "AmmoMatchColor",
	Description = T(957883401632, --[[ModItemInventoryItemCompositeDef _12gauge_Flechette Description]] "12-gauge ammo for Shotguns."),
	AdditionalHint = T(158068719459, --[[ModItemInventoryItemCompositeDef _12gauge_Flechette AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Longer range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Less damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Narrow attack cone\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>"),
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
			mod_mul = 800,
			target_prop = "BuckshotConeAngle",
		}),
		PlaceObj('CaliberModification', {
			mod_mul = 750,
			target_prop = "Damage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 34,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

