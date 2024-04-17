local function rT(id, text)
	return {id,  text}
end

local function processMetatext(id, text, populate_crosshair)
	local in_id, in_text = id, text
	if type(id) == "table" then
		in_id = id[1]
		in_text = id[2]
	end
	if populate_crosshair then
		return TranslationTable[in_id] or in_text	
	end
	return T(in_id, in_text)
end

function GetWepRecoil(weapon, attacker, display)
		local mod = 1.00
		local metaText = {}
		
		local weapon2 = false
		
		if attacker and not attacker.placeholder then 
			local slot = attacker:GetEquippedWeaponSlot(weapon)
			local equipped_w = attacker:GetEquippedWeapons(slot)
			
			weapon2 = equipped_w and equipped_w[2] or false
			--print(weapon2)
				
			
		end
		
		
		
						----------------weaponkind
		
		local base_mul = (weapon.wep_base_recoil_mul or 100)/100.00

		---------------This should apply only to burst/auto attacks (i guess)
		mod = mod * base_mul

		
		
		if IsKindOf(weapon, "BrowningM2HMG") then
			--mod = mod * 0.75
			metaText[#metaText + 1] = "Stationary"
		end
		
		if IsKindOf(weapon, "LionRoar") then
			mod = mod * 0.88
			metaText[#metaText + 1] = "Compensator"
		end
		
		
		if IsKindOfClasses(weapon, "AssaultRifle") then
			mod = mod * 1.00
		elseif IsKindOfClasses(weapon, "SubmachineGun") then
			mod = mod * 1.30
			--metaText[#metaText + 1] = "(-) SMG"
		elseif IsKindOfClasses(weapon, "Pistol") then
			mod = mod * 1.95
		elseif IsKindOfClasses(weapon, "Revolver") then
			mod = mod * 1.88
			--metaText[#metaText + 1] = "(-) Pistol"
		elseif IsKindOfClasses(weapon, "MachineGun") then
			mod = mod * 0.95
			--metaText[#metaText + 1] = "(+) LMG"
		else
			mod = mod * 1.00
		end
		
		local mech, meta_mech = GetMechanismRecoil(weapon)
		
		if meta_mech then
			metaText[#metaText + 1] = rT(meta_mech)
		end
		
		mod = mod * mech
		
		
		if weapon and weapon:HasComponent("Vert_grip_recoil") then
			
			--if action and action.id == "DualShot" then
			if weapon2 then
				--print("w2")
			else
				mod = mod * 0.92
				metaText[#metaText + 1] = rT(892823936544, "Vertical Grip")
			end
		end
		
		
		if weapon and weapon:HasComponent("tac_grip_recoil") then
			
			--if action and action.id == "DualShot" then
			if weapon2 then
				--print("w2")
			else
				mod = mod * 0.97
				metaText[#metaText + 1] = rT(371872683581, "Foldable Grip")
			end
		end
		
		if weapon and weapon:HasComponent("no_stock") then

			if IsKindOfClasses(weapon, "SubmachineGun") then
				mod = mod * 1.80
				
			else
				mod = mod * 1.90
				
			end
			metaText[#metaText + 1] = rT(115796595571, "(-) No Stock")
		end
		
		local modifyVal, compDef 
		
		if weapon and weapon:HasComponent("handguard_ext") then
			modifyVal, compDef = GetComponentEffectValue(weapon, "handguard_ext", "recoil_mul")
			mod = mod * (modifyVal/100.00 or 1.00)
			--metaText[#metaText + 1] = rT(395163141224, "Extended Handguard")
		end
		
		if weapon and weapon:HasComponent("handguard_short") then
			modifyVal, compDef = GetComponentEffectValue(weapon, "handguard_short", "recoil_mul")
			mod = mod * (modifyVal/100.00 or 1.00)
			--metaText[#metaText + 1] = rT(963983387333, "(-) Short Handguard")
		end
		
		if weapon and weapon:HasComponent("compensator_effect") then
			mod = mod * 0.85
			metaText[#metaText + 1] = rT(134618826773, "Compensator")
		end
		
		if weapon and weapon:HasComponent("recoil_booster_effect") then
			mod = mod * 0.95
			metaText[#metaText + 1] = rT(862593714174, "Recoil Booster")
		end
		
		if weapon and weapon:HasComponent("integr_muzzle_brake") then
			mod = mod * 0.91
			metaText[#metaText + 1] = rT(585361131592, "Integrated Muzzle Brake")
		end
		
		if weapon and weapon:HasComponent("compensator_effect_silencer") then
			mod = mod * 0.95
			metaText[#metaText + 1] = rT(263781558966, "Suppressor")
		end
		
		if weapon and weapon:HasComponent("compensator_effect_ugly_silencer") then
			mod = mod * 0.97
			metaText[#metaText + 1] = rT(696373868183, "Improvised Suppressor")
		end
		
		if (weapon and weapon:HasComponent("longbarrel")) or (weapon and weapon.default_long_barrel) then
			
			
			if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
				mod = mod * 0.94
			elseif IsKindOf(weapon, "Revolver") then
				mod = mod * 0.93
			elseif IsKindOf(weapon, "SubmachineGun") then
				mod = mod * 0.91
			else
				mod = mod * 0.90
			end
			
			metaText[#metaText + 1] = rT(894953874886, "Extended Barrel")
		end
		
		if weapon and weapon:HasComponent("shortbarrel") then
			
			
			if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
				mod = mod * 1.03
			elseif IsKindOf(weapon, "Revolver") then
				mod = mod * 1.04
			elseif IsKindOf(weapon, "SubmachineGun") then
				mod = mod * 1.09
				
			else
				mod = mod * 1.10
			end
			
			
			
			metaText[#metaText + 1] = rT(228113672715, "(-) Short Barrel")
		end
		
		if weapon and weapon:HasComponent("hipfire_light_barrel") then
			if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
				mod = mod * 1.06
			elseif IsKindOf(weapon, "Revolver") then
				mod = mod * 1.07
			elseif IsKindOf(weapon, "SubmachineGun") then
				mod = mod * 1.10
				
			else
				mod = mod * 1.12
			end
			
			metaText[#metaText + 1] = rT(826212377342, "(-) Light Barrel")
		end
		
		
		if weapon and weapon:HasComponent("heavy_barrel_effect") then
		
			if IsKindOf(weapon, "Pistol") or weapon.pistol_swap then
				mod = mod * 0.95
			elseif IsKindOf(weapon, "Revolver") then
				mod = mod * 0.94
			elseif IsKindOf(weapon, "SubmachineGun") then
				mod = mod * 0.92
			else
				mod = mod * 0.91
			end
			
			metaText[#metaText + 1] = rT(649749565849, "Heavy Barrel")
		end
		
		
		if weapon and weapon:HasComponent("stockheavy_effect_recoil") then
			mod = mod * 0.90
			metaText[#metaText + 1] = rT(779417232291, "Heavy Stock")
		end
		
		if weapon and weapon:HasComponent("stocklight_effect_recoil") then
			mod = mod * 1.10
			metaText[#metaText + 1] = rT(662981363158, "(-) Light Stock")
		end
		

		
		
		
		
		mod = mod --^ 0.8
		
		
	if display then 
		return mod
	else
		return mod, metaText
	end
end

function GetCaliberStrRecoil(weapon, attacker, num_shots)
		local weapon1 = weapon
		local metaText = {}
		--local str_mod = 0
		local str = attacker.Strength
		--local str_scaling = 0
		--local str_mod_f = 1

		--print("str")
		--print(str)

		local marks = attacker.Marksmanship

		-- local marks_factor = marks *0.8
		-- local str_factor = str * 0.2
		-- local factor 
		
		-- if str > marks then
			-- factor = str *0.2
		-- else
			-- factor = marks *0.2
		-- end
		
		-- factor = (marks_factor + str_factor)/2.0
		
		
    local scaleFactor = 0   
    
    local breakpoint, modifier = Recoil_StrBreakpoint(weapon1) 
	-- print("breakpoint", breakpoint)
	-- print("str", str)
	if not breakpoint or breakpoint == 0 then
		return 1
	end
	
	local is_below_breakpoint 
	
	
	local adjust = 0.6
	local adjusted_breakpoint = breakpoint * adjust
	local adjusted_str = str * adjust
	
    if str < breakpoint then
		is_below_breakpoint = true
        scaleFactor = 20.0 + ((100.0 - 20.0) * (adjusted_breakpoint - adjusted_str) / adjusted_breakpoint)
		metaText[#metaText + 1] = rT(285153762692, "(-) Low Strength")
    else
        if breakpoint < 80 then
			scaleFactor = 20.0 - (20.0 * (adjusted_str - adjusted_breakpoint) / (100.0 - adjusted_breakpoint))
        elseif breakpoint < 90 then
            scaleFactor = 20.0 - (18 * (adjusted_str - adjusted_breakpoint) / (100.0 - adjusted_breakpoint))
        else
            scaleFactor = 20.0 - (12 * (adjusted_str - adjusted_breakpoint) / (100.0 - adjusted_breakpoint))
        end
		metaText[#metaText + 1] = rT(988872717528, "Strength")

        
    end
	
	
	
		
    -- if str < breakpoint then
        -- scaleFactor = 20.0 + ((100.0 - 20.0) * (breakpoint - str) / breakpoint)
		-- metaText[#metaText + 1] = "(-) Low Strength"
    -- else
        -- if breakpoint < 80 then
         -- scaleFactor = 20.0 - (20.0 * (str - breakpoint) / (100.0 - breakpoint))
        -- elseif breakpoint < 90 then
            -- scaleFactor = 20.0 - (18 * (str - breakpoint) / (100.0 - breakpoint))
        -- else
            -- scaleFactor = 20.0 - (12 * (str - breakpoint) / (100.0 - breakpoint))
        -- end
		-- metaText[#metaText + 1] = "Strength"

        
    -- end
	
	breakpoint = breakpoint * modifier
    local str_mod_f = ((scaleFactor * 2.5 * adjust) + 35.0 + breakpoint)/100
	
	
		-- if marks > 59 then
			-- local marks_scaling = 0.8 + 0.2 * (1 - (marks - 60* 1.00) / 40 *1.00) *0.5

			
			-- str_mod_f = str_mod_f * marks_scaling
			-- print("marks scaling", marks_scaling)
			-- if marks == 100 then
				-- str_mod_f = str_mod_f * 0.96
				-- print("marks scaling 100", marks_scaling *0.96)
				-- metaText[#metaText + 1] = rT(949639567956, "Perfect Technique")
			-- elseif marks > 85 then
				-- metaText[#metaText + 1] = rT(824796784687, "High Marksmanship")
			-- else 
				-- metaText[#metaText + 1] = rT(294753784373, "Marksmanship")
			-- end
		-- else
			-- metaText[#metaText + 1] = rT(286526555251, "(-) Low Marksmanship")
		-- end
	

		str_mod_f = str_mod_f ^ 1.9
		
		
		if num_shots and num_shots > 1 and weapon.tracer == 1 then
			str_mod_f = str_mod_f * 0.88
			metaText[#metaText + 1] = rT(669471256347, "Tracer Rounds")
		end
		
		if weapon.ArmorPir == 1 then
			str_mod_f = str_mod_f * 1.10
			metaText[#metaText + 1] = rT(281796668818, "(-) AP Rounds")
		end
		
		
		
		return str_mod_f, metaText
end


function GetRecoilOther(weapon, attacker, action)


		local metaText = {}
		local mod = 1.00
		if action and action.id ~= "RunAndGun" then
			if attacker.stance then
				if attacker.stance == "Prone" then
					mod = mod * 0.90
					metaText[#metaText + 1] = rT(294661659116, "Prone")
					if weapon and weapon:HasComponent("AccuracyBonusProne") then
						mod = mod * 0.88
						metaText[#metaText + 1] = rT(523692869416, "Bipod")
					end
					
				elseif attacker.stance == "Crouch" then
					mod = mod * 0.95
					metaText[#metaText + 1] = rT(663793494488, "Crouching")
				end
			end
		end
		
		local marks = attacker.Marksmanship
		
		if marks > 59 then
			local marks_scaling = 0.77 + 0.23 * (1 - (marks - 60* 1.00) / 40 *1.00)
			
			mod = mod * marks_scaling
			--print("marks scaling", marks_scaling)
			if marks == 100 then
				--mod = mod * 0.99
				--print("marks scaling 100", marks_scaling *0.96)
				metaText[#metaText + 1] = rT(869135768177, "Perfect Technique")
			elseif marks > 85 then
				metaText[#metaText + 1] = rT(495676736357, "High Marksmanship")
			else 
				metaText[#metaText + 1] = rT(889423438892, "Marksmanship")
			end
		else
			metaText[#metaText + 1] = rT(946448112577, "(-) Low Marksmanship")
		end
		
		-----------------perks
		if not attacker.placeholder then
			if attacker:HasStatusEffect("TakeAim") then
				mod = mod * 0.85
				metaText[#metaText + 1] = rT(712682745289, "Perk: Recoil Management")
			end
			
			
			if action and not (action.id == "SingleShot" or action.id == "Buckshot" or action.id == "Pindown") and attacker:HasStatusEffect("AutoWeapons") then
				mod = mod * 0.82
				metaText[#metaText + 1] = rT(764956297274, "Perk: Auto Weapons")

			end
			
			if action and (action.id == "BurstFire" or action.id == "RunAndGun" or action.id == "RecklessAssault") then

				if weapon.burst_recoil_delta and weapon.burst_recoil_delta ~= 100 then
					local burst_delta = weapon.burst_recoil_delta/100.0
					
					
					mod = mod * burst_delta
					
				end
				if weapon and weapon:HasComponent("recoil_bump") then
					mod = mod * 1.10
					metaText[#metaText + 1] = rT(749694622664, "(-) Bump Stock")
				end
				
				-- if weapon and weapon:HasComponent("bullpup") then
					-- mod = mod * 0.95
					-- metaText[#metaText + 1] = "Bullpup"
				-- end
				
				if weapon.burst_selective or weapon:HasComponent("Reduce_recoil_burst_delta") then
					local name = weapon.DisplayName[2]
					metaText[#metaText + 1] = rT(name .. " Selective Burst")
				end
			end
			
			if action and (action.id == "AutoFire") then

				if weapon.auto_recoil_delta and weapon.auto_recoil_delta ~= 100 then
					local auto_delta = weapon.auto_recoil_delta/100.0
					mod = mod * auto_delta
			
				end

			end
			
			if action and (action.id == "MGBurstFire" or action.id == "GrizzlyPerk") then

				if weapon.long_recoil_delta and weapon.long_recoil_delta ~= 100 then
					local long_delta = weapon.long_recoil_delta/100.0
					mod = mod * long_delta
			
				end

			end
		end
		--print(mod)
		
		mod = mod --^0.8
		--print(mod)
		--print(mod)
	
	return mod, metaText
end

function GetMechanismRecoil(weapon)
    local mechs = {
		-- ["Revolver"] = 106,
        ["Blowback"] = 105,
        -- ["Single_Shot"] = 105,
        ["Striker_Fired"] = 106,
        ["Short_Recoil"] = 107,
        ["Gas_Operated"] = 93,
        ["Recoil_Operated"] = 94,
        ["Roller_Delayed"] = 95,
        -- ["Break_Action"] = 96,
        -- ["Pump_Action"] = 97,
        -- ["Bolt_Action"] = 98,
        -- ["Lever_Action"] = 99,
    }

    local metaTextMap = {
        --["Revolver"] = "Revolver",
        ["Blowback"] = rT(642385744896, "(-) Blowback"),
        --["Single_Shot"] = "Single Shot",
        ["Striker_Fired"] = rT(132322127855, "(-) Striker Fired"),
        ["Short_Recoil"] = rT(758234761279, "(-) Short Recoil"),
        ["Gas_Operated"] = rT(226357388522, "Gas Operated"),
        ["Recoil_Operated"] = rT(756261568764, "Recoil Operated"),
        ["Roller_Delayed"] = rT(778967917912, "Roller Delayed"),
        --["Break_Action"] = "Break Action",
        --["Pump_Action"] = "Pump Action",
        --["Bolt_Action"] = "Bolt Action",
        --["Lever_Action"] = "Lever Action",
    }

    local mod = mechs[weapon.recoil_mechanism]
	
	if mod then 
		mod = mod/100.00
	else
		mod = 1.00
	end
	
    local metaText = metaTextMap[weapon.recoil_mechanism] or false
    
    return mod, metaText
end

--function Recoil_StrBreakpoint(weapon1)
	-- local str = 60
	-- local modifier = 1.2
		-- if weapon1.Caliber == "9mm" then
			-- str = 47
			
		-- elseif weapon1.Caliber  == "5.7x28mm" then
			-- str = 44
			
		-- elseif weapon1.Caliber  == "45ACP" then
			-- str = 52	
			
		-- elseif weapon1.Caliber  == "44CAL" then
			-- str = 54
			
		-- elseif weapon1.Caliber  == "545x39" then
			-- str = 63
			-- modifier = 1.6
		-- elseif weapon1.Caliber  == "556" then
			-- str = 65
			-- modifier = 1.6
		-- elseif weapon1.Caliber  == "762WP" then
			-- str = 68
			-- modifier = 1.6
		-- elseif weapon1.Caliber  == "792x33" then
			-- str = 71
			-- modifier = 1.6
		-- elseif weapon1.Caliber  == "762NATO" then
			-- str = 75
			-- modifier = 1.8
		-- elseif weapon1.Caliber  == "792x57" then
			-- str = 77
			-- modifier = 1.8
		-- elseif weapon1.Caliber  == "762x54R" then
			-- str = 79	
			-- modifier = 1.8
		-- elseif weapon1.Caliber  == "12gauge" then
			-- str = 85
			-- modifier = 1.8
		-- elseif weapon1.Caliber  == "50BMG" then
			-- str = 90
			-- modifier = 1.8
		-- end
	-- return str, modifier
--end



function Recoil_StrBreakpoint(weapon1)


    local category = nil
    local caliberData = nil

    for cat, calibers in pairs(ratG_recoilData) do
        if calibers[weapon1.Caliber] then
            category = cat
            caliberData = calibers[weapon1.Caliber]
            break
        end
    end

    if caliberData then
        local str = caliberData.str
        local modifier = ratG_recoilData[category].modifier
        return str, modifier
    else
        return 0, 0
    end
end

local stacks_multiplier = 0.35
local flat_penalty_base = -5-- -10

local param_base = -39 -- -24

function get_recoil(attacker, target, target_pos, action, weapon1, aim, num_shots, stacks, test, test_distance, unit_command, populate_recoil)
		
		if not attacker or not target then 
			return  0
		end
		if not IsKindOf(weapon1,"Firearm") then
			return  0
		end
	


		--local param
		local metaText = {}
		--this_should_bug.bug = bug
		
		local extra = 0
		----------------------------------------------------------------------------------------------------------mods
		local mod = 100
		local display = false
		
		if IsKindOf(target, "Unit") then
			local target_pos = target:GetPos()
		end

		-- print("actionid", action.id)
		-- print("command", attacker.unit_command)
		local attacker_pos = attacker:GetPos()

		
		local w1, weapon2 = attacker:GetActiveWeapons()
		
		local weapon = weapon1
		local param = param_base
		local flat_penalty = flat_penalty_base
		
		
		local weapon_recoil_mod, metaText_wep = GetWepRecoil(weapon, attacker, display)
		if action.id == "DualShot" then
			weapon = weapon2
			local weapon_recoil_mod2 = GetWepRecoil(weapon, attacker, display)
			weapon = weapon1
			weapon_recoil_mod = (weapon_recoil_mod + weapon_recoil_mod2) /2
			metaText_wep = {rT(461685692199, "Average Recoil: Two Weapons")}
		end
		mod = mod * weapon_recoil_mod
		
		
		for i, text in ipairs(metaText_wep) do
			table.insert(metaText, text)
		end
		
		-----------------------Stance, perks
		
		local other, otherMeta = GetRecoilOther(weapon, attacker, action)


		mod = mod * other
		
		for i, text in ipairs(otherMeta) do
			table.insert(metaText, text)
		end
		
		
		-----------------str/caliber
		local str_caliber_mod = 1
		local meta_text_caliber = {}
		str_caliber_mod, meta_text_caliber = GetCaliberStrRecoil(weapon, attacker, num_shots)
		
		if action.id == "DualShot" then
			weapon = weapon2
			local str_caliber_mod2 = GetCaliberStrRecoil(weapon, attacker, num_shots)
			weapon = weapon1
			meta_text_caliber = {}
			str_caliber_mod = (str_caliber_mod + str_caliber_mod2) /2
		end
			
		mod = mod * str_caliber_mod
		
		for i, text in ipairs(meta_text_caliber) do
			table.insert(metaText, text)
		end
		
		----------------------------------------------------------------------------------------------------------mods
		
		
			
		--local flat_penalty = -10-- -10
		--local param = -24 -- -22 -10
		local penalty
		local held_mg 
		
		local mg_setup_mul = 0.85

		local ROF

		if not IsKindOf(weapon, "Shotgun") then
			local action_id_rof = action.id or ""
			if action_id_rof == "GrizzlyPerk" then
				action_id_rof = "MGBurstFire"
			end
			ROF = Rat_GetROF(weapon,action_id_rof)
		end

		
		if ROF and ROF > 1 then
			mod = mod * ROF
			metaText[#metaText + 1] = rT(851619126995, "(-) High Rate of Fire")
		end
		
		if action.id == "MGBurstFire" then
			if test or g_Overwatch[attacker] and g_Overwatch[attacker].permanent then
				mod = mod * mg_setup_mul
				metaText[#metaText + 1] = rT(665399583815, "MG Setup")
			else
				held_mg = true
			end
		elseif action.id == "GrizzlyPerk" then
			mod = mod * mg_setup_mul
			held_mg = false
			metaText[#metaText + 1] = rT(228847175552, "Off the Hip")--GrizzlyPerk.DisplayName
		end

		local action_command = attacker.action_command or ''
		
		
		if action_command == "RunAndGun" or action_command == "RecklessAssault" then
			param = param -15
		end
		
		local penalty = 0
		
		local pb_dist = const.Weapons.PointBlankRange * const.SlabSizeX
		
		penalty = MulDivRound(penalty, mod,100)
		local dist
		if test then
			dist = test_distance	
		else
			dist = attacker_pos:Dist(target_pos)
		end
			
		local max_dist = 14 * const.SlabSizeX		
		local max_penalty = param + extra 

		
		dist = Min(dist, max_dist) 
		penalty = penalty + (Min(-1, MulDivRound(dist, max_penalty - penalty, max_dist)))

		penalty = MulDivRound(penalty, mod,100)


		


		
		if (action.id == "MGBurstFire" or action.id == "GrizzlyPerk") then
		
			penalty = penalty * 1.08
			
			local str = attacker.Strength
			local mg_mod = 130
			local hip_mod = 1.0
			
			if held_mg then
				
				metaText[#metaText + 1] = rT(594122678151, "(-) Held MG")
				hip_mod = (GetHipfirePenal(weapon, attacker, action, false, 1)*0.5 * (weapon.weigth_held_mul/100.0))
				mg_mod = 180 * hip_mod
				-- print("hip_mod", hip_mod)
				-- print("mg_mod", mg_mod)
			end
			
			if str > 49 then	
				local str_mod_mg = 0.8 + 0.2 * (1 - (str - 50 * 1.00) / 50 *1.00)
				mg_mod = mg_mod * str_mod_mg
			end
			--print("mg mod", mg_mod)
			penalty = MulDivRound(penalty, mg_mod, 100)
		end
		
		-- if held_mg then
			-- local hip_mod = (GetHipfirePenal(weapon, attacker, action, display, 1)*0.8)*100
			-- penalty = MulDivRound(penalty,Max(100, hip_mod), 100)
		-- end
		
		
		local side = attacker and attacker.team and attacker.team.side or ''
		
		if not (side == 'player1' or side == 'player2') and not test then
			penalty = AIpenal_reduc(attacker, penalty, "Recoil", stacks and true or false)
		end
		
		
		
		
		-- if dist <= pb_dist then
			-- penalty = MulDivRound(penalty, 90,100)
			-- metaText[#metaText + 1] = rT(219911149892, "Point-Blank Range")
		-- end
		
		penalty = penalty + flat_penalty
		--print("last recoil penaty", penalty)
		

	
		if penalty == 0 then
			return 0
		end
		
		

		for i, text in ipairs(metaText) do
			metaText[i] = processMetatext(text[1], text[2], populate_recoil)
		end
		
		if stacks then
			penalty = cRound(penalty*stacks_multiplier*(stacks or 1))
			
			return MulDivRound(penalty,const.Combat.R_RecoilP,100), #metaText ~= 0 and metaText
		end
			
		penalty = cRound(penalty *0.5)
		return MulDivRound(penalty,const.Combat.R_Recoil,100) , #metaText ~= 0 and metaText


		--return true, penalty, rT(574718433471, "Recoil"), #metaText ~= 0 and metaText	
			
		
	end
	

	
function get_recoilP_value(attacker, action, weapon1, aim, stacks, unit_command)
		
		if not attacker then 
			return  0
		end
		if not IsKindOf(weapon1,"Firearm") then
			return  0
		end
	

		local metaText = {}

		
		local extra = 0
		----------------------------------------------------------------------------------------------------------mods
		local mod = 100
		local display = false
		



		local w1, weapon2 = attacker:GetActiveWeapons()
		
		local weapon = weapon1
		
		local param = param_base
		local flat_penalty = flat_penalty_base
		
		
		local weapon_recoil_mod, metaText_wep = GetWepRecoil(weapon, attacker, display)
		if action.id == "DualShot" then
			weapon = weapon2
			local weapon_recoil_mod2 = GetWepRecoil(weapon, attacker, display)
			weapon = weapon1
			weapon_recoil_mod = (weapon_recoil_mod + weapon_recoil_mod2) /2
			metaText_wep = {rT(862325237281, "Average Recoil: Two Weapons")}
		end
		mod = mod * weapon_recoil_mod
		
		
		for i, text in ipairs(metaText_wep) do
			table.insert(metaText, text)
		end
		
		-----------------------Stance, perks
		
		local other, otherMeta = GetRecoilOther(weapon, attacker, action)


		mod = mod * other
		
		for i, text in ipairs(otherMeta) do
			table.insert(metaText, text)
		end
		
		
		-----------------str/caliber
		local str_caliber_mod = 1
		local meta_text_caliber = {}
		str_caliber_mod, meta_text_caliber = GetCaliberStrRecoil(weapon, attacker, false)
		
		if action.id == "DualShot" then
			weapon = weapon2
			local str_caliber_mod2 = GetCaliberStrRecoil(weapon, attacker, false)
			weapon = weapon1
			meta_text_caliber = {}
			str_caliber_mod = (str_caliber_mod + str_caliber_mod2) /2
		end
			
		mod = mod * str_caliber_mod
		
		for i, text in ipairs(meta_text_caliber) do
			table.insert(metaText, text)
		end
		
		----------------------------------------------------------------------------------------------------------mods
		
		
			





		

		
		local penalty = param
		

		

		penalty = MulDivRound(penalty, mod,100)



		
		
		local side = attacker and attacker.team and attacker.team.side or ''
		
		if not (side == 'player1' or side == 'player2') then
			penalty = AIpenal_reduc(attacker, penalty, "Recoil", true)
		end
		
		

		penalty = penalty + flat_penalty



	
		if penalty == 0 then
			return 0
		end

		penalty = penalty*stacks_multiplier*(stacks or 1)


		
		for i, text in ipairs(metaText) do
			metaText[i] = processMetatext(text[1], text[2], false)
		end

			
		return MulDivRound(penalty,const.Combat.R_RecoilP,100), #metaText ~= 0 and metaText
			
			
		
	end
	
		
	
	-- local recoil = attacker.recoil
-- print("unit recoil", recoil)
-- local penalty = recoil * (1 - shot_index)

-- return value + penalty


-- if attacker == target then
		-- if shot_index == 1 then
			-- unit.first_shot_value = value
			-- return value
		-- end
		
		-- if shot_index > 6 then
			-- return value
		-- end
		
		-- local recoil = attacker.recoil
		-- print("unit recoil", recoil)
		-- print("value", shot_index, value)
		
		-- local penalty = recoil * ( 1 -  shot_index)
		-- print("penalty", shot_index,  penalty)
		-- local final = cRound(unit.first_shot_value + penalty)
		-- if final >100 then
			-- final = 100
		-- elseif final <0 then
			-- final = 0
		-- end
		-- print("final", shot_index, final)
		-- return final
-- end


----graze
-- if not value or not num_shots then 
	-- return
-- end

-- local new
-- if num_shots > 1 then
	-- new = 15
-- else 
	-- new =  10
-- end

-- return new





-- if target == attacker then
	-- new= value + ((shot_index) *  -10)
	-- print("new", new)
	-- if new > 100 then
		-- new = 100
	-- elseif new < 0 then
		-- new = 0
	-- end
	-- return new
-- end




---------------------------------------------------------------------------------------------------------

local t_id_table = {
[892823936544] = "Vertical Grip",
[371872683581] = "Foldable Grip",
[115796595571] = "(-) No Stock",
[395163141224] = "Extended Handguard",
[963983387333] = "(-) Short Handguard",
[134618826773] = "Compensator",
[862593714174] = "Recoil Booster",
[585361131592] = "Integrated Muzzle Brake",
[263781558966] = "Suppressor",
[696373868183] = "Improvised Suppressor",
[894953874886] = "Extended Barrel",
[228113672715] = "(-) Short Barrel",
[826212377342] = "(-) Light Barrel",
[649749565849] = "Heavy Barrel",
[779417232291] = "Heavy Stock",
[662981363158] = "(-) Light Stock",
[285153762692] = "(-) Low Strength",
[988872717528] = "Strength",
[949639567956] = "Perfect Technique",
[824796784687] = "High Marksmanship",
[294753784373] = "Marksmanship",
[286526555251] = "(-) Low Marksmanship",
[669471256347] = "Tracer Rounds",
[281796668818] = "(-) AP Rounds",
[294661659116] = "Prone",
[523692869416] = "Bipod",
[663793494488] = "Crouching",
[869135768177] = "Perfect Technique",
[495676736357] = "High Marksmanship",
[889423438892] = "Marksmanship",
[946448112577] = "(-) Low Marksmanship",
[712682745289] = "Perk: Recoil Management",
[764956297274] = "Perk: Auto Weapons",
[749694622664] = "(-) Bump Stock",
[642385744896] = "(-) Blowback",
[132322127855] = "(-) Striker Fired",
[758234761279] = "(-) Short Recoil",
[226357388522] = "Gas Operated",
[756261568764] = "Recoil Operated",
[778967917912] = "Roller Delayed",
[461685692199] = "Average Recoil: Two Weapons",
[851619126995] = "(-) High Rate of Fire",
[665399583815] = "MG Setup",
[228847175552] = "Off the Hip",
[594122678151] = "(-) Held MG",
[219911149892] = "Point-Blank Range",
[574718433471] = "Recoil",
[862325237281] = "Average Recoil: Two Weapons",
}

ratG_T_table['FUNCTIONS_recoil.lua'] = t_id_table