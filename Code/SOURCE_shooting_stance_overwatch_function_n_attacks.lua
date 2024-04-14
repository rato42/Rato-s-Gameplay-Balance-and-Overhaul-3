function define_getOWattacks_and_aim()
	function Unit:GetOverwatchAttacksAndAim(action, args, unit_ap)
			
		---- Shooting Stance will properly modify aim num
		local aim = 0 
		-------
		
		action = action or CombatActions.Overwatch
		local weapon, w2 = action:GetAttackWeapons(self)
		
		------------ No longer used
		-- local attack = self:GetDefaultAttackAction("ranged", "ungrouped", nil, true, "ignore", {skip_ap_check = true}) --, {skip_ap_check = true}
		-- local AP_delta = attack.ActionPointDelta or 0
		---------------------------
		
		unit_ap = unit_ap or g_Combat and self:GetUIActionPoints() or self:GetMaxActionPoints()
		args = table.copy(args)
		
		
		-----------------------------------------Retrieves base cost (stance) using the OW combat action
		args.action_cost_only = true
		args.ow_get_atks = false
		local cost = action:GetAPCost(self, args) 
		
		if not g_Combat then
			cost = 0
		end
		
		--print("cost ow get attacks",cost)
		------------------------------------------
		
		------------------------------------------ Prepares atk number calculation by deducting stance ap if any
		local ap = unit_ap - cost 
		-----------------------------------------
		
		
		-------------------------------------Retrieves attackcost using the OW combat action
		args.ow_get_atks = true
		local atk_cost = action:GetAPCost(self, args)
		--print("atk cost get attacks", atk_cost)
		
		--------------------------------------
		
		
		-------------------------------------Calculate attack number
		local attacks
		
		
			------Checks if subsequent attacks should have bolting ap cost
		local w2_bolting_cost = 0
		if w2 and rat_canBolt(w2) and not w2.unbolted then
			w2_bolting_cost = rat_get_manual_cyclingAP(self, w2, true) * const.Scale.AP	
		end
		
		local w1_bolting_cost = 0
		if rat_canBolt(weapon) and not weapon.unbolted then	
			w1_bolting_cost = rat_get_manual_cyclingAP(self, weapon, true) * const.Scale.AP	
		end
		
			------- if the weapon is unbolted, the attack cost will automatically default to the unbolted value
		local first_shot_ap = atk_cost
			
		--print("First shot ow atk cost", first_shot_ap)
			
		atk_cost = atk_cost + w1_bolting_cost + w2_bolting_cost
			
		--print("unboltable weapon ow atk cost", atk_cost)
		if not atk_cost then
			print("overwatch calc n attacks, attk cost is nil")	
			atk_cost = 0
		end
		ap = ap - first_shot_ap
		if atk_cost <= 0 then 
			print("overwatch calc n attacks, attk cost is less than zero:", atk_cost, "...")
			print("... action:", action, "weapon", weapon)
			return 0
		else
			attacks = 1 + (ap /  atk_cost)
		end
	
		
		if attacks < 1 then
			return 0
		end
	
		
		
		--print("attacks", attacks)
		
		attacks = self:CallReactions_Modify("OnCalcOverwatchAttacks", attacks, action,args)
		--print("number of ow attacks", attacks)
		-------------------------------------
		
		
		return attacks, aim
	end
end

define_getOWattacks_and_aim()


--[[if rat_canBolt(weapon) and not weapon.unbolted then ----if the weapon can unbolt, but is bolted, first attack needs to have different cost
		local first_shot_ap = atk_cost
		
		print("First shot ow atk cost", first_shot_ap)
		
		atk_cost = atk_cost + rat_get_manual_cyclingAP(self, weapon, true) * const.Scale.AP	
		
		print("unboltable weapon ow atk cost", atk_cost)
		
		ap = ap - first_shot_ap
		attacks = 1 + (ap / atk_cost)
	else -----if its unbolted, all attacks will come with the additional cost from the OW combat action calc
		attacks = ap / atk_cost 
	end]]



--[[function Unit:GetOverwatchAttacksAndAim(action, args, unit_ap)

  local aim = 0
  action = action or CombatActions.Overwatch
  local weapon = action:GetAttackWeapons(self)
  local attack = self:GetDefaultAttackAction("ranged", "ungrouped", nil, true, "ignore", {skip_ap_check = true}) --, {skip_ap_check = true}

  local AP_delta = rat_getDeltaAP(attack, weapon) or 0
  print("attackid", attack.id)
	--print("ap_delta", AP_delta)
  --print("attack",attack,"ap delta", AP_delta)
  -- if g_Combat and attack.id ~= "MGBurstFire" then 
	-- attack = self.ui_actions['Attackdefault']--self:GetDefaultAttackAction()
	-- AP_delta = CombatActions[attack].ActionPointDelta or 0
  -- end
  unit_ap = unit_ap or g_Combat and self:GetUIActionPoints() or self:GetMaxActionPoints()
  args = table.copy(args)
  args.action_cost_only = true
	
  -- print(attack.ActionPointDelta)
 -- print(attack.id)
  --print(AP_delta)
  local unit = self

    local side = unit and unit.team and unit.team.side or ''
		
		
		
		
	
			
  local cost = action:GetAPCost(self, args) --+stance 
  if not g_Combat then
	cost = 0
  end


  if HasPerk(self, "shooting_stance") then
	aim = 1
	
	cost = self:GetApExtra(self, args and args.target or false, weapon, args and args.aim or 0, action) or 0

  else
	cost = cost + Get_AimCost()--aim_cost
	--print("ow cost + aim",cost)
  end
  
  print("cost ow",cost)
  
  local ap = unit_ap - cost 
  
  
  
  
  local atk_cost = self:GetAttackAPCost(self, weapon, nil, args and args.aim or 0) + AP_delta
  --attack:GetAPCost(self, args)--self:GetAttackAPCost(self, weapon, nil, args and args.aim or 0) + AP_delta --+ap_mod--attack.ActionPointDelta --+ ap_mod 
 
	-- if HasPerk(self, "shooting_stance") then----- remove the rotation cost from attack
		-- atk_cost = atk_cost - cost
		-- print("yes")
	-- end
  
  
  print("attack cost ow", atk_cost)
  


  local attacks = ap / atk_cost 
  if attacks < 1 then
	-- if not (side == 'player1' or side == 'player2') then
		-- attacks = 1
	-- else
		return 0
	--end
  else
	attacks = attacks --+1
  end
  --print("attacks", attacks)
  if IsKindOf(weapon, "Machinegun") then
	--print("machinegun")
	attacks = attacks +1
  end
  
  attacks = self:CallReactions_Modify("OnCalcOverwatchAttacks", attacks, action,args)
  -- if HasPerk(self, "OverwatchExpert") then
    -- attacks = attacks + CharacterEffectDefs.OverwatchExpert:ResolveValue("bonusAttacks")
  -- end
  
  -- if HasPerk(self, "NightmarePerkComboHB") or HasPerk(self, "NightmarePerkComboDOA") then
	-- attacks = attacks + 2
  -- end
 
  -- local extraAttackBonus = GetComponentEffectValue(weapon, "ExtraOverwatchShots", "extra_attacks")
  -- if extraAttackBonus then
    -- attacks = attacks + extraAttackBonus
  -- end
  return attacks, aim
end]]

--ok