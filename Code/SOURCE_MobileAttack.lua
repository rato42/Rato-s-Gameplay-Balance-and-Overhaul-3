--[[function GetMobileShotResults(action, unit, args)
	local weapon = action:GetAttackWeapons(unit)

	args = table.copy(args)
	args.step_pos = args.goto_pos -- needed in PrepareAttackArgs
	local shot_positions, shot_targets, shot_ch, shot_canceling_reason = CalcMobileShotAttacks(unit, action, args.goto_pos)
	local attacks = {}
	local attack_args

	-- resolve attack action
	local attack_id, atk_action	
	if args.attack_id and args.attack_id ~= action.id then
		attack_id = args.attack_id
		atk_action = CombatActions[attack_id] or CombatActions.SingleShot
	else
		attack_id = "SingleShot"
		atk_action = CombatActions.SingleShot
	end
	local canceling_reason

	for i, pos in ipairs(shot_positions) do
		local target = shot_targets[i]
		local results, attack_args
		if pos and IsValidTarget(target) and not shot_canceling_reason[i] then
			
				-- In prediction mode we need to presim the attacks (and merge the results later) for UI / damage prediction.
				-- When simulating the actual attack this extra work isn't needed as Unit:RunAndGun needs to recalculate it anyway after movement.
				-- Thus, we only pack the relevant data - the position and target. The target can also change, but we have it anyway and we prefer
				-- to stick to it so the gameplay effects better reflect what we show the user in prediction.
			
			if args.prediction then
				args.target = target
				args.step_pos = point(point_unpack(pos))
				args.attack_roll = args.attack_rolls and args.attack_rolls[i]
				args.crit_roll = args.crit_rolls and args.crit_rolls[i]
				args.stealth_kill_roll = args.stealth_kill_rolls and args.stealth_kill_rolls[i]
				args.used_action_id = action.id -- so that cth is calculated for the master/parent action instead of the actual attack action
				args.stance = "Standing"
				args.can_use_covers = false
				local results, attack_args = atk_action:GetActionResults(unit, args)
				attacks[i] = results
				attacks[i].mobile_attack_id = attack_id
				attacks[i].mobile_attack_pos = pos
				attacks[i].mobile_attack_target = target
				attacks[i].attack_args = attack_args
			else
				attacks[i] = {
					mobile_attack_id = attack_id,
					mobile_attack_pos = pos,
					mobile_attack_target = target,
				}
			end
		else
			attacks[i] = {}
		end
	end

	local results
	if args.prediction then
		results = MergeAttacks(attacks)
		results.shot_canceling_reason = shot_canceling_reason and shot_canceling_reason[#shot_canceling_reason]
	else
		results = { attacks = attacks }
	end

	return results, attack_args
end]]