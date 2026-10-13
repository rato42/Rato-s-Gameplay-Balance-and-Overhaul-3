---- Prone only, like vanilla; off the ground a bipod costs snapshot and shooting angle instead.
function bipod_standing()
    Presets.ChanceToHitModifier.Default["Bipod"].CalcValue =
        function(self, attacker, target, body_part_def, action, weapon1, weapon2, lof, aim, opportunity_attack,
                 attacker_pos, target_pos)
            ---- aCTH: the braced bipod works on the cone (A.BipodProneFloorMul, AimDecayMuls.BipodProne)
            if not weapon1 or attacker.stance ~= "Prone" or IsACHTActive(weapon1, action, attacker) then
                return false, 0
            end
            local value = GetComponentEffectValue(weapon1, "AccuracyBonusProne", "bonus_cth")
            return not not value, value
        end
end

---- a bipod hanging off the front, not braced on the ground
function Rat_BipodUnbraced(unit, weapon)
    return unit and unit.stance ~= "Prone" and IsKindOf(weapon, "Firearm") and weapon:HasComponent("bipod_penalty") or false
end
