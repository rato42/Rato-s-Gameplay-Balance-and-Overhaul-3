local original_unit_can_attack = Unit.CanAttack

function Unit:CanAttack(target, weapon, action, aim, goto_pos, skip_ap_check, is_free_aim)
    if action and action.id == "Sprint" then
        return true
    end
    return original_unit_can_attack(self, target, weapon, action, aim, goto_pos, skip_ap_check,
                                    is_free_aim)
end
