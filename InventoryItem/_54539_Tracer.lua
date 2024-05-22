UndefineClass('_54539_Tracer')
DefineClass._54539_Tracer = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/545tracer.png",
	DisplayName = T(429417729770, --[[ModItemInventoryItemCompositeDef _54539_Tracer DisplayName]] "5.45x39 mm Tracer"),
	DisplayNamePlural = T(332218519170, --[[ModItemInventoryItemCompositeDef _54539_Tracer DisplayNamePlural]] "5.45x39 mm Tracer"),
	colorStyle = "AmmoTracerColor",
	Description = T(951916000818, --[[ModItemInventoryItemCompositeDef _54539_Tracer Description]] "5.45x39 mm ammo for Soviet Assault Rifles, SMGs and Machine Guns."),
	AdditionalHint = T(273847629126, --[[ModItemInventoryItemCompositeDef _54539_Tracer AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Tumbling effects increase Critical Chance\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Hit enemies are <color EmStyle>Marked</color> \n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Easier to compensate recoil in multishot attacks"),
	Cost = 300,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "5_45x39",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "5_45x39",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 15,
			target_prop = "CritChance",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 22,
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

