

function PrepareShopItemsForRestock(unlocked_tier, used)
    --bobby_restock_print("Restocking shop")
    local category_weights = {}
    local category_count = {}
    local category_items = {} -- array
    local category_items_set = {}
    NetUpdateHash("PrepareShopItemsForRestock1", unlocked_tier, used)
    -- aggregate category weights and count
    ForEachPreset("InventoryItemCompositeDef", function(preset)
        local item = g_Classes[preset.id]
        local usedOrStandard = false
        if used then 
            usedOrStandard = item.CanAppearUsed
        else 
            usedOrStandard = item.CanAppearStandard
        end
		--print("item", item)
        if item.CanAppearInShop and usedOrStandard and item.Tier <= unlocked_tier and item.RestockWeight > 0 then
            local cat = item:GetCategory().id

			
			
			
			if not category_weights[cat] then
				category_weights[cat] = 0
				category_count[cat] = 0
				category_items[cat] = {}
				category_items_set[cat] = {}
			end
			table.insert(category_items[cat], item)
			category_items_set[cat][item] = true
			category_weights[cat] = category_weights[cat] + item.RestockWeight
			category_count[cat] = category_count[cat] + 1
			NetUpdateHash("PrepareShopItemsForRestock2", cat, item.class, item.RestockWeight, category_count[cat], category_weights[cat])
		end
		
		
    end)
	print("returning")
    return category_items, category_count, category_weights, category_items_set
end