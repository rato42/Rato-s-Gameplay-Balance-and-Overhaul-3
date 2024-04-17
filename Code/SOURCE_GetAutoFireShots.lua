function FirearmBase:GetAutofireShots(action)
  if type(action) == "string" then
    action = CombatActions[action]
  end
  local shots = action:ResolveValue("num_shots") or 1
  --------------------------------

  if action.id == "BurstFire" or action.id == "RunAndGun" or action.id == "RecklessAssault" then
	shots = self.burst_shots or 3
  elseif action.id == "AutoFire" then
	shots = self.auto_shots or 10
  elseif action.id == "MGBurstFire" or action.id == "GrizzlyPerk" then
	shots = self.long_shots or 6
  end
  
-----------
  local shotsBoost = GetComponentEffectValue(self, "ExtraBurstShots", action.id)

  if shotsBoost then
    shots = shots + shotsBoost
  end
  

  return shots
  
end


----ok


function Rat_GetROF(weapon, action_id)

	
	--print("cost", cost)
	
	local num_shots = 3
	
	if action_id == "MGBurstFire" then
		num_shots = weapon.long_shots
	else
		action_id = "BurstFire"
		num_shots = weapon.burst_shots 
	end
	
	
	local cost = (weapon.ShootAP  + rat_getDeltaAP(false, weapon, action_id)) / const.Scale.AP
	 
	local shotsBoost = GetComponentEffectValue(weapon, "ExtraBurstShots", action_id)
	--print(shotsBoost)
	if shotsBoost then
		num_shots = num_shots + shotsBoost
	end
	
	--print("num_shots", num_shots)
	local ROF = num_shots* 1.00/cost 
	
	ROF = ROF + 0.25
	ROF = (ROF - 1.00)/3.5
	ROF = ROF + 1.00
	return ROF
end