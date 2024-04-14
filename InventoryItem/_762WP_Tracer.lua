UndefineClass('_762WP_Tracer')
DefineClass._762WP_Tracer = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/762_wp_bullets_tracer",
	DisplayName = T(987098472937, --[[ModItemInventoryItemCompositeDef _762WP_Tracer DisplayName]] "7.62 mm WP Tracer"),
	DisplayNamePlural = T(172004128409, --[[ModItemInventoryItemCompositeDef _762WP_Tracer DisplayNamePlural]] "7.62 mm WP Tracer"),
	colorStyle = "AmmoTracerColor",
	Description = T(906748958272, --[[ModItemInventoryItemCompositeDef _762WP_Tracer Description]] "7.62 Warsaw Pact ammo for Assault Rifles, SMGs, Machine Guns, and Rifles."),
	AdditionalHint = T(100122976377, --[[ModItemInventoryItemCompositeDef _762WP_Tracer AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Hit enemies are <color EmStyle>Marked</color> \n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Easier to compensate recoil in multishot attacks"),
	Cost = 180,
	CanAppearInShop = true,
	Tier = 2,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "762WP",
	ShopStackSize = 30,
	MaxStacks = 500,
	Caliber = "762WP",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 1,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 25,
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

