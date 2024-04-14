UndefineClass('_556_Tracer')
DefineClass._556_Tracer = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/556_nato_bullets_tracer",
	DisplayName = T(243892977981, --[[ModItemInventoryItemCompositeDef _556_Tracer DisplayName]] "5.56 mm Tracer"),
	DisplayNamePlural = T(583891597385, --[[ModItemInventoryItemCompositeDef _556_Tracer DisplayNamePlural]] "5.56 mm Tracer"),
	colorStyle = "AmmoTracerColor",
	Description = T(598092596341, --[[ModItemInventoryItemCompositeDef _556_Tracer Description]] "5.56 Ammo for Assault Rifles, SMGs, and Machine Guns."),
	AdditionalHint = T(369523282563, --[[ModItemInventoryItemCompositeDef _556_Tracer AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Fragmentation effects increase Critical Damage\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Hit enemies are <color EmStyle>Marked</color> \n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Easier to compensate recoil in multishot attacks"),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "556",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "556",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 23,
			target_prop = "Noise",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 30,
			target_prop = "CritDamage",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "tracer",
		}),
	},
	AppliedEffects = {
		"Marked",
		"Revealed_R",
	},
	ammo_type_icon = "UI/Icons/Items/ta_tracer.png",
}

