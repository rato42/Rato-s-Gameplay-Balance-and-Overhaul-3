function GBO_patch_WeaponsPresetsClass()

    local preset_table = {Winchester_Quest = "AssaultRifle", Winchester1894 = "AssaultRifle"}

    ForEachPreset("InventoryItemCompositeDef", function(p)
        if preset_table[p.id] then
            p.object_class = preset_table[p.id]
        end
    end)
end

