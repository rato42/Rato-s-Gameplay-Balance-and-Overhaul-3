
function presets_char_effect()
	local bonus = 5
	local autobonus = 100
	ForEachPreset('CharacterEffectCompositeDef', function(p)
	  if p.id == 'TakeAim' then                  -----------TakeAim
		p.Description = T(771192369187, 'Improves <em>Recoil</em> control.')
		for _, param in ipairs(p.Parameters) do
			if param.Name == 'chanceToHitBonus' then
				param.Value = bonus
			end
		end
		
	  end
	  if p.id == 'AutoWeapons' then              ------------AutoWeapons
		for _, param in ipairs(p.Parameters) do
			if param.Name == 'automatics_penalty_reduction' then
				param.Value = autobonus
			end
		end
		p.unit_reactions = {
			PlaceObj('UnitReaction', {
			--ActorParam = "attacker",
			Event = "OnModifyCTHModifier",
			Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
				return
				-- local function exec(self, attacker, cth_id, action_id, target, weapon1, weapon2, data)
				-- if cth_id == "Autofire" then
					-- data.meta_text[#data.meta_text+1] = T{776394275735, "Perk: <name>", name = self.DisplayName}
					-- data.mod_mul = AutoWeapons:ResolveValue("automatics_penalty_reduction")
				-- end
				-- end
				
				-- if not IsKindOf(self, "MsgReactionsPreset") then return end
				
				-- local reaction_def = (self.msg_reactions or empty_table)[1]
				-- if not reaction_def or reaction_def.Event ~= "GatherCTHModifications" then return end
				
				-- if not IsKindOf(self, "MsgActorReactionsPreset") then
					-- exec(self, attacker, cth_id, action_id, target, weapon1, weapon2, data)
				-- end
				
				-- if self:VerifyReaction("GatherCTHModifications", reaction_def, attacker, attacker, cth_id, action_id, target, weapon1, weapon2, data) then
					-- exec(self, attacker, cth_id, action_id, target, weapon1, weapon2, data)
				-- end
			end,
			HandlerCode = function (self, attacker, cth_id, data)
				return
				-- if cth_id == "Autofire" then
					-- data.meta_text[#data.meta_text+1] = T{776394275735, "Perk: <name>", name = self.DisplayName}
					-- data.mod_mul = AutoWeapons:ResolveValue("automatics_penalty_reduction")
				-- elseif cth_id == "RunAndGun" then
					-- data.meta_text[#data.meta_text+1] = T{776394275735, "Perk: <name>", name = self.DisplayName}
					-- data.mod_mul = AutoWeapons:ResolveValue("automatics_penalty_reduction")
				-- end
			end,
			--param_bindings = false,
			}),
		}
		end
	  if p.id == "Ambidextrous" then
		p.Description = T(453925191822, "Decreases <em>AP</em> cost and <em>Accuracy</em> penalty when <em>Dual-Wielding</em> firearms")
		for _, param in ipairs(p.Parameters) do
			if param.Name == 'PenaltyReduction' then
				param.Value = 0
			end
		end
		p.unit_reactions = {
			PlaceObj('UnitReaction', {
			--ActorParam = "attacker",
			Event = "OnModifyCTHModifier",
			Handler = function (self, target, id, attacker, attack_target, action, weapon1, weapon2, data)
				return 
				-- if target == attacker and id == "TwoWeaponFire" then
					-- data.mod_add = data.mod_add
				-- end
				
			end,
			HandlerCode = function (self, attacker, cth_id, data)
				return
			end,
			-- param_bindings = false,
					}),
		}
			end
--------------------------------------------------------------------------------------------
	  if p.id == "RecklessAssault" then
		p.Description = T(254222471844, "Make a longer <color EmStyle>Run and Gun</color>, firing more shots. \n\nSmiley will be <color EmStyle>Out of Breath</color> for a turn after use. \n\nCan't be used when <color EmStyle>Out of Breath</color>.")
	  end
---------------------------------------------------------------	  
	  local min_accuracy = 5
	  
	  if p.id == "Spiritual" then
			for _, param in ipairs(p.Parameters) do
				if param.Name == 'minAccuracy' then
					param.Value = min_accuracy
				end
			end
		end
-----------------------------------------------------------------------------
	  if p.id == "Protected" then
			for _, param in ipairs(p.Parameters) do
				if param.Name == 'max_ap_carried' then
					param.Value = 2
				end
			end
		end
	  
	if p.id == "GruntyPerk" then
		p.Description = T(313423416367, "<em>Attacks</em> the <em>closest</em> enemy with a firearm when <em>combat starts</em>, if possible. \n\nThe attack will have 1 aim level and bonus accuracy.\n\nCan't be used with Heavy Weapons.")
	end


	if p.id == "CQCTraining" then
		for _, param in ipairs(p.Parameters) do
			if param.Name == "cqc_bonus_max" then
				param.Value = 14
			end
		end
	end
			
			
			
			--[[p.unit_reactions = {
						PlaceObj("UnitReaction", {
					Event = "OnCombatStarting",
					Handler = function(self, target, load_game)
					if load_game then
					  return
					end
					local enemy = target:GetClosestEnemy()
					if enemy then
					  local weapon = target:GetActiveWeapons()
					  if IsKindOf(weapon, "Firearm") and not IsKindOf(weapon, "HeavyWeapon") then
						local action = target:GetDefaultAttackAction("ranged")
						local args = {target = enemy, gruntyPerk = true}
						LockCameraMovement("grunty perk")
						StartCombatAction(action.id, target, 0, args)
					  end
					end
				  end
				}),
				PlaceObj('UnitReaction', {
					Event = "OnFirearmAttackStart",
					Handler = function (self, target, attacker, attack_target, action, attack_args)
						--if target == attacker then
							print("atargs", attack_args)
						--end
						
						--and attack_args.gruntyPerk then
							-- attack_args.aim = 1
						-- end
					end
				}),
				
			  }

		end]]
	if p.id == "MartialArts" then
		p.Description = T(158619792866, "<em>Unarmed attacks</em> have extra damage scaling based on <em>Dexterity</em>.\n\nImproved <em>Defense</em> against <em>Melee Attacks</em>.")
	end
------------------------------------------------------------------------------------------------------------		
	end)
end






---------------------------------------------------------------------------------------------------------

local t_id_table = {
[453925191822] = "Decreases <em>AP</em> cost and <em>Accuracy</em> penalty when <em>Dual-Wielding</em> firearms",
[254222471844] = "Make a longer <color EmStyle>Run and Gun</color>, firing more shots. \n\nSmiley will be <color EmStyle>Out of Breath</color> for a turn after use. \n\nCan't be used when <color EmStyle>Out of Breath</color>.",
[313423416367] = "<em>Attacks</em> the <em>closest</em> enemy with a firearm when <em>combat starts</em>, if possible. \n\nThe attack will have 1 aim level and bonus accuracy.\n\nCan't be used with Heavy Weapons.",
[158619792866] = "<em>Unarmed attacks</em> have extra damage scaling based on <em>Dexterity</em>.\n\nImproved <em>Defense</em> against <em>Melee Attacks</em>.",
}

ratG_T_table['CharEffectCompositeDef_function.lua'] = t_id_table