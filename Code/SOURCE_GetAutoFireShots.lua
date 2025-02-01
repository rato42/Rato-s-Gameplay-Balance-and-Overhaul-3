function FirearmBase:GetAutofireShots(action)
    if type(action) == "string" then
        action = CombatActions[action]
    end
    local shots = action:ResolveValue("num_shots") or 1
    --------------------------------

    if action.id == "BurstFire" or action.id == "RunAndGun" or action.id == "RecklessAssault" or
        action.id == "BuckshotBurst" then
        shots = self.burst_shots or 3
    elseif action.id == "AutoFire" then
        shots = self.auto_shots or 10
    elseif action.id == "MGBurstFire" or action.id == "GrizzlyPerk" then
        shots = self.long_shots or 6
    end

    -----------
    local shotsBoost = GetComponentEffectValue(self, "ExtraBurstShots", action.id)

    if shotsBoost then
        shots = shots + shotsBoost
    end

    return shots
end

----ok

