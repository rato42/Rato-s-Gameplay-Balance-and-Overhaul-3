UndefineClass('_76254R_Tracer')
DefineClass._76254R_Tracer = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "Mod/cfahRED/Images/bearTracer.png",
	DisplayName = T(569379365760, --[[ModItemInventoryItemCompositeDef _76254R_Tracer DisplayName]] "7.62x54 mmR Tracer"),
	DisplayNamePlural = T(142781389687, --[[ModItemInventoryItemCompositeDef _76254R_Tracer DisplayNamePlural]] "7.62x54 mmR Tracer"),
	colorStyle = "AmmoTracerColor",
	Description = T(832089570121, --[[ModItemInventoryItemCompositeDef _76254R_Tracer Description]] "7.62x54 mmR ammo for Soviet Snipers."),
	AdditionalHint = T(670108615260, --[[ModItemInventoryItemCompositeDef _76254R_Tracer AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Hit enemies are <color EmStyle>Marked</color> \n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Easier to compensate recoil in multishot attacks"),
	Cost = 360,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762x54R",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762x54R",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 32,
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

