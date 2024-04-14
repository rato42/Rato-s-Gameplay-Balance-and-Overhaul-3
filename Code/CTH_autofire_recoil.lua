
function autofire_range()

    -- local max_dist = 14
	-- local base_penalty = 0
	-- local burst_max_penalty = const.Combat.R_BurstFirePenalty---22---60
	-- local auto_max_penalty = const.Combat.R_AutoFirePenalty---40---90---80
	-- local mg_burst_max_penalty = const.Combat.R_LongBurstPenalty ---22---30
	-- local mg_burst_max_held_penalty = const.Combat.R_HeldLongBurstPenalty ---38---45
	-- local mg_burst_cumbersome_penalty = const.Combat.R_HeldCumbersomePenalty ---10


    -- for _, param in ipairs(Presets.ChanceToHitModifier.Default["Autofire"].Parameters) do
        -- if param.Name == 'max_dist' then
            -- param.Value = max_dist
        -- end
		-- if param.Name == 'base_penalty' then
            -- param.Value = base_penalty
        -- end
	-- if param.Name == 'burst_max_penalty' then
            -- param.Value = burst_max_penalty
        -- end
	-- if param.Name == 'auto_max_penalty' then
            -- param.Value = auto_max_penalty
        -- end
	-- if param.Name == 'mg_burst_max_penalty' then
            -- param.Value = mg_burst_max_penalty
        -- end
	-- if param.Name == 'mg_burst_max_held_penalty' then
            -- param.Value = mg_burst_max_held_penalty
        -- end
		-- if param.Name == 'mg_burst_cumbersome_penalty' then
		-- param.Value = mg_burst_cumbersome_penalty
		-- end
    -- end
	
    -- g_PresetParamCache[Presets.ChanceToHitModifier.Default["Autofire"]]['max_dist'] = max_dist
    -- g_PresetParamCache[Presets.ChanceToHitModifier.Default["Autofire"]]['base_penalty'] = base_penalty
    -- g_PresetParamCache[Presets.ChanceToHitModifier.Default["Autofire"]]['burst_max_penalty'] = burst_max_penalty
    -- g_PresetParamCache[Presets.ChanceToHitModifier.Default["Autofire"]]['auto_max_penalty'] = auto_max_penalty
    -- g_PresetParamCache[Presets.ChanceToHitModifier.Default["Autofire"]]['mg_burst_max_penalty'] = mg_burst_max_penalty
    -- g_PresetParamCache[Presets.ChanceToHitModifier.Default["Autofire"]]['mg_burst_max_held_penalty'] = mg_burst_max_held_penalty
    -- g_PresetParamCache[Presets.ChanceToHitModifier.Default["Autofire"]]['mg_burst_cumbersome_penalty'] = mg_burst_cumbersome_penalty
	
	Presets.ChanceToHitModifier.Default["Autofire"].CalcValue = function (self, attacker, target, body_part_def, action, weapon1, weapon2, lof, aim, opportunity_attack, attacker_pos, target_pos)	

		return false, 0


			
			
		
	end
end



