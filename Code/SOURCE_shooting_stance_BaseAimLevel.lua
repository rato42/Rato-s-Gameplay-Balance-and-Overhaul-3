-----Unit.lua
local original_UnitGetBaseAimLevelRange = Unit.GetBaseAimLevelRange
function Unit:GetBaseAimLevelRange(action, target)
    local min, max = original_UnitGetBaseAimLevelRange(self, action, target)
    if action and action.IsAimableAttack then
        local actionWep = action:GetAttackWeapons(self)
        if IsKindOf(actionWep, "Firearm") then
            local singleMaxActions = {"DualShot", "AutoFire", "GrizzlyPerk"}

            if table.find(singleMaxActions, action.id) then
                max = 1
            end

            if self.Mobile_aimed then
                min = 1
            end
        end
    end
    return min, max
end

