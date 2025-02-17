-- local GBOoriginalFirearmGetImpactForce = Firearm.GetImpactForce
-- function Firearm:GetImpactForce()
--     local impact_force = GBOoriginalFirearmGetImpactForce(self) or 0
--     if IsKindOf(self, "Shotgun") and self.NumPellets < 1 then
--         impact_force = impact_force + 2
--     end
-- end
function Firearm:GetImpactForce()
    local impact_force = self.ImpactForce
    if self.ammo then
        local ammo_impact_force = table.get(Presets, "Caliber", "Default", self.ammo.Caliber,
                                            "ImpactForce")
        assert(ammo_impact_force)
        impact_force = impact_force + (ammo_impact_force or 0)
    end

    ---
    if IsKindOf(self, "Shotgun") and self.NumPellets < 1 then
        impact_force = impact_force + 3
    end
    ---
    return impact_force
end
