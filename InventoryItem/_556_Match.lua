UndefineClass('_556_Match')
DefineClass._556_Match = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/556_nato_bullets_match",
	DisplayName = T(623218068133, --[[ModItemInventoryItemCompositeDef _556_Match DisplayName]] "5.56 mm Match"),
	DisplayNamePlural = T(440435018444, --[[ModItemInventoryItemCompositeDef _556_Match DisplayNamePlural]] "5.56 mm Match"),
	colorStyle = "AmmoMatchColor",
	Description = T(102739196864, --[[ModItemInventoryItemCompositeDef _556_Match Description]] "5.56 Ammo for Assault Rifles, SMGs, and Machine Guns."),
	AdditionalHint = T(118437479641, --[[ModItemInventoryItemCompositeDef _556_Match AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Fragmentation effects increase Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling"),
	Cost = 400,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "556",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "556",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 30,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 23,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_match.png",
}

