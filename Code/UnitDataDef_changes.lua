--[[function unit_data_def()
	ForEachPreset("UnitDataCompositeDef", function(p)
		
		if p.id == "Blood" then
			print(p)
			local startingperks = p.StartingPerks
			for i, perk in ipairs(startingperks) do
				if perk == "MartialArts" then
					startingperks[i] = "CQCTraining"
				end
			end
			print(p)
			
		end
	end)
end

function OnMsg.ClassesBuilt()
	unit_data_def()
	
end]]

