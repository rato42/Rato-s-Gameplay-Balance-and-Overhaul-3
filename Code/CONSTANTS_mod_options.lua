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

-- local function option_change_string_to_num_slider()
--     for _, opt in ipairs(CurrentModOptions.properties or empty_table) do
--         local opt_id = opt.id or ''
--         local current_option = CurrentModOptions[opt_id]
--         if opt.editor == "number" and CurrentModOptions[opt_id] and type(CurrentModOptions[opt_id]) ~=
--             "number" then
--             CurrentModOptions[opt_id] = type(CurrentModOptions[opt_id]) == "string" and
--                                             extractNumberWithSignFromString(
--                                                 CurrentModOptions[opt_id])
--             if not CurrentModOptions[opt_id] or CurrentModOptions[opt_id] ~= "number" then
--                 CurrentModOptions[opt_id] = opt.default
--             end
--         end
--     end
-- end

-- function OnMsg.DataLoaded()
--     option_change_string_to_num_slider()
-- end

function OnMsg.ApplyModOptions(id)

    if id ~= CurrentModId then
        -- print("id", id)
        return
    end

    print("RAT MOD - options setting up")

    -- option_change_string_to_num_slider()

    const.Combat.UnawareSightRange = extractNumberWithSignFromString(
                                         CurrentModOptions['UnawareSight']) or 18
    const.Combat.AwareSightRange =
        extractNumberWithSignFromString(CurrentModOptions['AwareSight']) or 36
    const.EnvEffects.DarknessDetectionRate = extractNumberWithSignFromString(
                                                 CurrentModOptions['NightDetect']) or -40
    const.EnvEffects.DarknessSightMod = extractNumberWithSignFromString(
                                            CurrentModOptions['NightSight']) or -40

    -- custom
    const.Combat.R_BurstFirePenalty = extractNumberWithSignFromString(
                                          CurrentModOptions['penalty_burstfire']) or -30
    const.Combat.R_AutoFirePenalty = extractNumberWithSignFromString(
                                         CurrentModOptions['penalty_autofire']) or -54
    const.Combat.R_LongBurstPenalty = extractNumberWithSignFromString(
                                          CurrentModOptions['penalty_longburst']) or -35
    const.Combat.R_HeldLongBurstPenalty = extractNumberWithSignFromString(
                                              CurrentModOptions['penalty_longburst_held']) or -56
    const.Combat.R_HeldCumbersomePenalty = extractNumberWithSignFromString(
                                               CurrentModOptions['penalty_held_cumbersome']) or -15
    const.Combat.R_AimMul = extractNumberWithSignFromString(CurrentModOptions['aim_multiplier']) or
                                100
    const.Combat.R_OWMul = extractNumberWithSignFromString(CurrentModOptions['ow_multiplier']) or
                               100
    const.Combat.R_MarksMul =
        extractNumberWithSignFromString(CurrentModOptions['marks_multiplier']) or 100
    const.Combat.R_MeleeMul =
        extractNumberWithSignFromString(CurrentModOptions['melee_multiplier']) or 100
    const.Combat.R_AI_critmul = extractNumberWithSignFromString(
                                    CurrentModOptions['ai_crit_multiplier']) or 100

    const.Combat.R_Recoil = extractNumberWithSignFromString(CurrentModOptions['recoil_setting']) or
                                100
    const.Combat.R_RecoilP = extractNumberWithSignFromString(
                                 CurrentModOptions['recoil_persistent_setting']) or 100

    const.Combat.R_TargetedMul = extractNumberWithSignFromString(
                                     CurrentModOptions['targeted_multiplier']) or 100

    const.Combat.R_AIReduc =
        extractNumberWithSignFromString(CurrentModOptions['ai_penal_setting']) or 100

    const.Combat.R_ExtraAP = extractNumberWithSignFromString(CurrentModOptions['Extra_start_ap']) or
                                 1

    -- local noise_setting = extractNumberWithSignFromString(CurrentModOptions['noise_setting_num']) or
    -- 100

    -- rat_noise_settings(noise_setting)

end

function OnMsg.ApplyModOptions(mod_id)

    if mod_id == "Msdfsds3" or mod_id == "SmartOverwatch" then
        print("Smart Overwatch detected, overwriting MG setup get ap for RatMod")
        rat_MGSetup_getap()
        -- add_recalcUI()
    end
end

function OnMsg.DataLoaded()
    if CurrentModOptions["noise_setting_num"] == "Vanilla" then
        rat_noise_settings("Vanilla")
    end
end
