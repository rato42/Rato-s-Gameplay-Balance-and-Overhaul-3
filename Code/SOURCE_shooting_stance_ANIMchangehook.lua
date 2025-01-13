function AnimChangeHook:SetState(anim, flags, crossfade, ...)
    local old_anim = self:GetStateText()
    ---------
    local shooting_stance
    if self.species == "Human" then
        shooting_stance = self:GetStatusEffect("shooting_stance")
        if shooting_stance then
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

    if shooting_stance then
        local idle = string.match(anim, "Idle")
        if not idle then
            return
        end

        local stance = self.stance
        local aim_state = self:GetAimAnim(stance)
        local new_anim = self:GetStateText()

        if IsValid(self) and self:IsAnimEnd() then
            self:OnAnimMoment("end")
        end

        self:Reorient_ShootingStance(shooting_stance)

        if new_anim ~= aim_state then
            local aim_pos = self.aim_pos_stance
            self.aim_pos_stance = nil
            self:SetState(aim_state, const.eKeepComponentTargets)
        end
    end
end
