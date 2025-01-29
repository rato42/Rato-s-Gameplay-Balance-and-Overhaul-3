function rat_format_hints(self)
    local formattedString = "<style CrosshairAPTotal>"

    local function GetRecoil_mul(self)

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

    local function GetHipfire_mul(self) -- ok
        local weapon = self

        local attacker = false
        local action = false
        local aim = 0
        local display = true
        local hip = GetWeaponHipfireOrSnapshotMul(weapon, attacker, action, display, aim)
        return string.format("%.2f", hip)
    end

    local function GetSnapshot_mul(self) ---ok

        local weapon = self

        local attacker = false
        local action = false
        local aim = 1
        local display = true
        local hip = GetWeaponHipfireOrSnapshotMul(weapon, attacker, action, display, aim)
        return string.format("%.2f", hip)
    end

    local function Getangle_display(self)
        -- return 0
        local angle = self:GetProperty("OverwatchAngle") / 60.0
        return string.format("%.2f", angle)
    end

    local function GetPBbonus_display(self)
        -- return 0

        local weapon = self
        local value = GetPBbonus(weapon)

        return value
    end

    local function GetSTR_RECOIL(self)

        local weapon1 = self

        local str = Recoil_StrBreakpoint(weapon1)

        return str
    end

    local function GetAPStance_display(self)
        -- return 0
        -- local ap = self.APStance

        local unit = g_Units[self.owner] or gv_UnitData[self.owner]

        local ap = GetWeapon_StanceAP(unit, self, true)
        local aim_cost = MulDivRound(Get_AimCost(unit), 1, const.Scale.AP)
        -- if unit then
        -- ap = Cumbersome_StanceAP(unit, self, ap)
        -- elseif self:IsCumbersome() then
        -- ap = ap +1
        -- end

        return ap + aim_cost

    end

    local termList = {
        {
            TranslationTable[242435461626] or "Shooting Stance Cost: ",
            GetAPStance_display(self) or 0, " AP"
        },
        {TranslationTable[766379566745] or "Shooting Angle: ", Getangle_display(self) or 0, "º"},
        {TranslationTable[412593832155] or "Reliability: ", self.Reliability, "%"},
        {TranslationTable[654134899415] or "Noise Radius: ", self.Noise, " tiles"},
        {TranslationTable[684546854913] or "Base critical chance: ", self.CritChance, "%"},
        {TranslationTable[507781478006] or "Maximum critical scaling: ", self.CritChanceScaled, "%"},
        {TranslationTable[247182652462] or "Extra critical damage: ", self.CritDamage, "%"}, {
            TranslationTable[651371401489] or "Point Blank Range Accuracy: ",
            GetPBbonus_display(self) or 0, "%"
        },
        {
            TranslationTable[852084205321] or "Hipfire Penalty Multiplier: ",
            GetHipfire_mul(self) or 0, "X"
        }, {
            TranslationTable[258395588915] or "Snapshot Penalty Multiplier: ",
            GetSnapshot_mul(self) or 0, "X"
        }, {
            (self.owner and (TranslationTable[151451884832] or "Recoil Penalty Multiplier: ")) or
                (TranslationTable[896979362710] or "Minimum Recoil Multiplier: "),
            GetRecoil_mul(self) or 0, "X"
        }, {
            TranslationTable[158466723759] or "Recommended Strength: ", GetSTR_RECOIL(self),
            (TranslationTable[785975283217]) or " STR"
        }
    }

    for _, term in ipairs(termList) do
        formattedString = formattedString .. "<color PDABrowserFlavorMedium>" .. term[1] ..
                              "</color>" .. "<color PDABrowserTextHighlight>" .. term[2] ..
                              "</color>" .. term[3] .. "\n"
    end

    formattedString = formattedString .. "</style>"

    if self:IsCumbersome() then
        formattedString = formattedString .. (TranslationTable[153781665575] or
                              "\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Cumbersome (no Free Move)\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increases Stance AP cost by 1 (negated by high Strength)\n")
    end

    -- print(formattedString)

    return T {formattedString}
end

local t_id_table = {
    [153781665575] = "\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Cumbersome (no Free Move)\n<image UI/Conversation/T_Dialogue_IconBackgroundCircle.tga 400 130 128 120> Increases Stance AP cost by 1 (negated by high Strength)\n",
    [242435461626] = "Shooting Stance Cost: ",
    [766379566745] = "Shooting Angle: ",
    [412593832155] = "Reliability: ",
    [654134899415] = "Noise Radius: ",
    [684546854913] = "Base critical chance: ",
    [507781478006] = "Maximum critical scaling: ",
    [247182652462] = "Extra critical damage: ",
    [651371401489] = "Point Blank Range Accuracy: ",
    [852084205321] = "Hipfire Penalty Multiplier: ",
    [258395588915] = "Snapshot Penalty Multiplier: ",
    [151451884832] = "Recoil Penalty Multiplier: ",
    [896979362710] = "Minimum Recoil Multiplier: ",
    [158466723759] = "Recommended Strength: ",
    [785975283217] = " STR"
}

ratG_T_table['DESCRIPTION_HINTS_get.lua'] = t_id_table

