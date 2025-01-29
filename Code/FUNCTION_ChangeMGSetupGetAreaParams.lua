local GBO_originalFirearmGetAreaAttackParams = Firearm.GetAreaAttackParams
---local mg_mul = 70

function Firearm:GetAreaAttackParams(action_id, attacker, target_pos, step_pos, stance)
    local params = GBO_originalFirearmGetAreaAttackParams(self, action_id, attacker, target_pos,
                                                          step_pos, stance)
    ----------
    if action_id == "MGSetup" or action_id == "MGRotate" then
        if params.cone_angle and params.cone_angle > 0 then
            params.cone_angle = MulDivRound(params.cone_angle, const.Combat.MGSetupConeMul, 100)
            params.cone_angle = params.cone_angle + const.Combat.MGSetupConeFlat
        end
    end
    ---------
    return params
end

-- function change_MGSetupAction_GetAimParams()
--     CombatActions.MGSetup.GetAimParams = function(self, unit, weapon)
--         local params = weapon:GetAreaAttackParams(self.id, unit)
--         ----------------
--         -- if params.cone_angle and params.cone_angle > 0 then
--         --     params.cone_angle = MulDivRound(params.cone_angle, const.Combat.MGSetupConeMul, 100)
--         -- end

--         ----
--         -- params.min_range = MulDivRound(self:GetMinAimRange(unit, weapon), mg_mul, 100)
--         -- params.max_range = MulDivRound(self:GetMaxAimRange(unit, weapon), mg_mul, 100)
--         ----
--         params.min_range = self:GetMinAimRange(unit, weapon)
--         params.max_range = self:GetMaxAimRange(unit, weapon)
--         assert(params.max_range >= params.min_range)
--         return params
--     end
-- end
