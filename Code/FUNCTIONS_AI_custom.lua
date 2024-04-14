function cRound(num)
	local numf
  local sign = 1
  if num < 0 then
    sign = -1
    num = -num
  end

  local integerNum = num + 0.5
  integerNum = integerNum - integerNum % 1

	numf = sign * integerNum

	numf = tostring(numf)
	numf = string.format("%.0f", numf)
	numf = tonumber(numf)
	return numf
end

function cRoundFlt(value, step)
    local step = step or 0.5
    local remainder = value % step
    if remainder < step / 2 then
        return value - remainder
    else
        return value + (step - remainder)
    end
end

function cRoundDown(num)
  local numf = num
  --local sign = 1

  --if num < 0 then
    -- sign = -1
    -- num = -num
  -- end

  -- local integerNum = num + 0.5
  -- print("num", integerNum)
  -- print("num int", integerNum % 1)
  -- integerNum = integerNum - integerNum % 1

  -- numf = sign * integerNum

  numf = tostring(numf)
  numf = string.match(numf, "([%-%d]+)")
  numf = tonumber(numf)

  return numf
end

function OnMsg.UnitEnterCombat(unit)
	local side = unit and unit.team and unit.team.side or ''
	
	if not (side == 'player1' or side == 'player2') and not HasPerk(unit, "Spiritual") then
		--print("ai enter combat")
		unit:AddStatusEffect("Spiritual") 
		unit.spiritual_added = 1
		--print("spiritual")
	end
	
	if (side == 'player1' or side == 'player2') and HasPerk(unit, "Spiritual") then
		if unit.spiritual and unit.spiritual_added == 1 then
			unit:RemoveStatusEffect("Spiritual")
			unit.spiritual_added = 0
			--print("Spiritual removed")
		end
	end
end

function R_IsAI(unit)

	local side = unit and unit.team and unit.team.side or ''
	if (side == "player1" or side == "player2") then
		return false
	end
	return true
end


function AIpenal_reduc(attacker,value, cth_id, persistant_recoil)
	--print("penal function start",value)
	
	local level = attacker:GetLevel()
	
	if attacker.Affiliation == "Adonis" then
		level = level + 2
	elseif attacker.Affiliation == "Army" then
		level = level + 1
	end
	
	local reduction = 1
	
	if cth_id == "Recoil" and not persistant_recoil then
		reduction = 1.00-((0.01 + (0.01 * level)) * (const.Combat.R_AIReduc/100.00) or 1.00)
	else
		reduction = 1.00-((0.01 + (0.03 * level)) * (const.Combat.R_AIReduc/100.00) or 1.00)
	end
	
	--print(reduction, cth_id or "nil")
	
	-------cant round because sometimes the value enter as a float sometimes as base 100
	local final_value = (value * reduction) 
	
	
	
	--print("penal function end", final_value)
	return final_value
end




function AIStanceAdj(self, results, attack_args, action)
	local attacker = self
	

	local side = attacker and attacker.team and attacker.team.side or ''
	
	if (side == 'player1' or side == 'player2') then
		return 0
	end
	
	
	local ap = attacker:GetUIActionPoints()	
	local weapon = attack_args.weapon
	local aim = attack_args.aim
	local args = attack_args
	
	local cth = results.chance_to_hit
	

	local aimCost = 1
	if GameState.RainHeavy then
		aimCost = MulDivRound(aimCost, 100 + const.EnvEffects.RainAimingMultiplier, 100)
	end
	local stance_cost = (weapon.APStance + aimCost) * const.Scale.AP
	
	--print(stance_cost)

	-- print("unit ap", ap)
	
	-- print("stance_cost", stance_cost)
	
	-- print("first cth",cth)

	-- print("first aim", aim)
	if action.id == "AutoFire" then
		return 0
	end
	if action.id == "RunAndGun" then
		return 0
	end


	if not IsKindOf(weapon, "Firearm") then
		return 0
	end


	if HasPerk(attacker, "shooting_stance") then
		return 0
	end

	if aim and aim > 0 then
		return 0
	end



	if ap < stance_cost then
		return 0
	end

	local aim_adj = 0
	

	
	if cth < 50 then
		aim_adj = 1
		attacker.divida_stance_ap = stance_cost
	end
	
	
	
	return aim_adj
end


-- function CustomAIStanceAP(ap_stance, unit, target, weapon, aim, action)

	-- local max_attacks = unit.MaxAttacks 
	-- local ap_extra
	-- if max_attacks then
		-- ap_extra = ap_stance/max_attacks +1
	-- else
		-- ap_extra = ap_stance/3 
	-- end
	
	-- if ap_extra < 0 * const.Scale.AP  then
		-- ap_extra = 0 * const.Scale.AP
	-- end
	
	-- return ap_extra
-- end
	
