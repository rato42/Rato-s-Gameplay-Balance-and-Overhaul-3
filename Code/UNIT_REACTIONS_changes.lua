



function change_class_unit_reaction(class, event, handler)
	for i, reac in class.unit_reactions do
		if reac.Event == event then
			reac.Handler = handler
			break
		end
	end
end



function OnMsg.ClassesGenerate(classdefs)
	


	if classdefs.Psycho then
		local reac = classdefs.Psycho.unit_reactions
		for i, react in ipairs(reac) do
			if react.Event == "OnFirearmAttackStart" then
			
				react.Handler = function (self, target, attacker, attack_target, action, attack_args)
					if target == attacker and (action.id == "SingleShot" or action.id == "BurstFire") then
						if attacker:Random(100) < self:ResolveValue("procChance") then
							local weapon = action:GetAttackWeapons(attacker)
							if action.id == "SingleShot" and table.find(weapon.AvailableAttacks, "BurstFire") then
								attack_args.replace_action = "BurstFire"
								PlayVoiceResponse(attacker, "Psycho")
							elseif action.id == "BurstFire" and table.find(weapon.AvailableAttacks, "AutoFire") then
								attack_args.replace_action = "AutoFire"
								-----
								attack_args.num_shots = attacker:GetActiveWeapons():GetAutofireShots(CombatActions[attack_args.replace_action]) or attack_args.num_shots
								-----
								PlayVoiceResponse(attacker, "Psycho")
							end
						end
					end
				end
			end
		end
	end


	-- if classdefs.ExtraOverwatchShots then
		-- local reac = ExtraOverwatchShots.unit_reactions
		-- for i, react in ipairs(reac) do
			-- if react.Event == "OnCalcOverwatchAttacks" then
				-- react.Handler =  = function (self, target, value, action, args)
					-- if not target then return value end
					-- local wep = target:GetActiveWeapons()
					-- if not wep then return value end
					-- if wep == self then
						-- return value + WeaponComponentEffects.ExtraOverwatchShots:ResolveValue("extra_attacks")
					-- end
					-- return value
				-- end
			-- end
		-- end
	-- end


	if classdefs.Spiritual then
		
		local reac = classdefs.Spiritual.unit_reactions
		for i, react in ipairs(reac) do
			if react.Event == "OnCalcChanceToHit" then
				-- table.remove(reac, react)
				-- table.insert(reac, {	Event = "OnCalcChanceToHit",
										-- Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
											-- data.min = self:ResolveValue("minAccuracy")
										-- end,}
								
							-- )
				react.Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
									if target == attacker then	
										data.min = self:ResolveValue("minAccuracy")
									end
								end
				break
			end
		end
	end

	if classdefs.TakeAim then
		local reacti = classdefs.TakeAim.unit_reactions
		for i, react in ipairs(reacti) do
			if react.Event == "OnModifyCTHModifier" then
				table.remove(reacti, i)
				break
			end
		end
		--print(classdefs.TakeAim.unit_reactions)
	end
	
	if classdefs.Blood.StartingPerks then
		
		for i, perk in ipairs(classdefs.Blood.StartingPerks) do
				if perk == "MartialArts" then
					classdefs.Blood.StartingPerks[i] = "CQCTraining"
				end
		end
		
	end

    if classdefs.GruntyPerk.unit_reactions then
        table.insert(classdefs.GruntyPerk.unit_reactions, {
            Event = "OnFirearmAttackStart",
            Handler = function(self, target, attacker, attack_target, action, attack_args)
                if target == attacker and attack_args.gruntyPerk then
                    target:AddStatusEffect("grunty_bonus")
                    attack_args.aim = 1
                end 
            end,
        })
    end
	

	
	
    if classdefs.MartialArts.unit_reactions then
        classdefs.MartialArts.unit_reactions = {
            PlaceObj('UnitReaction', {
                Event = "OnCalcChanceToHit",
                Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
                    if not (action and action.ActionType == "Melee Attack") then return end
                    
                    local text = T{776394275735, "Perk: <name>", name = self.DisplayName}
                    if target == attack_target and IsKindOf(target, "Unit") and target.species ~= "Human" then
                        text = T(767817302327, "Perk: Animal Reflexes")
                    end
                    
                    --
                    if target == attacker and target.species ~= "Human" then
					--
                        ApplyCthModifier_Add(self, data, self:ResolveValue("hit"), text)
                    end
                    
                    
                    if target == attack_target then
                        ApplyCthModifier_Add(self, data, -self:ResolveValue("defense"), text)
                    end
                end,
            }),
        }
    end


	if classdefs.AutoWeapons.unit_reactions then
		classdefs.AutoWeapons.unit_reactions = false
	end
	
	if classdefs.Ambidextrous.unit_reactions then
		classdefs.Ambidextrous.unit_reactions = false
	end
	
	
	
   -- print("martial", classdefs.MartialArts.unit_reactions)
end



---------------------------------------------------------------------------------------------------------

local t_id_table = {
[767817302327] = "Perk: Animal Reflexes",
}

ratG_T_table['UNIT_REACTIONS_changes.lua'] = t_id_table