function DestroyStanceConeV(unit)
	if unit.shooter_cone_v then
		DoneObject(unit.shooter_cone_v)
		unit.shooter_cone_v = nil
		DoneObject(unit.snap_cone)
		unit.snap_cone = nil
	end
end

function OnMsg.TurnEnded()
	for _, unit in g_Units do
		DestroyStanceConeV(unit)
	end
end

function OnMsg.CombatActionStart(unit)
	DestroyStanceConeV(unit)
end


function OnMsg.SelectedObjChange()
	local selected = SelectedObj
	local overwatch = g_Overwatch[selected]

	for _, unit in ipairs(g_Units) do
		if unit:HasStatusEffect("shooting_stance") then
			if unit == selected then
				if unit.shooter_cone_v then
					unit.shooter_cone_v:SetOpacity(100)
					unit.snap_cone:SetOpacity(100)
				else
					local weapon = unit:GetActiveWeapons()
					if not (overwatch and overwatch.permanent) then
						CreateStanceConeV(unit, weapon)
					end
				end
			else
				DestroyStanceConeV(unit)
			end
		end
	end
end

function OnMsg.UnitMovementDone(unit, action_id, prev_pos)

	local ret = true
	if action_id == 'Move' then
		ret = false
	elseif action_id == "RunAndGun" then
		ret = false
	elseif action_id == "RecklessAssault" then
		ret = false
	elseif action_id == "MobileShot" then
		ret = false
	elseif action_id == "HundredKnives" then
		ret = false
	end

	if ret == true then
		return
	end

	local dist = unit:GetDist(prev_pos)

	local side = unit and unit.team and unit.team.side or ''
	if not (side == 'player1' or side == 'player2') then
		if unit:HasStatusEffect("shooting_stance") then
			local weapon = unit:GetActiveWeapons()
			local stance_ap = (weapon.APStance / 2) * const.Scale.AP

			if dist < 2000 then
				unit:GainAP(stance_ap)
			elseif dist < 4700 then
				unit:GainAP(MulDivRound(stance_ap, 50, 100))
			elseif dist < 8200 then
				unit:GainAP(MulDivRound(stance_ap, 25, 100))
			end
		end
	end

	unit:RemoveStatusEffect("shooting_stance")
end

function OnMsg.CombatActionEnd(unit)
	if unit.action_command == 'TakeCover' then
		unit:RemoveStatusEffect("shooting_stance")
	end
	if unit.action_command == 'LeaveEmplacement' then
		unit:RemoveStatusEffect("shooting_stance")
	end
	if unit.action_command == 'MGPack' then
		unit:RemoveStatusEffect("shooting_stance")
	end
	if unit.action_command == 'ThrowGrenade' then
		unit:RemoveStatusEffect("shooting_stance")
	end
	if unit.action_command == 'InteractWith' then
		unit:RemoveStatusEffect("shooting_stance")
	end
	if unit.action_command == 'ThrowKnife' then
		unit:RemoveStatusEffect("shooting_stance")
	end
	if unit.action_command == 'ReloadAction' then
		unit:RemoveStatusEffect("shooting_stance")
	end
	if unit.action_command == 'DoubleToss' then
		unit:RemoveStatusEffect("shooting_stance")
	end

	local weapon = unit:GetActiveWeapons()
	if weapon and IsKindOf(weapon, "BrowningM2HMG") then
		unit:AddStatusEffect("shooting_stance")
		return
	end
end


function OnMsg.OnAttack(self, action, target, results, attack_args)

	local weapon = attack_args.weapon or self:GetActiveWeapons()

	if not weapon or not action then
		return
	end

	if not IsKindOf(weapon, "Firearm") then
		return
	end

	if g_Overwatch[self] then
		return
	end

	local aim = attack_args.aim or 0

	--local target_pos = IsValid(target) and target:GetPos() or target

	if aim and aim > 0 or HasPerk(self, "shooting_stance") then
		ShootingStance(self, target, attack_args)
	end
end

