function unitprop()
    UnitProperties.properties[#UnitProperties.properties+1] = {

        id = "aim_pos_stance",
		editor = "point",
        default = false,
		no_edit = true
    }
	
	
	
	UnitProperties.properties[#UnitProperties.properties+1] = {

        id = "return_pos_reserved",
		editor = "point",
        default = false,
		no_edit = true
    
	}
	
		
	-- UnitProperties.properties[#UnitProperties.properties+1] = {

        -- id = "ap_reserved_stance",
		-- editor = "number",
        -- default = 0,
		-- min = 0,
		-- max = 10,
		-- no_edit = true
    -- }
	
	
	UnitProperties.properties[#UnitProperties.properties+1] = {

        id = "spiritual_added",
		editor = "number",
        default = 0,
		min = 0,
		max = 1,
		no_edit = true
    }
	
	UnitProperties.properties[#UnitProperties.properties+1] = {

        id = "rat_unit_updated",
		editor = "number",
        default = 0,
		min = 0,
		max = 1000,
		no_edit = true
    }
end

unitprop()