function gunshurt()

    local function extractNumberWithSignFromString(str)
        if not str then
            return false
        end
        local num = tonumber(string.match(str, "[+-]?%d+"))
        if num then
            return num
        else
            return false
        end
    end

    local mul = extractNumberWithSignFromString(CurrentModOptions['guns_hurt']) or 100

    ForEachPreset("InventoryItemCompositeDef", function(w)
        local item = g_Classes[w.id]
        if IsKindOf(item, "Firearm") and not IsKindOf(item, "HeavyWeapon") and item.Damage > 0 then
            if not ratG_GunsHurtOriginalDMGValues[item.class] then
                ratG_GunsHurtOriginalDMGValues[item.class] = {
                    dmg = item.Damage,
                    basedmg = item.base_Damage
                }
            end

            item.Damage = MulDivRound(ratG_GunsHurtOriginalDMGValues[item.class]["dmg"], mul, 100)
            item.base_Damage = MulDivRound(ratG_GunsHurtOriginalDMGValues[item.class]["basedmg"],
                                           mul, 100)

            if Platform.developer and Platform.rat then
                print("----------")
                print("ID:", item.class)
                print("original dmg:", ratG_GunsHurtOriginalDMGValues[item.class])
                print("dmg:", item.Damage)
            end
        end
    end)
end

function OnMsg.ApplyModOptions(id)

    if id ~= CurrentModId then
        return
    end

    gunshurt()
end

function OnMsg.ModsReloaded()
    gunshurt()
end
