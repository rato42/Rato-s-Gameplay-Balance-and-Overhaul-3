local isZulibModActive = true

local function reloadIsZulibModActive()
	local zulib = table.find_value(ModsLoaded, "id", "Tc3ajdY")
	isZulibModActive = zulib and not zulib.options["zz_Opt_DontChangeCalibers"] and true or false
end
OnMsg.ModsReloaded = reloadIsZulibModActive
OnMsg.ApplyModOptions = reloadIsZulibModActive

GBO_OldAmmoMapping = {
	ZULIB = {
		_79257_AP = "_7_92x57_AP",
		_79257_Basic = "_7_92x57_Basic",
		_79257_HP = "_7_92x57_HP",
		_79257_Match = "_7_92x57_Match",
		_79257_Tracer = "_7_92x57_Tracer",

		_54539_AP = "_5_45x39_AP",
		_54539_Basic = "_5_45x39_Basic",
		_54539_HP = "_5_45x39_HP",
		_54539_Match = "_5_45x39_Match",
		_54539_Tracer = "_5_45x39_Tracer",

		_76254R_AP = "_7_62x54_AP",
		_76254R_Basic = "_7_62x54_Basic",
		_76254R_HP = "_7_62x54_HP",
		_76254R_Match = "_7_62x54_Match",
		_76254R_Tracer = "_7_62x54_Tracer",

		_45ACP_Shock = "_45ACP_HP",

		_792kurz_Basic = "_7_92x33_Basic",

		_939_Basic = "_9x39_Basic",
		_939_SPP = "_9x39_Match",
		_939_AP = "_9x39_AP",

		_57x28_AP = "_5_7x28_AP",
		_57x28_HP = "_5_7x28_HP",
		_57x28_Tracer = "_5_7x28_Tracer",
		_57x28_Match = "_5_7x28_Match",

		MoW_762Tok_Basic = "_7_62x25_Basic",
		MoW_45ACP_Basic = "_45ACP_Basic",
		MoW_45ACP_HP = "_45ACP_HP",
	},
	VANILLA = {
		_79257_AP = "_762NATO_AP",
		_79257_Basic = "_762NATO_Basic",
		_79257_HP = "_762NATO_HP",
		_79257_Match = "_762NATO_Match",
		_79257_Tracer = "_762NATO_Tracer",

		_54539_AP = "_556_AP",
		_54539_Basic = "_556_Basic",
		_54539_HP = "_556_HP",
		_54539_Match = "_556_Match",
		_54539_Tracer = "_556_Tracer",

		_76254R_AP = "_762WP_AP",
		_76254R_Basic = "_762WP_Basic",
		_76254R_HP = "_762WP_HP",
		_76254R_Match = "_762WP_Match",
		_76254R_Tracer = "_762WP_Tracer",

		_44CAL_Subsonic = "_44CAL_Basic",

		_45ACP_Basic = "_9mm_Basic",
		_45ACP_AP = "_9mm_AP",
		_45ACP_HP = "_9mm_HP",
		_45ACP_Match = "_9mm_Match",
		_45ACP_Tracer = "_9mm_Tracer",
		_45ACP_Subsonic = "_9mm_Subsonic",
		_45ACP_Shock = "_9mm_Shock",

		_792kurz_Basic = "_762WP_Basic",

		_939_Basic = "_762WP_Basic",
		_939_SPP = "_762WP_Match",
		_939_AP = "_762WP_AP",

		_57x28_AP = "_9mm_AP",
		_57x28_HP = "_9mm_HP",
		_57x28_Tracer = "_9mm_Tracer",
		_57x28_Match = "_9mm_Match",

		MoW_762Tok_Basic = "_762WP_Basic",
		MoW_45ACP_Basic = "_44CAL_Basic",
		MoW_45ACP_HP = "_44CAL_HP",
	},
}

local GBO_PlaceInventoryItem = PlaceInventoryItem

function PlaceInventoryItem(item_id, instance, ...)
	local key = isZulibModActive and "ZULIB" or "VANILLA"
	if GBO_OldAmmoMapping[key][item_id] then
		print("GBO PATCH OLD AMMO", key, "from", item_id, "to", GBO_OldAmmoMapping[key][item_id])
		local obj = GBO_PlaceInventoryItem(GBO_OldAmmoMapping[key][item_id], instance, ...)
		print("GBO PATCH OLD AMMO DONE with", obj)
		return obj
	else
		return GBO_PlaceInventoryItem(item_id, instance, ...)
	end
end
