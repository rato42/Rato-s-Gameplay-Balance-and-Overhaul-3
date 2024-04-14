

function rat_magazines()
    ForEachPreset('WeaponComponent', function(p)
        local mag_list = {              
            {"MagLarge_1",      146 ,   1 , 4 }, --{"HiPower"                                                                              ,   6 
            {"MagLarge_2",      166 ,   2 , 7  }, --{"RPK74"                                                                               ,   30
            {"MagLarge_3",      194 ,   1 , 6  }, --{"Glock18"                                                                             ,   16
            {"MagLarge_4",      128 ,   1 , 4 }, --{"UZI"	{"LionRoar"                                                                     ,   7 
            {"MagLarge_5",      200 ,   1 , 6  }, --{"MP5"	{"MP5K"	{"M14SAW"	{"M14SAW_AUTO" {"BarretM82"                    ,   15
            {"MagLarge_6",      250 ,   2 , 6  }, --{"AA12"                                                                                ,   12
            {"MagLarge_7",      140 ,   1 , 6  }, --{"AUG"                                                                                 ,   12
            {"MagLarge_8",      400 ,   2 , 8  }, --{"HK21"                                                                                ,   60
            {"MagLarge_9",      333 ,   2 , 8  }, -- {"G36"                                                                                ,   70
			{"MagLarge_10",     400 ,   1 , 4  }, -- psg                                                                                   ,   15
			{"MagLarge_11",      200 ,   1, 8   }, --{"MP40"	                                                                             ,  32
			{"MagLarge_12",      200 ,  2, 12   }, --{"FNMinimi"	
			
			
			---tog mags
			{"Papovka2_Mag_ext_1", 300, 1, 6},
			{"Papovka_Mag_ext_1", 300, 1, 6},
			{"MicroUZI_Mag_ext_1", 125, 1, 4},
			{"SSG69_Mag_ext_1", 200, 1, 6},
			{"G43_Mag_ext_1", 200, 1, 6},
				
											 
			
			
			
			{"MagLargeFine_1",  146  ,    false ,4 }, --{"HiPower"                                                                       , 6  
            {"MagLargeFine_2",  166  ,    false ,7 }, --{"RPK74"                                                                         , 30 
            {"MagLargeFine_3",  194  ,    false ,6 }, --{"Glock18"                                                                       , 16 
            {"MagLargeFine_4",  128  ,    false ,4 }, --{"UZI"	{"LionRoar"                                                            , 7  
            {"MagLargeFine_5",  200  ,    false ,6 }, --{"MP40"	{"MP5"	{"MP5K"	{"M14SAW"	{"M14SAW_AUTO"	{"BarretM82"   , 15 
            {"MagLargeFine_6",  250  ,    false ,6 }, --{"AA12"                                                                          , 12 
            {"MagLargeFine_7",  140  ,    false ,6 }, --{"AUG"                                                                           , 12 
            {"MagLargeFine_8",  400  ,    false ,8 }, --{"HK21"                                                                          , 60 
            {"MagLargeFine_9",  333  ,    false ,8 }, -- {"G36"                                                                          , 70 
            {"MagLargeFine_10", 400  ,    false ,6 }, -- psg                                                                             , 15 
			{"MagLargeFine_11", 200  ,    false ,6 }, --{"MP40"	                                                                       , 32 
			{"MagLargeFine_12",      200 ,   false, 12   }, --{"FNMinimi"	
        }             

        local componentId = p.id
        --print("component id", componentId)

        for _, mag in ipairs(mag_list) do
            local magId = mag[1]
            if componentId == magId then
                -- If the component ID matches, set p.Parameters based on the second value in the tuple
                -- print("Match found:", componentId)
                -- print("Setting p.Parameters to:", mag[2])
				for _, p in ipairs(p.Parameters) do 
					print("param", p)
				end
				
				
				local mag_factor =  mag[4]
				
				if mag[3] and mag[3] > 1 then
					mag_factor =  mag[4] + 5
				end
				
				mag_factor = mag_factor /180.0
				print("mag_factor", mag_factor)
				
				local ow_reduction = ((mag[2]) / 150.0) * mag_factor
                print("ow reduction", ow_reduction)

                if mag[2] > 150 then
                    ow_reduction = 88 - (88 * ow_reduction)
                else
                    ow_reduction = 88 + (88 * ow_reduction)
                end
				
				
				
              
                for _, param in ipairs(p.Parameters) do
                    if param.Name == "MagazineSizeMultiplier" then
                        param.Value = mag[2]
                    end
					if param.Name == "OverwatchAngleDecrease" then
                        param.Value = cRound(ow_reduction)
                    end
					if mag[3] and param.Name == "ReloadAPIncrease" then
                        param.Value = mag[3]
                    end
                end

                break  
            end
        end
    end)
end
