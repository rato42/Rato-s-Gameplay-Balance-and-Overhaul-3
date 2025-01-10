function AnimChangeHook:SetState(anim, flags, crossfade, ...)
    local old_anim = self:GetStateText()
    ---------
    if self.species == "Human" then
        if self:HasStatusEffect("shooting_stance") then
            if anim == old_anim then
                return
            end
        end
    end
    ---------

    if IsValid(self) and self:IsAnimEnd() then
        self:OnAnimMoment("end")
    end
    Object.SetState(self, anim, flags, crossfade, ...)
    self:AnimationChanged(1, old_anim, flags, crossfade)
    ------------------------------------------------

    if self.species == "Human" then
        if self:HasStatusEffect("shooting_stance") then

            ----

            local stance = self.stance
            local aim_state = self:GetAimAnim(stance)
            -- local fire = string.match(anim, "Fire")
            -- local turn = string.match(anim, "Turn")
            local idle = string.match(anim, "Idle")
            local down = string.match(anim, "Downed")
            local climb = string.match(anim, "Climb")

            if not idle then
                return
            end

            local new_anim = self:GetStateText()

            if IsValid(self) and self:IsAnimEnd() then
                self:OnAnimMoment("end")
            end

            local stance_effect = self:GetStatusEffect("shooting_stance")
            local aim_pos = stance_effect and stance_effect:ResolveValue("aim_pos")

            if aim_pos and stance == "Prone" then
                local unit_pos = self:GetPos()
                local angle = CalcOrientation(unit_pos, aim_pos)
                self:AnimatedRotation(angle)
            end

            --[[local aim_pos = self.aim_pos_stance or false
            if aim_pos and stance == "Prone" then
                local self_pos = self:GetPos()
                local self_angle = self:GetOrientationAngle() -- self:GetAngle()
                local angle = CalcOrientation(self_pos, aim_pos)

                if not (angle == self_angle) then
                    self:AnimatedRotation(angle)
                end
            end]]

            if new_anim ~= aim_state then
                local aim_pos = self.aim_pos_stance
                self.aim_pos_stance = nil
                self:SetState(aim_state, const.eKeepComponentTargets)
                -- if aim_pos then
                -- print("aim ik")
                -- self:SetIK("AimIK", aim_pos, nil, nil, 0)
                -- end
            end
        end
    end
end

