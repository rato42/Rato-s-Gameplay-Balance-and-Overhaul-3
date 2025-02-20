local GBO_OriginalUnitEnumUIActions = Unit.EnumUIActions

function Unit:EnumUIActions()
    local actions = GBO_OriginalUnitEnumUIActions(self)

    local main_weapon, _ = self:GetActiveWeapons()
    if g_Combat or (IsUnitPrimarySelectionCoOpAware(self) and not g_Overwatch[self]) then

        -- if main_weapon and IsSlugLoaded(main_weapon) then
        --     if table.find(actions, "BuckshotBurst") then
        --         table.remove_value(actions, "BuckshotBurst")
        --         table.insert_unique(actions, "BurstFire")
        --     end
        --     if table.find(actions, "Buckshot") then
        --         table.remove_value(actions, "Buckshot")
        --         table.insert_unique(actions, "SingleShot")
        --     end
        -- end

        if IsKindOf(main_weapon, "FirearmBase") and main_weapon:HasComponent("Enable_RunAndGun") then
            table.insert_unique(actions, "RunAndGun")
        end
    end

    return actions
end
