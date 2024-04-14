UndefineClass('_9mm_Shock')
DefineClass._9mm_Shock = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/9mm_bullets_shock",
	DisplayName = T(986427413124, --[[ModItemInventoryItemCompositeDef _9mm_Shock DisplayName]] "9 mm Shock"),
	DisplayNamePlural = T(912073108780, --[[ModItemInventoryItemCompositeDef _9mm_Shock DisplayNamePlural]] "9 mm Shock"),
	colorStyle = "AmmoHPColor",
	Description = T(450626162434, --[[ModItemInventoryItemCompositeDef _9mm_Shock Description]] "9 mm ammo for Handguns and SMGs."),
	AdditionalHint = T(305112935079, --[[ModItemInventoryItemCompositeDef _9mm_Shock AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Reduced range\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> No armor penetration\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Greater Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Bleeding</color>"),
	Cost = 180,
	CanAppearInShop = true,
	Tier = 2,
	RestockWeight = 10,
	CategoryPair = "9mm",
	MaxStacks = 500,
	Caliber = "9mm",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 70,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = -4,
			target_prop = "WeaponRange",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 15,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Bleeding",
	},
	ammo_type_icon = "UI/Icons/Items/ta_shock.png",
}

