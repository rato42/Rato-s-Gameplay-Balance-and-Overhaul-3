-----Unit.lua
function Unit:GetBaseAimLevelRange(action, target)
    if not action.IsAimableAttack then
        return 0, 0
    end
    local actionWep = action:GetAttackWeapons(self)
    local min, max = 0, 0
    if IsKindOfClasses(actionWep, "Firearm", "MeleeWeapon") then
        max = actionWep.MaxAimActions
    end
    if 0 < max then
        max = self:CallReactions_Modify("OnCalcMaxAimActions", max, self,
                                        target, action, actionWep)
        if IsKindOf(target, "Unit") then
            max = target:CallReactions_Modify("OnCalcMaxAimActions", max, self,
                                              target, action, actionWep)
        end
        min = self:CallReactions_Modify("OnCalcMinAimActions", min, self,
                                        target, action, actionWep)
        if IsKindOf(target, "Unit") then
            min = target:CallReactions_Modify("OnCalcMinAimActions", min, self,
                                              target, action, actionWep)
        end
        max = Max(max, min)
        if IsKindOf(actionWep, "Firearm") then
            --------------------------------------------------------------
            if action.id == "DualShot" then
                max = 1
            end
            if action.id == "AutoFire" then
                max = 1
            end
            if action.id == "GrizzlyPerk" then
                max = 1
            end

            if self.Mobile_aimed then
                min = 1
            end
            -----
        end
    end

    return min, max
end

---ok
