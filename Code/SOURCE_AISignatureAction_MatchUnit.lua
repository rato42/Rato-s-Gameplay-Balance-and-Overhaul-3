
---AIActions.lua

function AISignatureAction:MatchUnit(unit)
  for state, _ in pairs(self.AvailableInState) do
    if not GameStates[state] then
      return
    end
  end
  for state, _ in pairs(self.ForbiddenInState) do
    if GameStates[state] then
      return
    end
  end
  for _, keyword in ipairs(self.RequiredKeywords) do
    if not table.find(unit.AIKeywords or empty_table, keyword) then
      return
    end
  end
  --------------------------
  if unit then
	local actions = unit.ui_actions
	local attack_type = self.action_id
	local weapon = unit:GetActiveWeapons()


	if attack_type == "BurstFire" or attack_type == "AutoFire" or attack_type == "RunAndGun" then
		if actions[attack_type] ~= nil then
			local ui_status = actions[attack_type]
			if ui_status and ui_status == "Hidden" then
				--print("noburst")
				return
			end
		else
			return
		end
	end

 end
  --------------------------
  
  
  
  
  return true
end


------ok