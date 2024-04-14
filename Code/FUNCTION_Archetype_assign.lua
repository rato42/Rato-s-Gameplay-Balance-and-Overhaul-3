
--[[local clonedArchetypes = {}

local function PlaceStoredArchetypes()
    for _, storedArchetype in pairs(clonedArchetypes) do
        local placedArchetype = PlaceObj('AIArchetype', storedArchetype)

    end
end


local function cloneArchetype(originalArchetype)
    local clonedArchetype = {}


    for key, value in pairs(originalArchetype) do
        if key ~= "SignatureActions" then
            clonedArchetype[key] = value
        end
    end


    clonedArchetype.SignatureActions = {}
    for _, action in ipairs(originalArchetype.SignatureActions) do
        if not (action.action_id and 
            (action.action_id == "AutoFire" 
            or action.action_id == "BurstFire"
            or action.action_id == "RunAndGun")) then
            table.insert(clonedArchetype.SignatureActions, action)
        end
    end


    clonedArchetype.id = clonedArchetype.id .. "_SingleShot"

    return clonedArchetype
end

local function storeUniqueArchetype(archetype)

    if not clonedArchetypes[archetype.id] then
        clonedArchetypes[archetype.id] = archetype
    end
end

function rat_archetype()
    ForEachPreset("AIArchetype", function(originalArchetype)
        for _, action in ipairs(originalArchetype.SignatureActions) do
            if (action.action_id and 
                (action.action_id == "AutoFire" 
                or action.action_id == "BurstFire"
                or action.action_id == "RunAndGun")) then

                local clonedArchetype = cloneArchetype(originalArchetype)


                storeUniqueArchetype(clonedArchetype)
				print("Stored")

            end
        end
    end)

   
    print("Stored Archetypes:")
    for _, storedArchetype in pairs(clonedArchetypes) do
        print("    Archetype ID:", storedArchetype.id)
    end
	
	
	PlaceStoredArchetypes()
	
end


rat_archetype()




function OnMsg.UnitEnterCombat(unit)
	local archetype = unit.current_archetype or false
	local ui_actions = unit.ui_actions or false

	--print("here")
	--local weapon = unit:GetActiveWeapons()
	--print("w", weapon)
	
	
	local hasBurstOrRunAndGun = false
    
    for _, uiAction in ipairs(ui_actions) do
		--print("ui action", uiAction)
        if uiAction == "BurstFire" or uiAction == "RunAndGun" then
            hasBurstOrRunAndGun = true
            break
        else
			--print("no rungun burst")
		end
    end
	
	
	-- print(unit.id, "####################")
	-- print_i_list(ui_actions)
	-- print("####################")
	
	if hasBurstOrRunAndGun == true then
		print("has burst")
		return
		
	end
	ForEachPreset("AIArchetype", function(a)
		if a.id == archetype then
			for _, action in ipairs(a.SignatureActions) do
				if (action.action_id and 
					(action.action_id == "AutoFire" 
					or action.action_id == "BurstFire"
					or action.action_id == "RunAndGun")) then
						local new_archetype = archetype .. "_SingleShot"
						local get_archetype_func = unit.PickCustomArchetype
						print("Ar", get_archetype_func)
						unit.current_archetype = new_archetype
						-- print("archetype", unit.current_archetype)
						-- print("semi auto archetype selected")
				end
			end
		end
	end)
end]]

--unit.ui_actions

-- function Unit:StartAI(debug_data, forced_behavior)
  -- if not IsValid(self) or self:IsDead() or self.ai_context or self:HasStatusEffect("Unconscious") then
    -- return
  -- end
  -- AIReloadWeapons(self)
  -- local proto_context = {}
  -- self:SelectArchetype(proto_context)
  -- local archetype = self:GetArchetype()
  -- local scores, available = {}, {}
  -- local total = 0
  -- AIUpdateBiases()
  -- for i, behavior in ipairs(archetype.Behaviors) do
    -- local weight_mod, disable, priority
    -- if behavior:MatchUnit(self) then
      -- weight_mod, disable, priority = AIGetBias(behavior.BiasId, self)
      -- priority = priority or behavior.Priority
    -- else
      -- weight_mod, disable, priority = 0, true, false
    -- end
    -- if debug_data then
      -- debug_data.behaviors = debug_data.behaviors or {}
      -- debug_data.behaviors[i] = {
        -- name = behavior:GetEditorView(),
        -- priority = priority,
        -- disable = disable,
        -- behavior = behavior,
        -- index = i
      -- }
    -- end
	
	------------------------------
	
	
	-- local actions_rat = 
	
	-- if self then
		-- local actions = self.ui_actions
		-- local attack_type = behavior.action_id
		-- print("actions", actions)
		-- print("attack_type", attack_type)
	-- end
	
	
	
	
	-----------------------------
	
	
	
	
	
    -- if not disable then
      -- local score = MulDivRound(behavior:Score(self, proto_context, debug_data), weight_mod, 100)
      -- if debug_data then
        -- debug_data.behaviors[i].score = score
      -- end
      -- if 0 < score then
        -- if priority and not forced_behavior then
          -- forced_behavior = behavior
          -- break
        -- end
        -- scores[#scores + 1] = score
        -- available[#available + 1] = behavior
        -- total = total + score
      -- end
    -- end
  -- end
  -- if total == 0 and not forced_behavior then
    -- printf("unit of %s archetype failed to select a behavior!", archetype.id)
    -- return
  -- end
  -- local roll = InteractionRand(total, "AIBehavior", self)
  -- local selected
  -- if not forced_behavior then
    -- for i, behavior in ipairs(available) do
      -- local score = scores[i]
      -- if roll <= score then
        -- selected = behavior
        -- break
      -- end
      -- roll = roll - score
    -- end
  -- end
  -- if self.ai_context then
    -- self.ai_context.behavior = forced_behavior or selected or available[#available]
  -- else
    -- proto_context.behavior = forced_behavior or selected or available[#available]
    -- AICreateContext(self, proto_context)
  -- end
  -- if self.ai_context.behavior then
    -- self.ai_context.behavior:OnStart(self)
  -- end
  -- return true
-- end

