--[[function Unit:FirearmAttack(action_id, cost_ap, args, applied_status)
  do
    local effects = {}
    for i, effect in ipairs(self.StatusEffects) do
      effects[i] = effect.class
    end
    effects = table.concat(effects, ",")
    local target_effects = "-"
    if IsKindOf(args.target, "Unit") then
      target_effects = {}
      for i, effect in ipairs(args.target.StatusEffects) do
        target_effects[i] = effect.class
      end
      target_effects = table.concat(target_effects, ",")
    end
    NetUpdateHash("Unit:FirearmAttack", action_id, cost_ap, self, effects, args.target, target_effects)
  end
  local target = args.target
  self:CallReactions("OnFirearmAttackStart", self, target, CombatActions[action_id], args)
  if IsKindOf(target, "Unit") then
    target:CallReactions("OnFirearmAttackStart", self, target, CombatActions[action_id], args)
  end
  if args.replace_action then
    action_id = args.replace_action
  end
  if IsPoint(target) or IsValidTarget(target) then
    local action = CombatActions[action_id]
    if action.StealthAttack then
      args.stealth_kill_roll = 1 + self:Random(100)
    end
    args.prediction = false
    local units_waiting = {}
    self:PushDestructor(function()
      for _, unit in ipairs(units_waiting) do
        unit.waiting_attack = false
      end
    end)
    if not g_Combat and IsKindOf(target, "Unit") then
      units_waiting[1] = target
      PropagateAwareness(units_waiting)
      for _, unit in ipairs(units_waiting) do
        if unit:IsInterruptable() then
          unit.waiting_attack = true
          unit:InterruptCommand("WaitAttack")
        end
      end
      repeat
        local waiting = false
        for _, unit in ipairs(units_waiting) do
          waiting = waiting or unit.command == "WaitAttack" and not unit.waiting_attack
        end
        if waiting then
          Sleep(10)
        end
      until not waiting
    end
    local results, attack_args = action:GetActionResults(self, args)
	
	--print("args", args)
	print("########### new attack by:", attackerunitdatadef_id)
	print(results.chance_to_hit_modifiers)
	for k, v in ipairs(results.chance_to_hit_modifiers) do
		print(v.id, v.name, v.value)
	end
	print("total cth =", results.chance_to_hit)
	print("########### end attack")
	
	
	
    self:ExecFirearmAttacks(action, cost_ap, attack_args, results)
    self:PopAndCallDestructor()
  else
    self:GainAP(cost_ap)
    CombatActionInterruped(self)
  end
end]]