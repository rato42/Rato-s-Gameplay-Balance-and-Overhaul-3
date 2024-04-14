UndefineClass('_762NATO_Tracer')
DefineClass._762NATO_Tracer = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_nato_bullets_tracer",
	DisplayName = T(924848597374, --[[ModItemInventoryItemCompositeDef _762NATO_Tracer DisplayName]] "7.62 mm NATO Tracer"),
	DisplayNamePlural = T(917283352996, --[[ModItemInventoryItemCompositeDef _762NATO_Tracer DisplayNamePlural]] "7.62 mm NATO Tracer"),
	colorStyle = "AmmoTracerColor",
	Description = T(600166708044, --[[ModItemInventoryItemCompositeDef _762NATO_Tracer Description]] "7.62 NATO ammo for Assault Rifles, Rifles, and Machine Guns."),
	AdditionalHint = T(907879425916, --[[ModItemInventoryItemCompositeDef _762NATO_Tracer AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Hit enemies are <color EmStyle>Marked</color> \n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Easier to compensate recoil in multishot attacks"),
	Cost = 340,
	CanAppearInShop = true,
	Tier = 2,
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
			mod_add = 30,
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

