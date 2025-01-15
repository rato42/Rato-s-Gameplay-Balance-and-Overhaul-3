function presets_char_effect()
    local bonus = 5
    local autobonus = 100

    ForEachPreset('CharacterEffectCompositeDef', function(p)

        if p.id == "HawksEye" then
            p.Description = T(984561732232, --[[CharacterEffectCompositeDef HawksEye Description]]
                              "<GameTerm('PinDown')> applies <GameTerm('Exposed')> to the target.\n\n<GameTerm('PinDown')> <em>AP</em> cost is reduced by <em><pindownCostOverwrite> AP</em>.\n\nScope also makes <GameTerm('Biscuits')>.")
            -- for _, param in ipairs(p.Parameters) do
            --     if param.Name == 'pindownCostOverwrite' then
            --         param.Value = 1
            --     end
            -- end
        end

        --------------------------------------------------------------------------------------------

        if p.id == 'SteadyBreathing' then
            p.Description = T(778949186487, "Grants the ability to <em>Sprint</em> in combat.")
        end

        --------------------------------------------------------------------------------------------
        if p.id == 'TakeAim' then -----------TakeAim
            p.Description = T(771192369187, 'Improves <em>Recoil</em> control.')
            for _, param in ipairs(p.Parameters) do
                if param.Name == 'chanceToHitBonus' then
                    param.Value = bonus
                end
            end

        end

        --------------------------------------------------------------------------------------------
        if p.id == 'AutoWeapons' then ------------AutoWeapons
            for _, param in ipairs(p.Parameters) do
                if param.Name == 'automatics_penalty_reduction' then
                    param.Value = autobonus
                end
            end
            p.unit_reactions = {
                PlaceObj('UnitReaction', {
                    Event = "OnModifyCTHModifier",
                    Handler = function(self, target, id, attacker, attack_target, action, weapon1,
                                       weapon2, data)
                        return
                    end,
                    HandlerCode = function(self, attacker, cth_id, data)
                        return
                    end
                })
            }
        end

        --------------------------------------------------------------------------------------------
        if p.id == "Ambidextrous" then
            p.Description = T(453925191822,
                              "Decreases <em>AP</em> cost and <em>Accuracy</em> penalty when <em>Dual-Wielding</em> firearms")
            for _, param in ipairs(p.Parameters) do
                if param.Name == 'PenaltyReduction' then
                    param.Value = 0
                end
            end
            p.unit_reactions = {
                PlaceObj('UnitReaction', {
                    Event = "OnModifyCTHModifier",
                    Handler = function(self, target, id, attacker, attack_target, action, weapon1,
                                       weapon2, data)
                        return
                    end,
                    HandlerCode = function(self, attacker, cth_id, data)
                        return
                    end
                })
            }
        end

        --------------------------------------------------------------------------------------------
        if p.id == "RecklessAssault" then
            p.Description = T(254222471844,
                              "Make a longer <color EmStyle>Run and Gun</color>, firing more shots. \n\nSmiley will be <color EmStyle>Out of Breath</color> for a turn after use. \n\nCan't be used when <color EmStyle>Out of Breath</color>.")
        end
        ---------------------------------------------------------------	  
        local min_accuracy = 5

        if p.id == "Spiritual" then
            for _, param in ipairs(p.Parameters) do
                if param.Name == 'minAccuracy' then
                    param.Value = min_accuracy
                end
            end
        end

        -----------------------------------------------------------------------------
        if p.id == "Protected" then
            for _, param in ipairs(p.Parameters) do
                if param.Name == 'max_ap_carried' then
                    param.Value = 2
                end
            end
        end

        ------------------------------------------------------------------------------------------------------------		
        if p.id == "GruntyPerk" then
            p.Description = T(313423416367,
                              "<em>Attacks</em> the <em>closest</em> enemy with a firearm when <em>combat starts</em>, if possible. \n\nThe attack will have 1 aim level and bonus accuracy.\n\nCan't be used with Heavy Weapons.")
        end

        ------------------------------------------------------------------------------------------------------------		
        if p.id == "CQCTraining" then
            for _, param in ipairs(p.Parameters) do
                if param.Name == "cqc_bonus_max" then
                    param.Value = 14
                end
            end
        end

        ------------------------------------------------------------------------------------------------------------		
        if p.id == "MartialArts" then
            p.Description = T(158619792866,
                              "<em>Unarmed attacks</em> have extra damage scaling based on <em>Dexterity</em>.\n\nImproved <em>Defense</em> against <em>Melee Attacks</em>.")
        end
        ------------------------------------------------------------------------------------------------------------		
    end)
end

---------------------------------------------------------------------------------------------------------

local t_id_table = {
    [453925191822] = "Decreases <em>AP</em> cost and <em>Accuracy</em> penalty when <em>Dual-Wielding</em> firearms",
    [254222471844] = "Make a longer <color EmStyle>Run and Gun</color>, firing more shots. \n\nSmiley will be <color EmStyle>Out of Breath</color> for a turn after use. \n\nCan't be used when <color EmStyle>Out of Breath</color>.",
    [313423416367] = "<em>Attacks</em> the <em>closest</em> enemy with a firearm when <em>combat starts</em>, if possible. \n\nThe attack will have 1 aim level and bonus accuracy.\n\nCan't be used with Heavy Weapons.",
    [158619792866] = "<em>Unarmed attacks</em> have extra damage scaling based on <em>Dexterity</em>.\n\nImproved <em>Defense</em> against <em>Melee Attacks</em>.",
    [778949186487] = "Grants the ability to <em>Sprint</em> in combat."
}

ratG_T_table['CharEffectCompositeDef_function.lua'] = t_id_table
