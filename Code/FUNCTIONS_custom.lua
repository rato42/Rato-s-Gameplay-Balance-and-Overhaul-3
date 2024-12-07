function GetPBbonus(weapon)

    local base = weapon.PBbonus_base + 2
    local value = 0
    local class = 0
    local modifyVal, compDef

    if IsKindOf(weapon, "SubmachineGun") then
        class = 3
    end
    if IsKindOfClasses(weapon, "Pistol", "Revolver") or weapon.pistol_swap then
        class = 3
    end
    if IsKindOf(weapon, "SniperRifle") then
        class = 0
    end

    if IsKindOf(weapon, "Shotgun") then
        class = 4
    end

    if IsKindOf(weapon, "AssaultRifle") then
        class = 2
    end

    if weapon.default_long_barrel then
        value = value - 5

    elseif IsKindOf(weapon, "Shotgun") then

        if weapon and weapon:HasComponent("shortbarrel") then
            value = value + 7
        elseif weapon and weapon:HasComponent("longbarrel") then
            value = value - 4
        end
    elseif IsKindOf(weapon, "SubmachineGun") then
        if weapon and weapon:HasComponent("shortbarrel") then
            value = value + 7
        elseif weapon and weapon:HasComponent("longbarrel") then
            value = value - 4
        end

    elseif IsKindOf(weapon, "Pistol") then
        if weapon and weapon:HasComponent("shortbarrel") then
            value = value + 5
        elseif weapon and weapon:HasComponent("longbarrel") then
            value = value - 3
        end

    elseif IsKindOf(weapon, "Revolver") then
        if weapon and weapon:HasComponent("shortbarrel") then
            value = value + 6
        elseif weapon and weapon:HasComponent("longbarrel") then
            value = value - 3
        end
    else
        if weapon and weapon:HasComponent("shortbarrel") then
            value = value + 6
        elseif weapon and weapon:HasComponent("longbarrel") then
            value = value - 6
        end
    end

    if weapon and weapon:HasComponent("tac_grip_PB") then
        value = value + 4
    end

    if weapon and weapon:HasComponent("vigneron_folded_PB") then
        value = value + 1
    end

    if weapon and weapon:HasComponent("bullpup") then
        value = value + 5
    end

    if weapon and weapon:HasComponent("handguard_ext") then
        modifyVal = GetComponentEffectValue(weapon, "handguard_ext", "pb_bonus_hg")
        value = value + (modifyVal or 0)
    elseif weapon and weapon:HasComponent("handguard_short") then
        modifyVal = GetComponentEffectValue(weapon, "handguard_short", "pb_bonus_hg")
        value = value + (modifyVal or 0)
    end

    value = value + base + class
    return value
end

function ScaleAtribute(at, max_pen, min_pen, max_at, min_at)

    local min_at = min_at or 0
    local max_at = max_at or 100

    local old_range = max_at - min_at
    local new_range = max_pen - min_pen

    local scaled_value = (((at - max_at) * new_range) / old_range) + min_pen

    return scaled_value
end

function Is_AimingAttack()

    local dlg = GetInGameInterfaceModeDlg()

    if IsKindOf(dlg, "IModeCombatAttackBase") then
        return true
    elseif IsKindOf(dlg, "IModeCombatAreaAim") then
        return true
    elseif IsKindOf(dlg, "IModeCombatAttack") then
        return true
    else
        return false
    end
end

function Get_AimCost(unit) --------------add self, check if indoors
    local aim_cost = const.Scale.AP
    local indoors = unit and unit.indoors
    if GameState.RainHeavy and not indoors then
        aim_cost = MulDivRound(aim_cost, 100 + const.EnvEffects.RainAimingMultiplier, 100)
    end
    return aim_cost
end

function Composure_RollSkillCheck(unit, modifier, add)
    modifier = modifier or 100
    add = add or 0
    local skill = rGetComposure(unit)
    -- print(skill)
    local roll = 1 + unit:Random(100)
    local adjustRoll = GameDifficulties[Game.game_difficulty]:ResolveValue("rollSkillCheckBonus") or
                           0
    roll = roll + adjustRoll
    roll = Min(roll, 95)
    local value = MulDivRound(skill, modifier, 100) + add
    -- print(value)
    local pass = roll < value or CheatEnabled("SkillCheck")
    local t_res = pass and Untranslated("<em>Pass</em>") or Untranslated("<em>Fail</em>")
    -- local meta = "Composure"--unit:GetPropertyMetadata(skill)

    local t_skill = "Composure"
    if modifier ~= 100 then
        if 0 < add then
            t_skill = T({
                816405633181,
                "<percent(n1)> <skill>+<n2>",
                n1 = modifier,
                n2 = add,
                skill = "Composure"
            })
        elseif add < 0 then
            t_skill = T({
                656059859333,
                "<percent(n1)> <skill><n2>",
                n1 = modifier,
                n2 = add,
                skill = "Composure"
            })
        else
            t_skill = T({
                570928040607,
                "<percent(number)> <skill>",
                number = modifier,
                skill = "Composure"
            })
        end
    elseif 0 < add then
        t_skill = T({481345361355, "<skill>+<number>", number = add, skill = "Composure"})
    elseif add < 0 then
        t_skill = T({945399039468, "<skill><number>", number = add, skill = "Composure"})
    end
    CombatLog("debug", T({
        Untranslated("<em><name><em> Skill check (Composure) <roll>/<target>: <result>"),
        name = unit:GetLogName(),
        skill = t_skill,
        roll = roll,
        target = value,
        result = t_res
    }))
    return pass
end

function R_tableContains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function rat_shotgun_dmg_scale(attacker, target) ---not used
    local target = target
    local target_pos = target or target:GetPos()
    local attacker_pos = attacker:GetPos()

    local dist = attacker_pos:Dist(target_pos)
    print("dist", dist / 1200)

    local max_distance = 20.0 * const.SlabSizeX
    ---------------

    local min_angle = 2.0 * 60
    local max_angle = 16.0 * 60
    local weapon = attacker:GetActiveWeapons()
    local buck_angle = weapon.BuckshotConeAngle * 1.0 -- or 10*60
    print("angle", buck_angle)
    local angle_factor = ((buck_angle - min_angle) / (max_angle - min_angle)) + 0.2

    print("angle_factor", angle_factor)

    --------------
    local ratio = dist * 1.0 * angle_factor / max_distance

    print("ratio", ratio)

    local max_value = 120.0
    local min_value = 50.0

    local scaled_value = max_value - (max_value - min_value) * (ratio)
    scaled_value = (scaled_value > max_value) and max_value or scaled_value
    scaled_value = (scaled_value < min_value) and min_value or scaled_value

    scaled_value = scaled_value / 100
    print("sc", scaled_value)

    -- local angle_factor = ((buck_angle - min_angle) / (max_angle - min_angle)) +0.2
    -- print("buck_angle", angle_factor)

    -- scaled_value = (-45 +(scaled_value * angle_factor*2.5))/100
    print("final scale", scaled_value)
    return scaled_value
end

function rat_getMobileshot_moveAP(action, unit, weapon)

    local base_ap = 9
    local min_ap = 6
    local weapon_multiplier = (action and action.id == "Sprint") and 1.0 or 1.5

    local stanceap = 0
    if weapon and IsKindOf(weapon, "Firearm") then

        stanceap = (GetWeapon_StanceAP(unit, weapon) / const.Scale.AP) * weapon_multiplier

        if weapon.LargeItem < 1 or weapon:HasComponent("no_stock") then
            stanceap = Max(0, stanceap - 1)
        end

        if not (IsKindOf(weapon, "SubmachineGun") or IsKindOf(weapon, "Pistol") or
            IsKindOf(weapon, "Revolver")) then
            stanceap = stanceap + 2
        end
    end

    local agility_scaling = Max(0, (unit.Agility - 40.0) / 10.0)
    local move_ap = Max(min_ap, cRound(base_ap * 1.00 + agility_scaling - (stanceap)))

    return move_ap
end

function rat_close_range()
    return ((const.Weapons.PointBlankRange * 2) + (1)) * const.SlabSizeX
end

function GetWeapon_StanceAP(unit, weapon, display)

    if not weapon then
        return 0
    end

    local cost = weapon.APStance
    cost = Cumbersome_StanceAP(unit, weapon, cost)

    local modifyVal, compDef = GetComponentEffectValue(weapon, "stance_ap_inc_STR",
                                                       "StanceIncreaseSTR")

    local str_min = 0
    if modifyVal then
        str_min = GetComponentEffectValue(weapon, "stance_ap_inc_STR", "STR_threshold")
        if not unit or unit.Strength < str_min then
            cost = cost + modifyVal
        end
    end

    if display then
        return cost
    end

    if R_IsAI(unit) then
        cost = MulDivRound(cost, const.Combat.AI_ShootingStanceAP_Mul or 100, 100)
    end

    return cost * const.Scale.AP
end

function Cumbersome_StanceAP(unit, weapon, cost)
    if weapon:IsCumbersome() then
        cost = cost + 1
        if unit and unit.Strength >= const.Combat.CumbersomeStanceAP_StrThreshold then
            cost = Max(1, cost - 1)
        end
    end
    return cost
end

function GetHipfire_StanceAP(unit, weapon) ---- not used

    --[[local ap_hipfire = 1 -------------hipfire
    ap_hipfire = Cumbersome_StanceAP(unit, weapon, ap_hipfire)

    if R_IsAI(unit) then
        ap_hipfire = MulDivRound(ap_hipfire, const.Combat.AI_ShootingStanceAP_Mul or 100, 100)
    end]]

    return 0 -- ap_hipfire * const.Scale.AP
end

function rat_MobileAction_AP(action, unit)

    if not unit then
        return 0, 0
    end

    if not action then
        return 0, 0
    end

    local weapon = action:GetAttackWeapons(unit)
    local att_cost = unit:GetAttackAPCost(action, weapon, nil, 0) -- CombatActions.BurstFire.GetAPCost(self, unit, args)
    local ap_delta = rat_getDeltaAP(action, weapon)
    local cost = att_cost + ap_delta

    if rat_canBolt(weapon) then
        local unbolted_shots = 3
        local cycling_ap = rat_get_manual_cyclingAP(unit, weapon, true)
        if not weapon.unbolted then
            unbolted_shots = unbolted_shots - 1
        end

        cycling_ap = cRound(cycling_ap * unbolted_shots * const.Scale.AP * 0.5)
        if cycling_ap and cycling_ap > 0 then
            cost = cost + cycling_ap
        end
    end

    local ap_extra = GetWeapon_StanceAP(unit, weapon) + Get_AimCost(unit) -- mobile_stance_ap(unit, weapon)
    local cost_aimed = cost + ap_extra

    return cost, cost_aimed
end

function IsAimed_Mobile(self, unit, ap)

    -- local args = false
    -- local weapon = self:GetAttackWeapons(unit)
    -- local burst_cost = unit:GetAttackAPCost(self, weapon, nil, args and args.aim or 0)--CombatActions.BurstFire.GetAPCost(self, unit, args)
    -- local ap_extra = mobile_stance_ap(unit, weapon) 
    -- local ap_delta = rat_getDeltaAP(self, weapon)
    -- local aimed_cost = burst_cost + ap_delta + ap_extra

    local cost, aimed_cost = rat_MobileAction_AP(self, unit)

    if ap < aimed_cost then
        return false
    end
    return true
end

function hand_eye_crit(action_id, weapon, attacker, aim)
    if not action_id then
        return 0
    end

    local single_factor = 3.0
    local not_single = 1.0
    local burst_factor = not_single

    if IsKindOf(weapon, "SniperRifle") then
        single_factor = 5.0
    end

    if IsKindOf(weapon, "G36") then
        burst_factor = 2.5
    end

    local hand_eye = rGetHandEyeCoordination(attacker)

    local factor = not_single

    if action_id == "SingleShot" or action_id == "PinDown" then
        factor = single_factor
    elseif action_id == "BurstFire" then
        factor = burst_factor
    end

    local hec_factor = hand_eye * factor
    local crit_HEC = cRound(hec_factor / 100 * (0 + (aim or 0)))

    -- print("crit_hec", crit_HEC)

    return crit_HEC
end

function FindXtByProp(obj, prop, prop_value) ---------------------- made by Audakira
    if obj and obj[prop] and obj[prop] == prop_value then
        local res = {}
        table.insert(res, obj)
        return res
    end
    for _, xt in ipairs(obj) do
        local res = FindXtByProp(xt, prop, prop_value)
        if res then
            table.insert(res, obj)
            return res
        end
    end
end

function rat_getDeltaAP(action, weapon, action_id_override)
    local base = 0
    local action_id = ''

    if action_id_override then
        base = CombatActions[action_id_override].ActionPointDelta
        action_id = action_id_override
    elseif action then
        base = action.ActionPointDelta
        action_id = action.id
    end

    if action_id == "MobileShot" then
        action_id = "SingleShot"
    end

    if action_id == "SingleShot" then
        if IsKindOfClasses(weapon, "SubmachineGun") then
            base = base + 1000
        end
        if IsKindOf(weapon, "Glock18") or IsKindOf(weapon, "B93R_1") or IsKindOf(weapon, "G36") or
            IsKindOf(weapon, "B93RR_1") then
            base = base + 1000
        end
        if IsKindOf(weapon, "AN94_1") then
            base = base + 2000
        end
    elseif action_id == "AutoFire" then
        if IsKindOf(weapon, "AN94_1") then
            base = base + 1000
        elseif IsKindOf(weapon, "Glock18") then
            base = base + 1000
        elseif IsKindOf(weapon, "G36") then
            base = base + 1000
        end
    end

    return base
end

function IsMod_loaded(mod_id)
    local mod_check = table.find(ModsLoaded, 'id', mod_id) or nil -- Replace "Mod_Id" with exact case sensitive modID you're testing for.

    if mod_check then
        return true
    end
    return false
end

function rat_get_mechanism()
    return {
        "Revolver", "Blowback", "Single_Shot", "Striker_Fired", "Short_Recoil", "Gas_Operated",
        "Recoil_Operated", "Roller_Delayed", "Break_Action", "Pump_Action", "Bolt_Action",
        "Lever_Action", ""
    }
end

function GetRecoil_mul(self)
    local weapon = self

    local attacker = false

    if self.owner then
        attacker = not gv_SatelliteView and g_Units[self.owner] or gv_UnitData[self.owner]
    else
        attacker = {}
        attacker.placeholder = true
        attacker.Marksmanship = 100
        attacker.Strength = 100 -- Recoil_StrBreakpoint(self)
    end

    local display = true
    local recoil = GetWepRecoil(weapon, attacker, display)

    local other = 1.0
    local caliber = 1.0
    if attacker then
        other = GetRecoilOther(weapon, attacker, false)
        caliber = GetCaliberStrRecoil(weapon, attacker)
    end

    recoil = recoil * other * caliber

    return string.format("%.2f", recoil)
end

function GetHipfire_mul(self)
    local weapon = self

    local attacker = false
    local action = false
    local aim = 0
    local display = true
    local hip = GetHipfirePenal(weapon, attacker, action, display, aim)
    return string.format("%.2f", hip)
end

function GetSnapshot_mul(self)
    local weapon = self

    local attacker = false
    local action = false
    local aim = 1
    local display = true
    local hip = GetHipfirePenal(weapon, attacker, action, display, aim)
    return string.format("%.2f", hip)
end

function Getangle_display(self)

    local angle = self:GetProperty("OverwatchAngle") / 60.0
    return string.format("%.2f", angle)
end

function GetPBbonus_display(self)
    local weapon = self
    local value = GetPBbonus(weapon)

    return value
end

function GetSTR_RECOIL(self)
    local weapon1 = self

    local str = Recoil_StrBreakpoint(weapon1)

    return str
end

function GetAPStance_display(self)
    local ap = self.APStance

    local unit = g_Units[self.owner] or gv_UnitData[self.owner]

    if unit then
        ap = Cumbersome_StanceAP(unit, self, ap)
    elseif self:IsCumbersome() then
        ap = ap + 1
    end

    return ap

end

