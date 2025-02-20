-- local GBO_OriginalFirearmGetBaseAttack = Firearm.GetBaseAttack
-- function Firearm:GetBaseAttack(unit, force)
--     local id = GBO_OriginalFirearmGetBaseAttack(self, unit, force)
--     if IsSlugLoaded(self) then
--         id = id or ""
--         id = id == "BuckshotBurst" and "BurstFire" or id == "Buckshot" and "SingleShot" or id
--     end
--     return id
-- end
-- local _is_attack_available_units = {}
-- local GBO_OriginalUnitGetDefaultAttackAction = Unit.GetDefaultAttackAction
-- function Unit:GetDefaultAttackAction(force_ranged, force_ungrouped, weapon, sync, ignore_stealth,
--                                      args, ui)
--     -- _is_attack_available_units[1] = self
--     local action = GBO_OriginalUnitGetDefaultAttackAction(self, force_ranged, force_ungrouped,
--                                                           weapon, sync, ignore_stealth, args, ui)
--     local isSlugLoaded = weapon and IsSlugLoaded(weapon)
--     -- if action and isSlugLoaded then
--     --     if action.id == "BuckshotBurst" then
--     --         return CombatActions["BurstFire"]
--     --     end
--     --     return CombatActions["SingleShot"]
--     -- end
--     ic(action.id)
--     return action
-- end
local GBO_Original_CombatActionGenericAttackGetUIState = CombatActionGenericAttackGetUIState

local shotgun_attacks = {"Buckshot", "BuckshotBurst", "CancelShotCone"}
local slug_attacks = {"SingleShot", "BurstFire", "CancelShot"}

function CombatActionGenericAttackGetUIState(self, units, args)
    local unit = units and units[1]
    local weapon = self:GetAttackWeapons(unit, args) or unit and unit:GetActiveWeapons()
    if weapon and IsKindOf(weapon, "Shotgun") then
        local isSlugLoaded = IsSlugLoaded(weapon)
        if table.find(shotgun_attacks, (self and self.id) or "") and isSlugLoaded then
            return "hidden"
        end

        if table.find(slug_attacks, (self and self.id) or "") and not isSlugLoaded then
            return "hidden"
        end
    end

    return GBO_Original_CombatActionGenericAttackGetUIState(self, units, args)
end
