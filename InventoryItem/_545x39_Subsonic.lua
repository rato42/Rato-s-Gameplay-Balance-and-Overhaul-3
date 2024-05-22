UndefineClass('_545x39_Subsonic')
DefineClass._545x39_Subsonic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Repairable = false,
	Icon = "Mod/cfahRED/UI/icons/ammo/545x39/545X39_bullets_basic.png",
	SubIcon = "Mod/cfahRED/UI/icons/silence4.png",
	ItemType = "",
	DisplayName = T(949943284965, --[[ModItemInventoryItemCompositeDef _545x39_Subsonic DisplayName]] "5.45x39 Subsonic Bullet"),
	DisplayNamePlural = T(264557262084, --[[ModItemInventoryItemCompositeDef _545x39_Subsonic DisplayNamePlural]] "5.45x39 Subsonic Bullets"),
	colorStyle = "AmmoMatchColor",
	Description = T(994779027609, --[[ModItemInventoryItemCompositeDef _545x39_Subsonic Description]] "5.45x39 Subsonic Ammo for Soviet Assault Rifles."),
	AdditionalHint = T(810426376068, --[[ModItemInventoryItemCompositeDef _545x39_Subsonic AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Less noisy\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128\n120> Less bullet speed, resulting in less Aim Accuracy, Range and no armor penetration\n"),
	MaxStacks = 500,
	Caliber = "5_45x39",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 20,
			mod_mul = 550,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -6,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -1,
			target_prop = "AimAccuracy",
		}),
	},
}

