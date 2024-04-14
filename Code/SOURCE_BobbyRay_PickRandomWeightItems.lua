--[[function PickRandomWeightItems(num, items_array, max_weight)
	local picked_items = {}
	local picked_items_set = {}
	for i=1, num do
		local rand_weight = InteractionRand(max_weight, "BobbyRayShop")
		local cur_weight = 0
		local cur_index = 1
		while true do
			-----
			if cur_index > #items_array then
				cur_index = 1  -- Reset index if it exceeds array length
				print("index reset")
			end
			------
			local item = items_array[cur_index]
			while picked_items_set[item] do
				cur_index = cur_index + 1
				-----
				if cur_index > #items_array then
                    cur_index = 1  -- Reset index if it exceeds array length
					print("index reset2")
                end
				------
				item = items_array[cur_index]
			end
			cur_weight = cur_weight + item.RestockWeight
			cur_index = cur_index + 1

			if cur_weight > rand_weight then
				table.insert(picked_items, item.class)
				picked_items_set[item] = true
				max_weight = max_weight - item.RestockWeight
				break
			end
		end
	end
	return picked_items
end]]
