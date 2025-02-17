function rat_noise_settings(param)
    print("RATMOD: changing caliber noise values")
    ForEachPreset("InventoryItemCompositeDef", function(p)
        local item = g_Classes[p.id]
        if IsKindOf(item, "Ammo") then
            local caliber = p.Caliber
            if item.Modifications then
                for i, v in ipairs(item.Modifications) do
                    if v.target_prop and v.target_prop == "Noise" and const.Calibers.Noise[caliber] then
                        v.mod_add = Max(0, MulDivRound(const.Calibers.Noise[caliber], param, 100))
                    end
                end
            end
        end
    end)

end

function rat_caliber_noise() ---these have to be called from the console and will affect presets only

    ForEachPreset("ModItemInventoryItemCompositeDef", function(p)
        local item = g_Classes[p.id]
        if IsKindOf(item, "Ammo") then
            local caliber = p.Caliber
            -- print(p.id, caliber)
            if item.Modifications then
                for i, v in ipairs(p.Modifications) do
                    if v.target_prop and v.target_prop == "Noise" then

                        v.mod_add = caliber_map[caliber] or 0

                    end
                end
            end

        end
    end)
end

function rat_weapon_noise() ---these have to be called from the console and will affect presets only

    ForEachPreset("ModItemInventoryItemCompositeDef", function(p)
        local item = g_Classes[p.id]
        if IsKindOf(item, "Firearm") then
            -- if item.is_vanilla_firearm then
            -- print(p.id, p.Caliber, vanilla_map[p.id], "vanilla")
            -- elseif item.is_tog_patched then
            -- print(p.id, p.Caliber, vanilla_map[p.id], "TOG")
            -- end
            p.Noise = new_wep_noise[p.id] -- weapons[p.id]
            -- if (item.is_vanilla_firearm or item.is_tog_patched) and (item.noise and item.Noise > 13) then
            -- print(p.id, "wrong noise value", item.Noise)
            -- end
        end

    end)

end

function print_noise()
    for i, k in ipairs(vanilla_map) do
        print(i, k)
        local item = g_Classes[k]
        if item and (item.is_vanilla_firearm or item.is_tog_patched) then
            if item.is_vanilla_firearm then
                print("vanilla", k[1], k[2])
            else
                print("TOG", k[1], k[2])
            end
        end
    end
end
