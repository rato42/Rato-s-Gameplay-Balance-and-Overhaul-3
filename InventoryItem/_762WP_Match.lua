UndefineClass('_762WP_Match')
DefineClass._762WP_Match = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_wp_bullets_match",
	DisplayName = T(411137407927, --[[ModItemInventoryItemCompositeDef _762WP_Match DisplayName]] "7.62 mm WP Match"),
	DisplayNamePlural = T(943602002258, --[[ModItemInventoryItemCompositeDef _762WP_Match DisplayNamePlural]] "7.62 mm WP Match"),
	colorStyle = "AmmoMatchColor",
	Description = T(356794160651, --[[ModItemInventoryItemCompositeDef _762WP_Match Description]] "7.62 Warsaw Pact ammo for Assault Rifles, SMGs, Machine Guns, and Rifles."),
	AdditionalHint = T(537932082234, --[[ModItemInventoryItemCompositeDef _762WP_Match AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling"),
	Cost = 240,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762WP",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762WP",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 25,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_match.png",
}

