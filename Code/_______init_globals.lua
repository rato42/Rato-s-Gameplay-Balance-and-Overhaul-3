if FirstLoad then
	ratG_T_table ={}
	
	ratG_recoilData = {
        small = {
            modifier = 1.0,
            ["9mm"] = {str = 48},
            ["5.7x28mm"] = {str = 44},
            ["45ACP"] = {str = 55},
            ["44CAL"] = {str = 58},
        },
        medium = {
            modifier = 1.38,
            ["545x39"] = {str = 62},
            ["556"] = {str = 64},
        },
		medium_large = {
			modifier = 1.58,
			["9x39"] = {str = 67},
			["762WP"] = {str = 71},
            ["792x33"] = {str = 72},
		},
        large = {
            modifier = 1.78,
            ["762NATO"] = {str = 78},
            ["792x57"] = {str = 79},
            ["762x54R"] = {str = 81},
            ["12gauge"] = {str = 86},
        },
		extra_large = {
            modifier = 2.1,
            ["50BMG"] = {str = 90},
        },
    }
end