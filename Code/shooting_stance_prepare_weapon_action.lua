
function rat_place_prepareweapon_combat_actions()
	PlaceObj('CombatAction', {
		ActionType = "Ranged Attack",
		ActivePauseBehavior = "queue",
		AimType = "cone",
		ConfigurableKeybind = false,
		------------------
		Description = T(222855944347, "Enter <em>Shooting Stance</em> and end your turn."),
		DisplayName = T(187383913751, "Prepare Weapon"),
		-------------------
		Execute = function (self, units, args)
			local unit = units[1]
			--local attacks, aim = unit:GetOverwatchAttacksAndAim(self, args)
			-----------
			args.num_attacks = 0
			args.aim = 0
		
			--args.free_aim = true
			----------------
			local ap = self:GetAPCost(unit, args)
			NetStartCombatAction(self.id, unit, ap, args)
		end,
		
		-----
		GetAPCost = function (self, unit, args)
			
			local stance = 0
			local param
			--local weapon = self:GetAttackWeapons(unit, args)
			local weapon = unit:GetActiveWeapons()
			--local attack = unit:GetDefaultAttackAction("ranged", "ungrouped")
			local action = self
			if not HasPerk(unit, "shooting_stance") then
				param = "stance"
				stance = unit:GetApExtra(unit, args and args.target or false, weapon, args and args.aim or 0, action, param) or 0
			end
			
			if not HasPerk(unit, "shooting_stance") then
				stance = stance + Get_AimCost()
				return stance--Max(unit:GetUIActionPoints(), stance), stance
			else 
				local rotate = unit:GetApExtra(unit, args and args.target or false, weapon, args and args.aim or 0, action, param) or 0 

				rotate = Max(1 *const.Scale.AP,rotate)
				return rotate--Max(unit:GetUIActionPoints(), rotate), rotate
			end
			
			
			
		end,
		---------------------
		--[[GetReservedAP = function (self, units)
			local unit = units[1]
			local weapon = unit:GetActiveWeapons()
			
			-- local cost = 1 * const.Scale.AP
			-- if not HasPerk(unit, "shooting_stance") then
				-- cost = weapon.APStance * const.Scale.AP + Get_AimCost()
			-- else
				-- cost = unit:GetApExtra(unit, args and args.target or false, weapon, args and args.aim or 0, action, param) or 0 
			-- end
			local num = Max(0, unit:GetUIActionPoints()) --- cost)--------- custo?
			num = Min(num, 3*const.Scale.AP)
		end,]]
			
			
		
		GetActionDescription = function (self, units)
			local descr
			local unit = units[1]
			if not HasPerk(unit, "shooting_stance") then
				descr = T{399161531399, "Enter <em>Shooting Stance</em> and <em>end your turn</em>."}
				
			else
				descr = T{878229893688, "Rotate your weapon and <em>end your turn</em>."}
				
			end
			
				local num = Max(0, unit:GetUIActionPoints())
				num = Min(num, 3*const.Scale.AP)
				
				
				if num >= const.Scale.AP then
					return descr .. T{128220108077, "<newline><newline>This action will transfer <em><ap(num_ap)></em> to the next turn", num_ap = num}
				end	
			
			
			
			return descr
		end,
		
		---------------------------------
		
		GetActionDisplayName = function (self, units)
				local name
				local unit = units[1]
				if not HasPerk(unit, "shooting_stance") then
					name = T(871168252913, "Prepare Weapon")
				else
					name = T(735297133453, "Rotate Weapon")
				end	
				return name
		end,
		GetActionIcon = function (self, units)
			-- if not g_Combat then
				-- return CombatActions.ExplorationOverwatch.Icon
			-- end
			return self.Icon
		end,
		GetActionResults = function (self, unit, args)
			
			local target = args.target
			local weapon = self:GetAttackWeapons(unit, args)
			if not weapon then return {} end
			local sub_action = unit:GetDefaultAttackAction("ranged", "ungrouped")
			local attack_args = unit:PrepareAttackArgs(self.id, args)
			local targets = unit:GetVisibleEnemies()
			
			local results = {}
			if sub_action.AimType == "cone" then
				-- check for collateral damage around exact targets
				local sub_attack_args = unit:PrepareAttackArgs(sub_action.id, args)
				local aoe = GetAreaAttackResults(sub_attack_args)
				for i, aoeHit in ipairs(aoe) do
					if IsKindOf(aoeHit.obj, "Unit") then
						table.insert_unique(targets, aoeHit.obj)
						results[#results + 1] = aoeHit
					end
				end
			end
			
			local modifiers = GetAreaAttackHitModifiers(self.id, attack_args, targets)
			local sub_action_lof_params = {
				can_use_covers = false,
				can_stuck_on_unit = false,
			}
			local lof_data = GetLoFData(unit, targets, sub_action_lof_params)
			for i, target in ipairs(targets) do
				local mod = modifiers[i]
				if mod > 0 then
					sub_action_lof_params.target = target
					local sub_action_results = sub_action:GetActionResults(unit, sub_action_lof_params)
					if sub_action.AimType == "cone" then -- cause area action results are in different format...
						sub_action_results = sub_action_results.area_hits
					end
					local target_hit
					for i, hitData in ipairs(sub_action_results) do
						if hitData.obj == target then
							results[#results + 1] = hitData
							target_hit = true
						end
					end
					--if not target_hit then
					local target_lof_data = lof_data[i]
					if target_lof_data.clear_attacks == 0 then
						results.no_lof_targets = results.no_lof_targets or {}
						table.insert(results.no_lof_targets, target)
					end
				end
			end
			
			-- We dont want to show damage prediction, just hit prediction.
			for i, result in ipairs(results) do
				result.damage = 0
				result.display_only = true
				result.ignore_armor = true
			end
			
			return results, attack_args
			
		end,
		GetAimParams = function (self, unit, weapon)
			local params = weapon:R_GetAreaAttackParams(self.id, unit)
			
			
			--params.min_range = self:GetMinAimRange(unit, weapon)
			params.max_range = self:GetMaxAimRange(unit, weapon)*1.5
			params.min_range = params.max_range*1.5
			--assert(params.max_range >= params.min_range)
			return params
		end,
		GetAttackWeapons = function (self, unit, args)
			if args and args.weapon then return args.weapon end
			return unit:GetActiveWeapons("Firearm")
		end,
		GetMaxAimRange = function (self, unit, weapon)
			local range = weapon:GetOverwatchConeParam("MaxRange")
			local sight = unit:GetSightRadius() / const.SlabSizeX
			return Min(range, sight)
		end,
		GetMinAimRange = function (self, unit, weapon)
			local range = weapon:GetOverwatchConeParam("MinRange")
			local sight = unit:GetSightRadius() / const.SlabSizeX
			return Min(range, sight)
		end,
		GetUIState = function (self, units, args)
			local unit = units[1]
			local cost = self:GetAPCost(unit, args)
			local weapon = unit:GetActiveWeapons()
			
			if not IsKindOf(weapon, "Firearm") then
				return "hidden"
			end
			
			if cost < 0 then return "hidden" end
			
			if g_Overwatch[unit] then
				return "hidden"
			end
			
			if not unit:UIHasAP(cost) then 
				return "disabled", GetUnitNoApReason(unit) 
			else
				return "enabled"
			end

		end,
		

		--RequireTargets = false,
		
		Icon = "Mod/cfahRED/Images/shootingstancecompleto.png",
		IdDefault = "R_PrepareWeapon",
		--IdDefault = "Overwatchdefault",
		--KeybindingFromAction = "actionRedirectOverwatch",
		MultiSelectBehavior = "first",
		KeybindingSortId = "2351",
		--QueuedBadgeText = T(507392307526, --[[CombatAction Overwatch QueuedBadgeText]] "OVERWATCH"),
		QueuedBadgeText = T(756827411698, "PREPARE"),
		RequireState = "any",
		Run = function (self, unit, ap, ...)
			--local vr = IsMerc(unit) and "Overwatch" or "AIOverwatch"
			--PlayVoiceResponse(unit, vr)
			--unit.ui_reserved = self:GetReservedAP(self, units)

			unit:AddStatusEffect("R_ReservedAP_stance")
			local effect = unit:GetStatusEffect("R_ReservedAP_stance")
			
			effect:SetParameter("action_ap_cost", ap)
			--print(effect)
			unit:SetActionCommand("OverwatchAction", self.id, ap, ...)
		end,
		SortKey = 2,
		UIBegin = function (self, units, args)
	 
			CombatActionAttackStart(self, units, args, "IModeCombatAreaAim", "cancel")
			
		end,
		group = "Default",
		id = "R_PrepareWeapon",
	})


	PlaceObj('CombatAction', {
		ActionPoints = 0000,
		ActivePauseBehavior = "instant",
		ConfigurableKeybind = false,
		Description = T(148517345744, "Exit <em>Shooting Stance</em>"),
		DisplayName = T(567973728148, "Lower Weapon"),
		GetActionDescription = function (self, units)
			local unit = units[1]
			-- if unit:IsBeingBandaged() then
				-- return T(540349977342, "Cancel the bandaging action. The unit will be able to move but not regain any more HP.")
			-- end
			-- if not g_Combat then
				-- return T(151546259528, "Cancel the bandaging action. The bandaged unit will not regain any more HP.")
			-- end
			
			local description = self.Description
			
			if unit.return_pos_reserved then
				description = description .. " and return to cover."
			else
				description = description .. "."
			end
			
			return description
		end,
		-- GetAPCost = function (self, unit, args)
			-- return 1 * const.Scale.ap
		-- end,
		GetUIState = function (self, units, args)
		---------------------
			local unit = units[1]
			local cost = self:GetAPCost(unit,args)
			
			
			if not HasPerk(unit, "shooting_stance") then
				return "hidden"
			elseif not unit:UIHasAP(1000) and (unit.free_move_ap and unit.free_move_ap < 1000) then
				return "disabled", T(677754398866, "<color AmmoAPColor>Turn Ended</color>")
			end

			-- else
				-- if not unit:UIHasAP(cost) then 
					-- return "disabled", GetUnitNoApReason(unit) 
				-- else
					-- return "enabled"
				-- end
			-- end
			return "enabled"
			------------------
		end,
		Icon = "Mod/cfahRED/Images/shootingstance_removal3.png",
		IdDefault = "R_LowerWeapon",
		IsAimableAttack = false,
		--KeybindingFromAction = "actionRedirectBandage",
		KeybindingSortId = "2352",
		MultiSelectBehavior = "first",
		RequireState = "any",
		Run = function (self, unit, ap, ...)
			unit:RemoveStatusEffect("shooting_stance")
			unit:InterruptPreparedAttack()
			unit:SetCommand("Idle")
			--ObjModified(unit)
			-- if unit:GetBandageTarget() then
				-- unit:SetActionCommand("EndCombatBandage")
			-- else
				-- for _, other in ipairs(g_Units) do
					-- if unit ~= other and other:GetBandageTarget() == unit then
						-- other:SetActionCommand("EndCombatBandage")
					-- end
				-- end
			-- end
		end,
		SortKey = 21,
		group = "Default",
		id = "R_LowerWeapon",
	})
end


---------------------------------------------------------------------------------------------------------

local t_id_table = {
[222855944347] = "Enter <em>Shooting Stance</em> and end your turn.",
[187383913751] = "Prepare Weapon",
[871168252913] = "Prepare Weapon",
[735297133453] = "Rotate Weapon",
[756827411698] = "PREPARE",
[148517345744] = "Exit <em>Shooting Stance</em>",
[567973728148] = "Lower Weapon",
[540349977342] = "Cancel the bandaging action. The unit will be able to move but not regain any more HP.",
[151546259528] = "Cancel the bandaging action. The bandaged unit will not regain any more HP.",
[677754398866] = "<color AmmoAPColor>Turn Ended</color>",
[399161531399] = "Enter <em>Shooting Stance</em> and <em>end your turn</em>.",
[878229893688] = "Rotate your weapon and <em>end your turn</em>.",
}

ratG_T_table['shooting_stance_prepare_weapon_action.lua'] = t_id_table