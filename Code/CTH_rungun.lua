function runandgun_cth()	
	Presets.ChanceToHitModifier.Default["RunAndGun"].CalcValue = function (self, attacker, target, body_part_def, action, weapon1, weapon2, lof, aim, opportunity_attack, attacker_pos, target_pos)	

		
		if action.id ~= "RunAndGun" and action.id ~= "RecklessAssault" then
			return false, 0
		end
		if not attacker or not target then 
		
			return false, 0
		end
		local metaText = {}
		
	
		local pb_dist = const.Weapons.PointBlankRange * const.SlabSizeX
		local dist = attacker_pos:Dist(target_pos)
		
		
		local flat_penalty = -40
		
		flat_penalty = (MulDivRound(dist, flat_penalty, 14 * const.SlabSizeX))
		
		if flat_penalty > -10 then
			flat_penalty = -10
		elseif flat_penalty < -40 then
			flat_penalty = -40
		end
		

				

		
		-- if dist <= pb_dist then
			-- flat_penalty = MulDivRound(flat_penalty, 90,100)
		-- end
		
		
		local side = attacker and attacker.team and attacker.team.side or ''
		
		if not (side == 'player1' or side == 'player2') then
			flat_penalty = AIpenal_reduc(attacker, flat_penalty, "RunAndGun")
		end
		
		if flat_penalty == 0 then
			return false, 0
		end
		
		return true, flat_penalty, false
	end
end

