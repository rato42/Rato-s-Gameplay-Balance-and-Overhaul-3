--[[local GBO_originalFirearmGetAreaAttackParams = Firearm.GetAreaAttackParams
local mg_mul = 70

function Firearm:GetAreaAttackParams(action_id, attacker, target_pos, step_pos, stance)
    local params = GBO_originalFirearmGetAreaAttackParams(self, action_id, attacker, target_pos,
                                                          step_pos, stance)

    if action_id == "MGSetup" then
        params.max_range = MulDivRound(self:GetOverwatchConeParam("MaxRange"), mg_mul, 100)
        params.min_range = MulDivRound(self:GetOverwatchConeParam("MinRange"), mg_mul, 100)
    end
    return params
end

function change_MGSetupAction_GetAimParams()
    CombatActions.MGSetup.GetAimParams = function(self, unit, weapon)
        local params = weapon:GetAreaAttackParams(self.id, unit)
        ----
        params.min_range = MulDivRound(self:GetMinAimRange(unit, weapon), mg_mul, 100)
        params.max_range = MulDivRound(self:GetMaxAimRange(unit, weapon), mg_mul, 100)
        ----
        assert(params.max_range >= params.min_range)
        return params
    end
end]] 
