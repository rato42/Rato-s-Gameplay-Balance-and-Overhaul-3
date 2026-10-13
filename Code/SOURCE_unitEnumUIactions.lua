local GBO_OriginalUnitEnumUIActions = Unit.EnumUIActions

function Unit:EnumUIActions()
    local actions = GBO_OriginalUnitEnumUIActions(self)
    ---- nil: the original decided to swap weapons
    if not actions then
        return actions
    end

    local main_weapon, _ = self:GetActiveWeapons()
    if g_Combat or (IsUnitPrimarySelectionCoOpAware(self) and not g_Overwatch[self]) then
        if IsKindOf(main_weapon, "FirearmBase") and main_weapon:HasComponent("Enable_RunAndGun") then
            table.insert_unique(actions, "RunAndGun")
        end
        ---- vanilla lists only MGSetup for an unset MG; its fire modes go in too
        if IsKindOf(main_weapon, "MachineGun") then
            for _, id in ipairs(main_weapon.AvailableAttacks or empty_table) do
                table.insert_unique(actions, id)
            end
        end
    end

    return actions
end
