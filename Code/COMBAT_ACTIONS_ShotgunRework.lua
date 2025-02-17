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
        if not attack_args.prediction then
            results.fired = self:ResolveValue("bullets") or 2
        end
        return results, attack_args
    end

    CombatActions.DoubleBarrel.GetActionDamage = function(self, unit, target, args)
        local weapon = self:GetAttackWeapons(unit, args)
        local base = weapon and unit:GetBaseDamage(weapon) or 0
        local dmg, num_pellets, pellettext = GetPelletDamageText(unit, weapon, base, self.id)
        if not args then
            return T(pellettext)
        end
        return dmg, base, 0
        -- return MulDivRound(base, const.Weapons.ShotgunCollateralDamage *
        --                        const.Weapons.DoubleBarrelDamageBonus, 10000)
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

    CombatActions.Buckshot.GetActionDescription = function(self, units)
        local unit = units[1]
        -- local damage, _, _, params = self:GetActionDamage(unit)
        local damage = self:GetActionDamage(unit)
        local descr = T {self.Description}
        descr = CombatActionsAppendFreeAimDescription(self, unit, descr)
        return descr
    end
    CombatActions.Buckshot.GetActionDamage = function(self, unit, target, args)
        local weapon = self:GetAttackWeapons(unit, args)
        local base = weapon and unit:GetBaseDamage(weapon) or 0

        local dmg, num_pellets, pellettext = GetPelletDamageText(unit, weapon, base, self.id)
        if not args then
            return T(pellettext)
        end
        return dmg, base, 0
        -- return base, base, 0, {aoe_damage = aoeDamage}
    end

    CombatActions.BuckshotBurst.GetActionDamage = function(self, unit, target, args)
        local weapon = self:GetAttackWeapons(unit, args)
        if not weapon then
            return 0
        end
        local base = unit and unit:GetBaseDamage(weapon) or weapon.Damage
        -- local aoeDamage = MulDivRound(base, const.Weapons.ShotgunCollateralDamage, 100)
        local num_shots = weapon:GetAutofireShots(self)

        local dmg, num_pellets, pellettext = GetPelletDamageText(unit, weapon, base, self.id)
        if not args then
            return T(num_shots .. "X" .. pellettext)
        end
        return num_shots * dmg, dmg, 0
    end
end

function GetPelletDamageText(unit, weapon, base, action_id)
    local pellets = weapon and weapon:GetNumPellets(unit, action_id) or 0
    local totaldmg = base * pellets

    return totaldmg, pellets,
           totaldmg .. "<style CrosshairAPTotal><color PDABrowserTextHighlight>(" .. pellets .. "X" ..
               base .. ")</color></style>"
end

OnMsg.DataLoaded = GBO_ChangeShotgunCombatActions
