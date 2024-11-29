function OnMsg.UnitStanceChanged(unit)
	local side = unit and unit.team and unit.team.side or ''

	if not (side == 'player1' or side == 'player2') then
		return
	end

	if unit.stance == 'Prone' then
		unit:RemoveStatusEffect("shooting_stance")
	end
end

function OnMsg.UnitStanceChanged(unit)

	local attaches = unit:GetAttaches(WeaponVisualClasses)
	for _, attach in ipairs(attaches) do
		local parts = attach.parts
		local is_holstered = attach.equip_index ~= 1 and attach.equip_index ~= 2
		if parts and parts.Grip and parts.Grip:HasState("folded") then
			local bipod_state = is_holstered or unit.stance ~= "Prone" and "folded" or unit.stance == "Prone" and "idle"
			if parts.Grip:GetStateText() ~= bipod_state then
				parts.Grip:SetState(bipod_state)
			end
		end
	end
end




function OnMsg.OnAttack(self, action, target, results, attack_args)

	local weapon = attack_args.weapon or self:GetActiveWeapons()
	if not weapon then
		return
	end

	if IsKindOfClasses(weapon, "Pistol", "Revolver", "SubmachineGun") then
		self:AddStatusEffect("shoot_move")
	end

end


---------------------------------------------------


function OnMsg.GatherCritChanceModifications(attacker, target, action_id, weapon, data)

	if not IsKindOf(weapon, "Firearm") then
		return
	end
	if not attacker then
		return
	end
	if not weapon then
		return
	end
	local aim = data.aim

	-- if attacker.unit_command == "GrizzlyPerk" then
	-- action_id == "MGBurstFire"
	-- end

	if not aim then
		aim = 0
	end


	local crit_chance_breakdown = {base = data.crit_chance}

	local crit_HEC = hand_eye_crit(action_id, weapon, attacker, aim) or 0

	crit_chance_breakdown["HEC"] = crit_HEC

	data.crit_chance = data.crit_chance + crit_HEC

	if weapon and weapon:HasComponent("critical_per_aim_scope") then
		local crit_scope_aim = 3 * aim
		crit_chance_breakdown["critical_per_aim_scope"] = crit_scope_aim
		data.crit_chance = data.crit_chance + crit_scope_aim
	end

	if weapon and weapon:HasComponent("critical_per_aim_laser") then
		local laser_aim = 1 * aim
		laser_aim = cRound(laser_aim)
		crit_chance_breakdown["critical_per_aim_laser"] = laser_aim
		data.crit_chance = data.crit_chance + laser_aim
	end

	if weapon and weapon:HasComponent("pso_dragunov_scope_critical") and aim > 1 then
		local pso_bonus = 10
		data.crit_chance = data.crit_chance + pso_bonus
		crit_chance_breakdown["PSO_scope"] = pso_bonus
	end

	if weapon and weapon:HasComponent("first_aim_crit") then
		if aim and aim > 0 then
			local first_aim_bonus = 6
			data.crit_chance = data.crit_chance + first_aim_bonus
			crit_chance_breakdown["first_aim_bonus"] = first_aim_bonus
		end
	end

	if aim > 0  then
		if data.target_spot_group and data.target_spot_group == "Head" then

			local modifyVal, compDef = GetComponentEffectValue(weapon, "scout_scope_crit", "critical_head")

			if modifyVal then
				data.crit_chance = data.crit_chance + modifyVal
				crit_chance_breakdown["scout_scope_crit"] = modifyVal
			end
		end

		if data.target_spot_group and data.target_spot_group == "Torso" then

			local modifyVal, compDef = GetComponentEffectValue(weapon, "zrak_scope_crit", "crit_torso")

			if modifyVal then
				data.crit_chance = data.crit_chance + modifyVal
				crit_chance_breakdown["zrak_scope_crit"] = modifyVal
			end
		end
	end
	data.crit_chance_breakdown = crit_chance_breakdown
end

function OnMsg.GatherCTHModifications(attacker, cth_id, action_id, target, weapon1, weapon2, data)
	if cth_id == "SameTarget" then
		if data.enabled then
			data.mod_add = data.mod_add - 8
		end
	end
end

function OnMsg.GatherCritChanceModifications(attacker, target, action_id, weapon, data)
	local side = attacker and attacker.team and attacker.team.side or ''
	if not (side == 'player1' or side == 'player2') then
		data.crit_chance = MulDivRound(data.crit_chance, (const.Combat.R_AI_critmul or 100), 100)
	end
end

function OnMsg.GatherDamageModifications(attacker, target, action_id, self, mod_attack_args, mod_hit_data, data)
	local weapon = data.weapon

	if not IsKindOf(weapon, "Firearm") then
		return
	end

	local extra_damage = weapon.CritDamage
	if extra_damage then
		data.critical_damage = data.critical_damage + extra_damage
	end

end

function OnMsg.GatherDamageModifications(attacker, target, action_id, self, mod_attack_args, mod_hit_data, data)
	local weapon = data.weapon
	if not weapon or not IsKindOf(weapon, "Firearm") then
		return
	end
	if target:HasStatusEffect("Flanked") and weapon:HasComponent("flanker") then
		local damageBonus = 10
		data.base_damage = MulDivRound(data.base_damage, 100 + damageBonus, 100)
	end
	if target:HasStatusEffect("Flanked") and IsKindOf(weapon, "SubmachineGun") then
		local damageBonus = 15
		data.base_damage = MulDivRound(data.base_damage, 100 + damageBonus, 100)
	end
end

function OnMsg.IGIModeChanged(self, new_mode)
	local unit = SelectedObj
	if IsKindOf(unit, "Unit") then
		unit:RecalcUIActions(true)
	end
end

function OnMsg.GatherDamageModifications(attacker, target, action_id, self, mod_attack_args, mod_hit_data, data)
	local weapon = data.weapon
	if weapon then
		if IsKindOf(weapon, "EndlessKnives") then
			local level = attacker:GetLevel()
			local damage_mul = 2 * level
			data.base_damage = MulDivRound(data.base_damage, 100 + damage_mul, 100)
		end

		if IsKindOf(weapon, "Unarmed") and HasPerk(attacker, "MartialArts") and attacker.species == "Human" then
			local dex_mod = 100 + MulDivRound(attacker.Dexterity, 115, 100)
			data.base_damage = MulDivRound(data.base_damage, dex_mod, 100)
		end
	end
end

function OnMsg.UnitEnterCombat(unit)

	if unit.unitdatadef_id == "Blood" then
		if unit:HasStatusEffect("MartialArts") then
			unit:RemoveStatusEffect("MartialArts")
			unit:AddStatusEffect("CQCTraining")
			ObjModified(unit)
		end
	end

end

-- function OnMsg.GatherDamageModifications (attacker, target, action_id, self, mod_attack_args, mod_hit_data, data)

-- if not (action_id == "Buckshot" or action_id == "BuckshotBurst") then
-- return
-- end
-- local mod_mul = rat_shotgun_dmg_scale(attacker,target) or 1
-- print("before dmg", data.base_damage)

-- data.damage_percent =  data.damage_percent * mod_mul
-- print("after dmg", data)

-- end

function OnMsg.CombatActionEnd(unit)

	if unit.action_command == "RunAndGun" or unit.action_command == "RecklessAssault" or unit.action_command ==
						"HundredKnives" then
		if unit.action_command == "RecklessAssault" then
			unit:AddStatusEffect("R_outofbreath", 2)
		else
			unit:AddStatusEffect("R_outofbreath")
		end
	end

	if unit.Mobile_aimed then
		unit.Mobile_aimed = nil
	end

------ Persistant Recoil
	if unit.action_command == "OverwatchAction" then

		local overwatch = g_Overwatch[unit]
		if overwatch and overwatch.num_attacks > 0 then
			local effect_reset = unit:GetStatusEffect("Rat_recoil")
			if effect_reset then
				unit:RemoveStatusEffect("Rat_recoil", "all")
			end
		end
	end
end 




------ Persistant Recoil
function OnMsg.OnAttack(self, action, target, results, attack_args)

	local weapon = attack_args.weapon or self:GetActiveWeapons()
	local aim = attack_args.aim or 0
	if const.Combat.R_RecoilP > 0 and IsKindOf(weapon, "Firearm") then

		if IsKindOf(weapon, "HeavyWeapon") then
			--pass
		else
			self:ApplyPersistantRecoilEffects(aim, action, weapon, attack_args)
		end
	end
end


-------------------------------------------------DEBUG
function debug_component(w)
	if w:HasComponent("IgnoreInTheDark") then
		return true
	end
	return false
end

local function debug_weapon_component()

	for _, unit in ipairs(g_Units) do
		local _, __, wep = unit:GetActiveWeapons()

		for i, w in ipairs(wep) do
			local valid, result = pcall(debug_component, w)
			if not valid then

				print("trying to remove bugged component in unit:", unit.unitdatadef_id)

				local unit_debug = unit
				local w1_bug, w2_bug = unit_debug:GetActiveWeapons()

				if w1_bug.subweapons then
					print("w1_bug.subweapons to remove", w1_bug.subweapons)
					w1_bug.subweapons = {}
				end

				if w2_bug.subweapons then
					print("w2_bug.subweapons to remove", w2_bug.subweapons)
					w2_bug.subweapons = {}
				end

				ObjModified(unit_debug)
				ObjModified(w1_bug)
				ObjModified(w2_bug)
				print("bugged component removed in unit:", unit.unitdatadef_id)
			end
		end

	end

end

function OnMsg.EnterSector()
	debug_weapon_component()

end

-- function OnMsg.UnitCreated(self)
-- self:AddStatusEffect("rat_start_ap")
-- ObjModified(self)
-- end

function OnMsg.UnitEnterCombat(unit)
	debug_weapon_component()
	rat_changeMag_component(unit) -----------MagChange

end
----------------------------------------------------




function OnMsg.DamageDone(attacker, target, damage)
	if not attacker or not target then
		return
	end
	local targetIsUnit = IsKindOf(target, "Unit")
	if targetIsUnit and target:HasStatusEffect('shooting_stance') then
		local overwatch = g_Overwatch[target]
		if overwatch and overwatch.permanent then
			return
		end

		local ratio = MulDivRound(damage, 100, target.MaxHitPoints)

		if (ratio > 10) then
			local bonus = 10
			local side = target and target.team and target.team.side or ''

			if not (side == 'player1' or side == 'player2') then
				bonus = bonus + 10
			end
			local add = -ratio + bonus + 10
			if not Composure_RollSkillCheck(target, 100, add) then
				target:RemoveStatusEffect("shooting_stance")
			end
		end
	end
end

function OnMsg.EnterSector()
	for _, unit in ipairs(g_Units) do

		unit.auto_face = false

	end
end

function OnMsg.UnitEnterCombat(unit)
	for _, unit in ipairs(g_Units) do

		unit.auto_face = false
	end
end

function OnMsg.CombatActionEnd(self, unit)

	if g_Pindown[self] and self.shooter_cone_v then
		DoneObject(self.shooter_cone_v)
		self.shooter_cone_v = nil
		DoneObject(self.snap_cone)
		self.snap_cone = nil
	end

	if g_Overwatch[self] then

		local overwatch = g_Overwatch[self]

		DoneObject(self.shooter_cone_v)
		self.shooter_cone_v = nil
		DoneObject(self.snap_cone)
		self.snap_cone = nil

		if g_Overwatch[self].permanent then
			self:AddStatusEffect("shooting_stance")
			return
		end

		local angle = g_Overwatch[self].angle
		-- print("ow angle", angle)
		local dir = g_Overwatch[self].dir
		-- self:SetOrientation(dir, angle)
		self:SetOrientationAngle(angle)
		-- local weapon = self:GetActiveWeapons() 
		-- local pos = self:GetPos()

		local target_pos = g_Overwatch[self].target_pos
		-- local z = pos:z()
		-- target_pos = target_pos:SetZ(z)
		-- print("visual angle ow",self:GetVisualAngle())
		-- print("ow target_pos", target_pos)
		local target = target_pos
		local angle = self:GetAngle()

		local attack_args = self.ow_args_stance or false
		self.ow_args_stance = nil
		ShootingStance(self, target, attack_args)

		if not overwatch.permanent then
			if overwatch and (overwatch.num_attacks < 1) then
				self:InterruptPreparedAttack()
			end
		end
	end
end

-- function OnMsg.IGIModeChanging(self, old_mode, new_mode)
-- print("changing")
-- RecalcUIActions(true)
-- end

----------------------------Tracer Rounds
function OnMsg.OnAttack(attacker, action, target, results, attack_args)
	-- print("attack action", action.IdDefault)
	-- print("args aim", attack_args.aim)
	-- print("args cth", attack_args.chance_to_hit)
	local weapon = attack_args.weapon or attacker:GetActiveWeapons()
	if weapon and weapon.tracer == 1 then
		attacker:AddStatusEffect("Revealed_R")
	end
end

--[[function OnMsg.UnitEnterCombat(unit)
	

		--for _, unit in ipairs(g_Units) do
			--if unit:HasStatusEffect("shooting_stance") then
			if unit.shooter_cone_v then
				-- local aim_pos = self.aim_pos_stance or false
				-- if not aim_pos then
					-- aim_pos = unit:GetLastAttack():GetPos() or false
				-- end
				
				-- if not aim_pos then
					aim_pos = unit.shooter_cone_v.center
				--end
				print("center aim pos", aim_pos)
				
				
				
				if aim_pos then
					local self_pos = self:GetPos()
					local self_angle = self:GetAngle()
					local angle = CalcOrientation(self_pos, aim_pos)
					
					if not (angle == self_angle) then
					--print(angle)
						self:AnimatedRotation(angle)--SetOrientationAngle(angle)
					end
				end
			end
		end
end]]

-- function OnMsg.OnAttack(self, action, results, attack_args, combat_starting, attacker, target)

-- local ap = attacker:GetUIActionPoints()	

-- local side = attacker and attacker.team and attacker.team.side or ''
-- local weapon = attack_args.weapon
-- local aim = attack_args.aim

-- attack_args.aim = aim +1 
-- if (side == 'player1' or side == 'player2') then
-- return
-- end
-- if action.id == "AutoFire" then
-- return
-- end

-- if not IsKindOf(weapon, "Firearm") then
-- return
-- end

-- if aim > 0 then
-- return
-- end

-- end

-----------Rule On Attack

-- local ap = attacker:GetUIActionPoints()	

-- local side = attacker and attacker.team and attacker.team.side or ''
-- local weapon = attack_args.weapon
-- local aim = attack_args.aim
-- local args = attack_args
-- print("r",results)
-- local cth = results.chance_to_hit
-- print(cth)
-- attacker:AddStatusEffect("shooting_stance")
-- local new_Cth = results.chance_to_hit
-- print("new",new_Cth)
-- local aimCost = 1
-- if GameState.RainHeavy then
-- aimCost = MulDivRound(aimCost, 100 + const.EnvEffects.RainAimingMultiplier, 100)
-- end
-- local stance_cost = (weapon.APStance + aimCost) * const.Scale.AP
-- print(stance_cost)

-- if (side == 'player1' or side == 'player2') then
-- return
-- end
-- if action.id == "AutoFire" then
-- return
-- end
-- if action.id == "RunAndGun" then
-- return
-- end

-- if not IsKindOf(weapon, "Firearm") then
-- return
-- end

-- if HasPerk(attacker, "shooting_stance") then
-- return
-- end

-- if aim > 0 then
-- return
-- end

-- if ap < stance_cost then
-- return
-- end

-- if cth < 50 then
-- attack_args.aim = aim + 1
-- CombatActionInterruped(attacker)
-- end
