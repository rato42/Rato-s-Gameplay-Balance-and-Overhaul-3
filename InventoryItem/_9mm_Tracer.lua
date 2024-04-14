UndefineClass('_9mm_Tracer')
DefineClass._9mm_Tracer = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/9mm_bullets_tracer",
	DisplayName = T(453050779782, --[[ModItemInventoryItemCompositeDef _9mm_Tracer DisplayName]] "9 mm Tracer"),
	DisplayNamePlural = T(989375255266, --[[ModItemInventoryItemCompositeDef _9mm_Tracer DisplayNamePlural]] "9 mm Tracer"),
	colorStyle = "AmmoTracerColor",
	Description = T(561044538102, --[[ModItemInventoryItemCompositeDef _9mm_Tracer Description]] "9 mm ammo for Handguns and SMGs."),
	AdditionalHint = T(410993880108, --[[ModItemInventoryItemCompositeDef _9mm_Tracer AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Hit enemies are <color EmStyle>Marked</color> \n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Easier to compensate recoil in multishot attacks"),
	Cost = 120,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "9mm",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "9mm",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 15,
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

