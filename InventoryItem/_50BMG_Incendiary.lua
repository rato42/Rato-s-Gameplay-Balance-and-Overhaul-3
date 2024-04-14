UndefineClass('_50BMG_Incendiary')
DefineClass._50BMG_Incendiary = {
	__parents = { "Ammo" },
	__generated_by_class = "ModItemInventoryItemCompositeDef",


	object_class = "Ammo",
	Icon = "UI/Icons/Items/50bmg_incendiary",
	DisplayName = T(224929411148, --[[ModItemInventoryItemCompositeDef _50BMG_Incendiary DisplayName]] ".50 Frag"),
	DisplayNamePlural = T(305699877485, --[[ModItemInventoryItemCompositeDef _50BMG_Incendiary DisplayNamePlural]] ".50 Frag"),
	colorStyle = "AmmoTracerColor",
	Description = T(619737817725, --[[ModItemInventoryItemCompositeDef _50BMG_Incendiary Description]] ".50 Ammo for Machine Guns, Snipers and Handguns."),
	AdditionalHint = T(209155820492, --[[ModItemInventoryItemCompositeDef _50BMG_Incendiary AdditionalHint]] "<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Hit enemies are <color EmStyle>Exposed</color> and lose the benefits of Cover\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Inflicts <color EmStyle>Burning</color>"),
	Cost = 850,
	CanAppearInShop = true,
	Tier = 3,
	MaxStock = 5,
	RestockWeight = 25,
	CategoryPair = "50BMG",
	ShopStackSize = 10,
	MaxStacks = 500,
	Caliber = "50BMG",
	Modifications = {
		PlaceObj('CaliberModification', {
			mod_add = 3,
			target_prop = "PenetrationClass",
		}),
		PlaceObj('CaliberModification', {
			mod_add = 41,
			target_prop = "Noise",
		}),
	},
	AppliedEffects = {
		"Exposed",
		"Burning",
	},
	ammo_type_icon = "UI/Icons/Items/ta_match.png",
}

