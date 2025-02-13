function GBO_ChangeShotgunCombatActions()
    CombatActions.DoubleBarrel.GetActionResults = function(self, unit, args)
        local args = table.copy(args)

        -- if not args.target_spot_group then
        -- 	args.num_shots = 0
        -- end
        args.aoe_action_id = self.id
        args.fx_action = "WeaponBuckshot"
        args.aoe_fx_action = "WeaponBuckshot"
        args.single_fx = true
        args.aoe_damage_type = "percent"
        args.aoe_damage_value = const.Weapons.ShotgunCollateralDamage
        args.buckshot_scatter_fx = 10
        local attack_args = unit:PrepareAttackArgs(self.id, args)
        local results = attack_args.weapon:GetAttackResults(self, attack_args)
        return results, attack_args
    end

    CombatActions.DoubleBarrel.GetActionDamage = function(self, unit, target, args)
        local weapon = self:GetAttackWeapons(unit, args)
        local base = weapon and unit:GetBaseDamage(weapon) or 0
        return MulDivRound(base, const.Weapons.ShotgunCollateralDamage *
                               const.Weapons.DoubleBarrelDamageBonus, 10000)
    end

    CombatActions.Buckshot.GetActionResults = function(self, unit, args)
        local args = table.copy(args)
        -- if not args.target_spot_group then
        -- 	args.num_shots = 0
        -- end
        args.aoe_action_id = self.id
        args.fx_action = "WeaponBuckshot"
        args.aoe_fx_action = "WeaponBuckshot"
        args.single_fx = true
        args.aoe_damage_type = "percent"
        args.aoe_damage_value = const.Weapons.ShotgunCollateralDamage
        args.buckshot_scatter_fx = 10
        local attack_args = unit:PrepareAttackArgs(self.id, args)
        local results = attack_args.weapon:GetAttackResults(self, attack_args)
        return results, attack_args
    end

    CombatActions.Buckshot.GetActionDamage = function(self, unit, target, args)
        local weapon = self:GetAttackWeapons(unit, args)
        local base = weapon and unit:GetBaseDamage(weapon) or 0
        local aoeDamage = MulDivRound(base, const.Weapons.ShotgunCollateralDamage, 100)

        return base, base, 0, {aoe_damage = aoeDamage}
    end

    CombatActions.BuckshotBurst.GetActionDamage = function(self, unit, target, args)
        local weapon = self:GetAttackWeapons(unit, args)
        if not weapon then
            return 0
        end
        local base = unit and unit:GetBaseDamage(weapon) or weapon.Damage
        local aoeDamage = MulDivRound(base, const.Weapons.ShotgunCollateralDamage, 100)

        local num_shots = weapon:GetAutofireShots(self)
        local damage = num_shots * base
        return damage, base, damage - base, {aoe_damage = aoeDamage}
    end
end

OnMsg.DataLoaded = GBO_ChangeShotgunCombatActions
