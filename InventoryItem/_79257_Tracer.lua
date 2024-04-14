UndefineClass('_79257_Tracer')
DefineClass._79257_Tracer = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/mousertracer.png",
	DisplayName = T(473901746794, --[[ModItemInventoryItemCompositeDef _79257_Tracer DisplayName]] "7.92x57 mm Tracer"),
	DisplayNamePlural = T(387227692992, --[[ModItemInventoryItemCompositeDef _79257_Tracer DisplayNamePlural]] "7.92x57 mm Tracer"),
	colorStyle = "AmmoTracerColor",
	Description = T(893624037932, --[[ModItemInventoryItemCompositeDef _79257_Tracer Description]] "7.92x57 mm ammo for Rifles and Machine Guns. Also known as 8mm Mauser."),
	AdditionalHint = T(472806386061, --[[ModItemInventoryItemCompositeDef _79257_Tracer AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Hit enemies are <color EmStyle>Marked</color> \n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Easier to compensate recoil in multishot attacks"),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "792x57",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "792x57",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 31,
			target_prop = "Noise",
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

