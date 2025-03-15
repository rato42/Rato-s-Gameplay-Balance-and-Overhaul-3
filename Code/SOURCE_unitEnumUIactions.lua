local GBO_OriginalUnitEnumUIActions = Unit.EnumUIActions

function Unit:EnumUIActions()
    local actions = GBO_OriginalUnitEnumUIActions(self)

    local main_weapon, _ = self:GetActiveWeapons()
    if g_Combat or (IsUnitPrimarySelectionCoOpAware(self) and not g_Overwatch[self]) then
        if IsKindOf(main_weapon, "FirearmBase") and main_weapon:HasComponent("Enable_RunAndGun") then
            table.insert_unique(actions, "RunAndGun")
        end
    end

    return actions
end
