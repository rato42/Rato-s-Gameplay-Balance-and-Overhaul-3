local function isZulibModActive()
	return not not table.find_value(ModsLoaded, "id", "Tc3ajdY")
end

function OnMsg.ModsReloaded()
	if isZulibModActive() then
		print("GBO PATCH OLD AMMO Zulib active...")

		g_Classes["_79257_AP"] = g_Classes["_7_92x57_AP"]
		g_Classes["_79257_Basic"] = g_Classes["_7_92x57_Basic"]
		g_Classes["_79257_HP"] = g_Classes["_7_92x57_HP"]
		g_Classes["_79257_Match"] = g_Classes["_7_92x57_Match"]
		g_Classes["_79257_Tracer"] = g_Classes["_7_92x57_Tracer"]

		g_Classes["_54539_AP"] = g_Classes["_5_45x39_AP"]
		g_Classes["_54539_Basic"] = g_Classes["_5_45x39_Basic"]
		g_Classes["_54539_HP"] = g_Classes["_5_45x39_HP"]
		g_Classes["_54539_Match"] = g_Classes["_5_45x39_Match"]
		g_Classes["_54539_Tracer"] = g_Classes["_5_45x39_Tracer"]

		g_Classes["_76254R_AP"] = g_Classes["_7_62x54_AP"]
		g_Classes["_76254R_Basic"] = g_Classes["_7_62x54_Basic"]
		g_Classes["_76254R_HP"] = g_Classes["_7_62x54_HP"]
		g_Classes["_76254R_Match"] = g_Classes["_7_62x54_Match"]
		g_Classes["_76254R_Tracer"] = g_Classes["_7_62x54_Tracer"]
	else
		print("GBO PATCH OLD AMMO Zulib not active...")

		g_Classes["_79257_AP"] = g_Classes["_762NATO_AP"]
		g_Classes["_79257_Basic"] = g_Classes["_762NATO_Basic"]
		g_Classes["_79257_HP"] = g_Classes["_762NATO_HP"]
		g_Classes["_79257_Match"] = g_Classes["_762NATO_Match"]
		g_Classes["_79257_Tracer"] = g_Classes["_762NATO_Tracer"]

		g_Classes["_54539_AP"] = g_Classes["_556_AP"]
		g_Classes["_54539_Basic"] = g_Classes["_556_Basic"]
		g_Classes["_54539_HP"] = g_Classes["_556_HP"]
		g_Classes["_54539_Match"] = g_Classes["_556_Match"]
		g_Classes["_54539_Tracer"] = g_Classes["_556_Tracer"]

		g_Classes["_76254R_AP"] = g_Classes["_762WP_AP"]
		g_Classes["_76254R_Basic"] = g_Classes["_762WP_Basic"]
		g_Classes["_76254R_HP"] = g_Classes["_762WP_HP"]
		g_Classes["_76254R_Match"] = g_Classes["_762WP_Match"]
		g_Classes["_76254R_Tracer"] = g_Classes["_762WP_Tracer"]

		g_Classes["_44CAL_Subsonic"] = g_Classes["_44CAL_Basic"]
	end
	print("GBO PATCH OLD AMMO DONE")
end
