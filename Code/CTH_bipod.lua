function bipod_standing()
	local penalty = -5
	local penaltym82 = -25

	Presets.ChanceToHitModifier.Default["Bipod"].CalcValue = function (self, attacker, target, body_part_def, action, weapon1, weapon2, lof, aim, opportunity_attack, attacker_pos, target_pos)
		if not weapon1 then
			return false, 0
		end
		
		if attacker.stance ~= "Prone" then
			local _, compDef = GetComponentEffectValue(weapon1, "bipod_penalty", "bonus_cth")
			if compDef then
				local value = penalty
				if value == 0 then
					return false,0
				end
				return not not value, value
			end
		end

		local value = GetComponentEffectValue(weapon1, "AccuracyBonusProne", "bonus_cth")

		return not not value, value
	end
end


