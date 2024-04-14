function OnMsg.ApplyModOptions(id)

	if id ~= CurrentModId then
		--print("id", id)
		return 
	end
	
	
	local function extractNumberWithSignFromString(str)
		if not str then	
			return false
		end
		local num = tonumber(string.match(str, "[+-]?%d+"))
		if num then
			return num
		else
			return false  
		end
	end
	
	print("rato's mod options setting up")
	const.Combat.UnawareSightRange = extractNumberWithSignFromString(CurrentModOptions['UnawareSight']) or 18
	const.Combat.AwareSightRange = extractNumberWithSignFromString(CurrentModOptions['AwareSight']) or 36
	const.EnvEffects.DarknessDetectionRate = extractNumberWithSignFromString(CurrentModOptions['NightDetect']) or -40
	const.EnvEffects.DarknessSightMod =  extractNumberWithSignFromString(CurrentModOptions['NightSight']) or -40
	
	--custom
	const.Combat.R_BurstFirePenalty = extractNumberWithSignFromString(CurrentModOptions['penalty_burstfire']) or -30
	const.Combat.R_AutoFirePenalty = extractNumberWithSignFromString(CurrentModOptions['penalty_autofire']) or -54
	const.Combat.R_LongBurstPenalty = extractNumberWithSignFromString(CurrentModOptions['penalty_longburst']) or -35
	const.Combat.R_HeldLongBurstPenalty = extractNumberWithSignFromString(CurrentModOptions['penalty_longburst_held']) or -56
	const.Combat.R_HeldCumbersomePenalty = extractNumberWithSignFromString(CurrentModOptions['penalty_held_cumbersome']) or -15
	const.Combat.R_HipFirePenalty = extractNumberWithSignFromString(CurrentModOptions['penalty_hipfire']) or -40
	const.Combat.R_SnapshotPenalty = extractNumberWithSignFromString(CurrentModOptions['penalty_snapshot']) or -30
	const.Combat.R_AimMul = extractNumberWithSignFromString(CurrentModOptions['aim_multiplier']) or 100
	const.Combat.R_OWMul = extractNumberWithSignFromString(CurrentModOptions['ow_multiplier']) or 100
	const.Combat.R_MarksMul = extractNumberWithSignFromString(CurrentModOptions['marks_multiplier']) or 100
	const.Combat.R_MeleeMul = extractNumberWithSignFromString(CurrentModOptions['melee_multiplier']) or 100
	const.Combat.R_AI_critmul = extractNumberWithSignFromString(CurrentModOptions['ai_crit_multiplier']) or 100
	
	const.Combat.R_MinAimScaling = extractNumberWithSignFromString(CurrentModOptions['min_aim_scaling']) or 10
	const.Combat.R_MaxAimScaling = extractNumberWithSignFromString(CurrentModOptions['max_aim_scaling']) or 100
	
	const.Combat.R_MinTargetedScaling = extractNumberWithSignFromString(CurrentModOptions['min_targeted_scaling']) or 10
	const.Combat.R_MaxTargetedScaling = extractNumberWithSignFromString(CurrentModOptions['max_targeted_scaling']) or 100
	
	const.Combat.R_Recoil = extractNumberWithSignFromString(CurrentModOptions['recoil_setting']) or 100
	const.Combat.R_RecoilP = extractNumberWithSignFromString(CurrentModOptions['recoil_persistent_setting']) or 100
	
	const.Combat.R_TargetedMul = extractNumberWithSignFromString(CurrentModOptions['targeted_multiplier']) or 100
	
	const.Combat.R_AIReduc = extractNumberWithSignFromString(CurrentModOptions['ai_penal_setting']) or 100
	
	const.Combat.R_ExtraAP = extractNumberWithSignFromString(CurrentModOptions['Extra_start_ap']) or 1
	
	if CurrentModOptions["r_round_mul"] == true then
		const.Combat.R_Round_Mul = true
	elseif CurrentModOptions["r_round_mul"] == false then
		const.Combat.R_Round_Mul = false
	else
		const.Combat.R_Round_Mul = true
	end
	--print(const.Combat.R_SnapshotPenalty)
	
	
	local noise_setting = extractNumberWithSignFromString(CurrentModOptions['noise_setting']) or 100

	rat_noise_settings(noise_setting)
	
	
	autofire_range()
	--print(const.Combat.UnawareSightRange)
end

function OnMsg.ApplyModOptions(mod_id)
	
	if mod_id == "Msdfsds3" then
		print("Smart Overwatch detected, overwriting MG setup get ap for RatMod")
		rat_MGSetup_getap()
		--add_recalcUI()
	end
end

function OnMsg.DataLoaded()
	if CurrentModOptions["noise_setting"] == "Vanilla" then
		rat_noise_settings("Vanilla")
	end
end