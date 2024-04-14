local add_weapon_attacks = function(actions, unit, weapon)
  if IsKindOf(weapon, "MachineGun") and not unit:HasStatusEffect("StationedMachineGun") then
    table.insert_unique(actions, "MGSetup")
  elseif IsKindOf(weapon, "HeavyWeapon") then
    table.insert_unique(actions, weapon:GetBaseAttack())
  elseif IsKindOf(weapon, "Firearm") then
    for _, id in ipairs(weapon.AvailableAttacks or empty_table) do
      table.insert_unique(actions, id)
    end
  elseif IsKindOf(weapon, "MeleeWeapon") then
    if weapon.Charge then
      table.insert_unique(actions, "Charge")
    else
      table.insert_unique(actions, "Brutalize")
    end
  elseif not weapon then
    table.insert_unique(actions, "Brutalize")
  end
end

function Unit:EnumUIActions()
  local actions = {}
  if g_Combat or IsUnitPrimarySelectionCoOpAware(self) and not g_Overwatch[self] then
    local action = self:GetDefaultAttackAction()
    actions[1] = action.id
    local main_weapon, offhand_weapon = self:GetActiveWeapons()
    add_weapon_attacks(actions, self, main_weapon)
    if IsKindOf(main_weapon, "FlareGun") or IsKindOf(offhand_weapon, "FlareGun") then
      add_weapon_attacks(actions, self, offhand_weapon)
    end
    if self:GetThrowableKnife() then
      actions[#actions + 1] = "KnifeThrow"
    end
    if table.find(actions, "DualShot") then
      table.insert_unique(actions, "LeftHandShot")
      table.insert_unique(actions, "RightHandShot")
    end
	

	
	
	
	
	
    if IsKindOf(main_weapon, "FirearmBase") then
		
      for slot, sub in sorted_pairs(main_weapon.subweapons) do
        add_weapon_attacks(actions, self, sub)
      end
	  
	--[[  local function removeByValue(tbl, value)
    for i = #tbl, 1, -1 do
        if tbl[i] == value then
            table.remove(tbl, i)
        end
    end
end
	  if IsKindOf(main_weapon, "Shotgun") and main_weapon.slug_rat >0 then
		table.insert_unique(actions, "SingleShot")
		removeByValue(actions, "Buckshot")
	
	end]]
		-- local desiredIndex = 2 -- Index where "BurstFire" should be inserted

		-- if main_weapon:HasComponent("Enable_BurstFire") then
			-- local burstFireIndex = nil

			-- for i, action in ipairs(actions) do
				-- if action == "BurstFire" then
					-- burstFireIndex = i
					-- break
				-- end
			-- end

			-- if burstFireIndex then
				-- table.remove(actions, burstFireIndex)
				-- table.insert(actions, 1, "BurstFire")
			-- end
			
		-- end
		
		
      if main_weapon:HasComponent("EnableFullAuto") then
        table.insert_unique(actions, "AutoFire")
      end
	  
	  -------------------------------------
	  if main_weapon:HasComponent("Enable_RunAndGun") then
        table.insert_unique(actions, "RunAndGun")
      end





	  -------------------------------------

	  
	  --print("actions", actions)
	  
	  --------------------------------------
	  
    end
    if #actions == 0 then
      actions[1] = "UnarmedAttack"
    end
  end
  for _, skill in ipairs(Presets.CombatAction.SignatureAbilities) do
    local id = skill.id
    if string.match(id, "DoubleToss") then
      id = "DoubleToss"
    end
    if id and self:HasStatusEffect(id) then
      actions[#actions + 1] = skill.id
    end
  end
  ForEachPresetInGroup("CombatAction", "Default", function(def)
    actions[#actions + 1] = def.id
  end)
  if g_Combat or IsUnitPrimarySelectionCoOpAware(self) then
    if self:GetItemInSlot("Handheld A", "Grenade", 1, 1) then
      actions[#actions + 1] = "ThrowGrenadeA"
    end
    if self:GetItemInSlot("Handheld A", "Grenade", 2, 1) then
      actions[#actions + 1] = "ThrowGrenadeB"
    end
    if self:GetItemInSlot("Handheld B", "Grenade", 1, 1) then
      actions[#actions + 1] = "ThrowGrenadeC"
    end
    if self:GetItemInSlot("Handheld B", "Grenade", 2, 1) then
      actions[#actions + 1] = "ThrowGrenadeD"
    end
    if GetUnitEquippedMedicine(self) then
      actions[#actions + 1] = "Bandage"
    end
    if GetUnitEquippedDetonator(self) then
      actions[#actions + 1] = "RemoteDetonation"
    end
  end
  actions[#actions + 1] = "ItemSkills"

  return actions
end


--ok


-- function CalcMobileShotAttacks(attacker, action, attack_pos, enemies, weapon)
  -- enemies = enemies or action:GetTargets({attacker})
  -- weapon = weapon or action:GetAttackWeapons(attacker)
  -- local aim_type = action.AimType
  -- if aim_type ~= "mobile" then
    -- return
  -- end
  -- local aim_params = action:GetAimParams(attacker, weapon)
  
  -----------
  -- print(action)
  ------------
  
  
  
  -- local combat_path = CombatPath:new()
  -- combat_path:RebuildPaths(attacker, aim_params.move_ap, nil, "Standing", nil, nil, action.id)
  -- local voxel_path = combat_path:GetCombatPathFromPos(attack_pos)
  -- if not voxel_path then
    -- DoneObject(combat_path)
    -- return
  -- end
  -- local shot_voxel_candidates = {}
  -- local path = {}
  -- for i, voxel in ipairs(voxel_path) do
    -- path[i] = point(point_unpack(voxel))
  -- end
  -- local path_voxels, voxel_dist, total_dist = CalcPathVoxels(path)
  -- local atk_voxel = point_pack(attack_pos)
  -- if path_voxels[1] ~= atk_voxel then
    -- table.insert(path_voxels, 1, atk_voxel)
  -- end
  -- shot_voxel_candidates[1] = {atk_voxel}
  -- local num_shots = aim_params.num_shots
  -- local step = #path_voxels / Max(1, num_shots)
  -- for i = 2, num_shots do
    -- local idx = 1 + step * (i - 1)
    -- table.insert(shot_voxel_candidates, 1, {
      -- path_voxels[idx],
      -- path_voxels[idx - 1],
      -- path_voxels[idx + 1]
    -- })
  -- end
  -- local shot_voxels, targets, shot_cth, shot_canceling_reason = {}, {}, {}, {}
  -- for i, candidates in ipairs(shot_voxel_candidates) do
    -- shot_voxels[i] = false
    -- targets[i] = false
    -- for _, voxel in ipairs(candidates) do
      -- if not table.find_value(shot_voxels, voxel) then
        -- local pos = point(point_unpack(voxel))
        -- local target, cth, canceling_reason = FindTargetFromPos(action.id, attacker, action, enemies, pos, weapon, i == #shot_voxel_candidates)
        -- if target then
          -- shot_voxels[i] = voxel
          -- targets[i] = target
          -- shot_cth[i] = cth
          -- shot_canceling_reason[i] = canceling_reason
          -- break
        -- end
      -- end
    -- end
  -- end
  -- DoneObject(combat_path)
  -- return shot_voxels, targets, shot_cth, shot_canceling_reason
-- end
