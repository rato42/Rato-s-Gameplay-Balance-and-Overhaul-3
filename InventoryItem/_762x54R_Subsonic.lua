UndefineClass('_762x54R_Subsonic')
DefineClass._762x54R_Subsonic = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Repairable = false,
	Icon = "Mod/cfahRED//icons/ammo/762X54R_bullets_basic.png",
	SubIcon = "Mod/cfahRED/UI/icons/silence4.png",
	ItemType = "",
	DisplayName = T(916668422487, --[[ModItemInventoryItemCompositeDef _762x54R_Subsonic DisplayName]] "7.62x54R Subsonic Bullet"),
	DisplayNamePlural = T(704956334213, --[[ModItemInventoryItemCompositeDef _762x54R_Subsonic DisplayNamePlural]] "7.62x54R Subsonic Bullets"),
	colorStyle = "HUDHeaderGrey",
	Description = T(850002009073, --[[ModItemInventoryItemCompositeDef _762x54R_Subsonic Description]] "7.62x54R Warsaw Pact Subsonic ammo for Rifles and Sniper Rifles."),
	AdditionalHint = T(180599979228, --[[ModItemInventoryItemCompositeDef _762x54R_Subsonic AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Less noisy\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128\n120> Less bullet speed, resulting in less Aim Accuracy, Range and no armor penetration"),
	MaxStacks = 500,
	Caliber = "762x54R",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 20,
			mod_mul = 700,
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
		PlaceObj('CaliberModification', {
			mod_add = -2,
			target_prop = "PenetrationClass",
		}),
	},
}

