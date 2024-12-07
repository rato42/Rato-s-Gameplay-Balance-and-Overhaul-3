function Unit:GetShootingStanceAP(target, weapon, aim, action, param)
    if not IsKindOf(weapon, "Firearm") then
        return 0
    end

    if not g_Combat or g_StartingCombat or g_TestingSaveLoadSystem then
        return 0
    end

    ---------------Already in Stance
    local stance = false
    if HasPerk(self, "ManningEmplacement") then
        stance = true
    elseif HasPerk(self, "StationedMachineGun") then
        stance = true
    elseif HasPerk(self, "shooting_stance") then
        stance = true
    end

    local ap_stance = GetWeapon_StanceAP(self, weapon)
    local ap_hipfire = 0

    if aim < 1 and not (target == self:GetLastAttack()) or not target then
        ap_hipfire = GetHipfire_StanceAP(self, weapon)
    end

    ------------Rotate
    local ap_rotate
    local param_angle

    if param == "get_enemies" then
        param_angle = "get_enemies"
    end

    if HasPerk(self, "shooting_stance") then
        ap_rotate = Clamp(ShootingConeAngle(self, weapon, target, param_angle) * const.Scale.AP, 0,
                          ap_stance + Get_AimCost(self))
    else
        ap_rotate = 0
    end

    if g_Overwatch[self] then
        local overwatch = g_Overwatch[self] or false

        if overwatch.permanent then
            ap_rotate = 0
        end
    end

    local ap_extra = ap_rotate

    if param == "rotate" then
        return ap_rotate
    end

    if param == "stance" then
        return ap_stance
    end

    ap_hipfire = ap_hipfire or 0
    if stance == true then
        return ap_extra
    elseif stance == false and aim < 1 then
        return ap_hipfire
    elseif stance == false and aim > 0 then
        return ap_stance
    end

end

