UndefineClass('_762NATO_Match')
DefineClass._762NATO_Match = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_nato_bullets_match",
	DisplayName = T(387917883018, --[[ModItemInventoryItemCompositeDef _762NATO_Match DisplayName]] "7.62 mm NATO Match"),
	DisplayNamePlural = T(988731545740, --[[ModItemInventoryItemCompositeDef _762NATO_Match DisplayNamePlural]] "7.62 mm NATO Match"),
	colorStyle = "AmmoMatchColor",
	Description = T(742555181078, --[[ModItemInventoryItemCompositeDef _762NATO_Match Description]] "7.62 NATO ammo for Assault Rifles, Rifles, and Machine Guns."),
	AdditionalHint = T(972166420301, --[[ModItemInventoryItemCompositeDef _762NATO_Match AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased bonus from Aiming\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increased Critical Chance scaling"),
	Cost = 450,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762NATO",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762NATO",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
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
			mod_add = 30,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "AimAccuracy",
		}),
	},
	ammo_type_icon = "UI/Icons/Items/ta_match.png",
}

