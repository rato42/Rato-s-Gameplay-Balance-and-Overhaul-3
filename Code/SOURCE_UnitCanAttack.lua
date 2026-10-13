local original_unit_can_attack = Unit.CanAttack

function Unit:CanAttack(target, weapon, action, aim, goto_pos, skip_ap_check, is_free_aim)
    if action and action.id == "Sprint" then
        return true
    end
    ---- also gates the target lists: CombatActionGetAttackableEnemies asks CanAttack per enemy
    if target and Rat_MGConeBound(action, self) and
        not CombatActionTargetFilters.MGBurstFire(target, {self}) then
        return false, AttackDisableReasons.OutOfRange
    end
    return original_unit_can_attack(self, target, weapon, action, aim, goto_pos, skip_ap_check,
                                    is_free_aim)
end
