UndefineClass('_762WP_HP')
DefineClass._762WP_HP = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_wp_bullets_hollow_point",
	DisplayName = T(112011058892, --[[ModItemInventoryItemCompositeDef _762WP_HP DisplayName]] "7.62 mm WP Hollow Point"),
	DisplayNamePlural = T(131735899365, --[[ModItemInventoryItemCompositeDef _762WP_HP DisplayNamePlural]] "7.62 mm WP Hollow Point"),
	colorStyle = "AmmoHPColor",
	Description = T(615985475377, --[[ModItemInventoryItemCompositeDef _762WP_HP Description]] "7.62 Warsaw Pact ammo for Assault Rifles, SMGs, Machine Guns, and Snipers."),
	AdditionalHint = T(161591948549, --[[ModItemInventoryItemCompositeDef _762WP_HP AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> High Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color> "),
	Cost = 180,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762WP",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762WP",
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
			mod_add = 25,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_hp.png",
}

