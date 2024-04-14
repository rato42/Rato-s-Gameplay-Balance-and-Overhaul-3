--[[function CombatActionGetAttackableEnemies(self, attacker, weapon, filter, ...)
	local attackable = {}
	if not attacker or (self.ActionType ~= "Melee Attack" and self.ActionType ~= "Ranged Attack") then 
		return attackable 
	end
	local visibleTargets = attacker:GetVisibleEnemies()
	local weps = weapon or self:GetAttackWeapons(attacker)
	for i, t in ipairs(visibleTargets) do
		if IsValid(t) and (not filter or filter(t, ...)) then
		
		
		--------------
			local has_ap = true
			if HasPerk(attacker, "shooting_stance") then
				local actions = attacker.ui_actions
				local action = self

				if actions["SingleShot"] then
					action = CombatActions.SingleShot
				elseif actions["MGBurstFire"] then
					action = CombatActions.MGBurstFire	
				elseif actions["Buckshot"] then
					action = CombatActions.Buckshot
				elseif actions["BuckshotBurst"] then
					action = CombatActions.BuckshotBurst
				end
				print("action", action.id, "cost", cost)
				local args = {target = t, aim = 1, get_enemies = true}
				local cost = action:GetAPCost(attacker, args)
			
				if not attacker:UIHasAP(cost) then
					has_ap = false	
				end
			end
		------------------^^
		
			local canAttack, err = attacker:CanAttack(t, weps, self, 0)
			
		------------------
			if not has_ap then
				canAttack = false
			end
		----------------^^
		
			if canAttack then
				attackable[#attackable + 1] = t
			end
		end
	end
	return attackable
end]]