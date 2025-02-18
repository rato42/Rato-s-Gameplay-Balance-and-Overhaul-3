function Unit:CalcStealthKillChance(weapon, target, target_spot_group, aim)
    if not (IsValidTarget(target) and IsKindOf(target, "Unit")) or not weapon then
        return 0
    end
    local chance = Max(0, self.Dexterity - target.Wisdom)
    local min_chance = 1
    if target_spot_group == "Head" or target_spot_group == "Neck" then
        chance = chance + const.Combat.HeadshotStealthKillChanceMod
    end
    chance = self:CallReactions_Modify("OnCalcStealthKillChance", chance, self, target, weapon,
                                       target_spot_group, aim)
    chance = target:CallReactions_Modify("OnCalcStealthKillChance", chance, self, target, weapon,
                                         target_spot_group, aim)
    min_chance = self:CallReactions_Modify("OnCalcStealthKillMinChance", min_chance, self, target,
                                           weapon, target_spot_group, aim)
    min_chance = target:CallReactions_Modify("OnCalcStealthKillMinChance", min_chance, self, target,
                                             weapon, target_spot_group, aim)
    local stealthKillBonus = GetComponentEffectValue(weapon, "StealthKillBonusPerAim",
                                                     "stealth_kill_bonus")
    if stealthKillBonus then
        chance = chance + (aim or 0) * (stealthKillBonus or 0)
    end
    if target:IsAware() then
        ----------------------
        chance = MulDivRound(chance, 20, 100)
        min_chance = MulDivRound(min_chance, 50, 100)
        ------------
    elseif target:HasStatusEffect("Surprised") or target:HasStatusEffect("Suspicious") then
        chance = MulDivRound(chance, Max(0, 100 +
                                             CharacterEffectDefs.Surprised:ResolveValue(
                                                 "stealthkill_modifier")), 100)
    end
    if CheatEnabled("SkillCheck") then
        chance = 100
    end
    local weapon_pen_class = weapon:HasMember("PenetrationClass") and weapon.PenetrationClass or 1
    local armor_class = 0
    target:ForEachItem("Armor", function(item, slot)
        if slot ~= "Inventory" and item.ProtectedBodyParts and
            item.ProtectedBodyParts[target_spot_group] then
            armor_class = Max(armor_class, item.PenetrationClass)
        end
    end)
    if weapon_pen_class < armor_class and 0 < chance then
        chance = chance / 2
    end
    chance = Clamp(chance, min_chance, 100)
    --
    -- print("stealth_kill chance", chance)
    --
    return chance
end

-- ok
