function rat_category_description()
	PlaceObj('BobbyRayShopSubCategory', {
	Category = "Ammo",
	DisplayName = T(544739334726, "5.45x39"),
	SortKey = 71,
	group = "Ammo",
	id = "545x39",
	})

	PlaceObj('BobbyRayShopSubCategory', {
	Category = "Ammo",
	DisplayName = T(524237349972, "7.62x54R"),
	SortKey = 72,
	group = "Ammo",
	id = "762x54R",
	})

	PlaceObj('BobbyRayShopSubCategory', {
	Category = "Ammo",
	DisplayName = T(521372252196, "7.92x57"),
	SortKey = 73,
	group = "Ammo",
	id = "792x57",
	})
	


	PlaceObj('BobbyRayShopSubCategory', {
		Category = "Weapons",
		DisplayName = T(191658189194, "Rifles"),
		SortKey = 40,
		group = "Weapons",
		id = "AssaultRifles",
	})


	PlaceObj('BobbyRayShopSubCategory', {
		Category = "Weapons",
		DisplayName = T(676827653129, "Precision Rifles"),
		SortKey = 40,
		group = "Weapons",
		id = "Rifles",
	})

	PlaceObj('WeaponType', {
		Description = T(713713297945, "Rifles offer high versatility without excelling at any specific thing. They offer decent stopping power, range, and armor penetration, while normally having semi-auto or automatic cycling. They are highly modifiable."),
		Icon = "UI/Icons/Weapons/class_assault rifle",
		Name = T(412557875478, "Rifles"),
		SortKey = 5,
		id = "AssaultRifle",
	})

	PlaceObj('WeaponType', {
		Description = T(889678431939, "SMGs are very accurate at point-blank range and can fire a hail of bullets. They are medium ranged and are not effective against Armor.\n\n<em>Recovers half Free Move AP after firing.</em>\n\nSpecial attack: Run & Gun"),
		Icon = "UI/Icons/Weapons/class_smg",
		Name = T(326265264296, "Submachine Guns"),
		SortKey = 6,
		id = "SMG",
	})


	PlaceObj('WeaponType', {
		Description = T(264319486518, "Handguns, like pistols and revolvers, are very accurate at point-blank range. However, they are short ranged and are not effective against Armor.\n\n<em>Attacks with Handguns have their aim accuracy reduced by half.\n\n<em>Recovers half Free Move AP after firing.</em>\n\nSpecial attack: Mobile Shot"),
		Icon = "UI/Icons/Weapons/class_handgun",
		Name = T(898222461982, "Handguns"),
		SortKey = 1,
		id = "Handgun",
	})

	PlaceObj('WeaponType', {
		Description = T(597514819661, "Precision Rifles have good penetration against Armor and are very accurate when targeting Body Parts. They offer long range but very low rate of fire.\n\n<em>Single Shots made with Precision Rifles have better scaling in critical chance per aim level.<em>\n\nSpecial attack: Pin Down"),
		Icon = "UI/Icons/Weapons/class_sniper_rifle",
		Name = T(698872744613, "Precision Rifles"),
		SortKey = 6,
		id = "Sniper",
	})
end
-- PlaceObj('BobbyRayShopSubCategory', {
-- Category = "Ammo",
-- DisplayName = T(569966211529, "7.92x33 Kurz"),
-- SortKey = 74,
-- group = "Ammo",
-- id = "792x33",
-- })


-- PlaceObj('BobbyRayShopSubCategory', {
-- Category = "Ammo",
-- DisplayName = T(425569596185, "5.7x28"),
-- SortKey = 75,
-- group = "Ammo",
-- id = "57x28",
-- })


---------------------------------------------------------------------------------------------------------

local t_id_table = {
[544739334726] = "5.45x39",
[524237349972] = "7.62x54R",
[521372252196] = "7.92x57",
[191658189194] = "Rifles",
[676827653129] = "Precision Rifles",
[713713297945] = "Rifles offer high versatility without excelling at any specific thing. They offer decent stopping power, range, and armor penetration, while normally having semi-auto or automatic cycling. They are highly modifiable.",
[412557875478] = "Rifles",
[889678431939] = "SMGs are very accurate at point-blank range and can fire a hail of bullets. They are medium ranged and are not effective against Armor.\n\n<em>Recovers half Free Move AP after firing.</em>\n\nSpecial attack: Run & Gun",
[326265264296] = "Submachine Guns",
[264319486518] = "Handguns, like pistols and revolvers, are very accurate at point-blank range. However, they are short ranged and are not effective against Armor.\n\n<em>Attacks with Handguns have their aim accuracy reduced by half.\n\n<em>Recovers half Free Move AP after firing.</em>\n\nSpecial attack: Mobile Shot",
[898222461982] = "Handguns",
[597514819661] = "Precision Rifles have good penetration against Armor and are very accurate when targeting Body Parts. They offer long range but very low rate of fire.\n\n<em>Single Shots made with Precision Rifles have better scaling in critical chance per aim level.<em>\n\nSpecial attack: Pin Down",
[698872744613] = "Precision Rifles",
[569966211529] = "7.92x33 Kurz",
[425569596185] = "5.7x28",
}

ratG_T_table['BOBBYRAY_category_pairs.lua'] = t_id_table