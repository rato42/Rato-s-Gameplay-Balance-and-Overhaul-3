UndefineClass('shooting_stance')
DefineClass.shooting_stance = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	msg_reactions = {
		PlaceObj('MsgActorReaction', {
			ActorParam = "unit",
			Event = "UnitAnyMovementStart",
			Handler = function (self, unit, target, toDoStance)
				local reaction_def = (self.msg_reactions or empty_table)[1]
				if self:VerifyReaction("UnitAnyMovementStart", reaction_def, unit, unit, target, toDoStance) then
					unit.return_pos_reserved = false
				--if reserved_pos then
					--if target == reserved_pos then
						--unit.returning_to_cover = true
					--end
				--end
				if not g_Combat then
					unit:RemoveStatusEffect("shooting_stance")
				end
					if unit.shooter_cone_v then
						unit.shooter_cone_v:SetOpacity(0)
						unit.snap_cone:SetOpacity(0)
					end
				end
			end,
			HandlerCode = function (self, unit, target, toDoStance)
				unit.return_pos_reserved = false
				--if reserved_pos then
					--if target == reserved_pos then
						--unit.returning_to_cover = true
					--end
				--end
				if not g_Combat then
					unit:RemoveStatusEffect("shooting_stance")
				end
					if unit.shooter_cone_v then
						unit.shooter_cone_v:SetOpacity(0)
						unit.snap_cone:SetOpacity(0)
					end
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "obj",
			Event = "StatusEffectAdded",
			Handler = function (self, obj, id, stacks)
				local reaction_def = (self.msg_reactions or empty_table)[2]
				if self:VerifyReaction("StatusEffectAdded", reaction_def, obj, obj, id, stacks) then
					obj.auto_face =false
				
				local side = obj and obj.team and obj.team.side or ''
				if (side == 'player1' or side == 'player2') then
					--return
				end
				local ap_divida = obj.divida_stance_ap
				if ap_divida then
					obj:ConsumeAP(ap_divida)
					obj.divida_stance_ap = false
					ap_divida = false
					Msg("UnitAPChanged", obj)
				end
				
				--obj.aim_action_id = true
				--print("obj",obj)
				end
			end,
			HandlerCode = function (self, obj, id, stacks)
				obj.auto_face =false
				
				local side = obj and obj.team and obj.team.side or ''
				if (side == 'player1' or side == 'player2') then
					--return
				end
				local ap_divida = obj.divida_stance_ap
				if ap_divida then
					obj:ConsumeAP(ap_divida)
					obj.divida_stance_ap = false
					ap_divida = false
					Msg("UnitAPChanged", obj)
				end
				
				--obj.aim_action_id = true
				--print("obj",obj)
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "unit",
			Event = "CombatActionEnd",
			Handler = function (self, unit)
				local reaction_def = (self.msg_reactions or empty_table)[3]
				if self:VerifyReaction("CombatActionEnd", reaction_def, unit, unit) then
					local side = unit and unit.team and unit.team.side or ''
				if not (side == 'player1' or side == 'player2') then
					return
				end
				
				--if == "Reload" then
					--unit:RemoveStatusEffect("shooting_stance")
				--end
				end
			end,
			HandlerCode = function (self, unit)
				local side = unit and unit.team and unit.team.side or ''
				if not (side == 'player1' or side == 'player2') then
					return
				end
				
				--if == "Reload" then
					--unit:RemoveStatusEffect("shooting_stance")
				--end
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "unit",
			Event = "UnitDowned",
			Handler = function (self, unit)
				local reaction_def = (self.msg_reactions or empty_table)[4]
				if self:VerifyReaction("UnitDowned", reaction_def, unit, unit) then
					unit:RemoveStatusEffect("shooting_stance")
				    if not unit.shooter_cone_v then
				        return
				    end
				   	DoneObject(obj.shooter_cone_v)
				    obj.shooter_cone_v = nil
				   	DoneObject(obj.snap_cone)
				    obj.snap_cone = nil
				end
			end,
			HandlerCode = function (self, unit)
				unit:RemoveStatusEffect("shooting_stance")
				    if not unit.shooter_cone_v then
				        return
				    end
				   	DoneObject(obj.shooter_cone_v)
				    obj.shooter_cone_v = nil
				   	DoneObject(obj.snap_cone)
				    obj.snap_cone = nil
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "obj",
			Event = "StatusEffectRemoved",
			Handler = function (self, obj, id, stacks, reason)
				local reaction_def = (self.msg_reactions or empty_table)[5]
				if self:VerifyReaction("StatusEffectRemoved", reaction_def, obj, obj, id, stacks, reason) then
					  if id == "shooting_stance" then
						
					if HasPerk(obj,"Rat_recoil") then
					
						obj:RemoveStatusEffect("Rat_recoil", "all")
					end
				   	DoneObject(obj.shooter_cone_v)
				    obj.shooter_cone_v = nil
				   	DoneObject(obj.snap_cone)
				    obj.snap_cone = nil
					
					obj.return_pos = obj.return_pos_reserved
					--obj:SetCommand("ReturnToCover") 
					obj.return_pos_reserved = false
					obj.shooting_target_pos = false
				    obj:InterruptPreparedAttack()
				    --obj:SetCommand("Idle")
				
				  end
				end
			end,
			HandlerCode = function (self, obj, id, stacks, reason)
				  if id == "shooting_stance" then
						
					if HasPerk(obj,"Rat_recoil") then
					
						obj:RemoveStatusEffect("Rat_recoil", "all")
					end
				   	DoneObject(obj.shooter_cone_v)
				    obj.shooter_cone_v = nil
				   	DoneObject(obj.snap_cone)
				    obj.snap_cone = nil
					
					obj.return_pos = obj.return_pos_reserved
					--obj:SetCommand("ReturnToCover") 
					obj.return_pos_reserved = false
					obj.shooting_target_pos = false
				    obj:InterruptPreparedAttack()
				    --obj:SetCommand("Idle")
				
				  end
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "obj",
			Event = "InventoryChange",
			Handler = function (self, obj)
				local reaction_def = (self.msg_reactions or empty_table)[6]
				if self:VerifyReaction("InventoryChange", reaction_def, obj, obj) then
					--local equip_wep = self:GetActiveWeapons()
				--print("eq wp", equip_wep)
				--print("self", self,"obj", obj)
				end
			end,
			HandlerCode = function (self, obj)
				--local equip_wep = self:GetActiveWeapons()
				--print("eq wp", equip_wep)
				--print("self", self,"obj", obj)
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "obj",
			Event = "ItemRemoved",
			Handler = function (self, obj,item, slot_name, pos)
				local reaction_def = (self.msg_reactions or empty_table)[7]
				if self:VerifyReaction("ItemRemoved", reaction_def, obj, obj,item, slot_name, pos) then
					local effect = obj:GetStatusEffect("shooting_stance")
				local slot = effect:ResolveValue("weapon1") or ''
				local slot2 = effect:ResolveValue("weapon2") or ''
				
				local slot_to_check = slot_name == "Handheld A" and 1 or slot_name == "Handheld B" and 2
				
				if (slot_to_check == slot or slot_to_check == slot2) and IsKindOf(item, "Firearm") then
					obj:RemoveStatusEffect("shooting_stance")
				end
				end
			end,
			HandlerCode = function (self, obj,item, slot_name, pos)
				local effect = obj:GetStatusEffect("shooting_stance")
				local slot = effect:ResolveValue("weapon1") or ''
				local slot2 = effect:ResolveValue("weapon2") or ''
				
				local slot_to_check = slot_name == "Handheld A" and 1 or slot_name == "Handheld B" and 2
				
				if (slot_to_check == slot or slot_to_check == slot2) and IsKindOf(item, "Firearm") then
					obj:RemoveStatusEffect("shooting_stance")
				end
			end,
		}),
	},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcChanceToHit",
			Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
				--[[local side = attacker and attacker.team and attacker.team.side or ''
				if not (side == 'player1' or side == 'player2') then
					print("AI bonus cth angle")
					local angle_s = ShootingConeAngle(self, attacker, weapon1, attack_target) 
					--print("angle", angle_s)
					local bonus_angle = cRound(10.0/(1+angle_s))
					data.mod_add = data.mod_add + bonus_angle
				end
				
				--print("d",data)]]
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcMinAimActions",
			Handler = function (self, target, value, attacker, attack_target, action, weapon)
				        if target == attacker then
				          return value + 1
				        end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnEndTurn",
			Handler = function (self, target)
				local ap_carried = Min(2000,target.ActionPoints)
				local text_ap = MulDivRound(ap_carried, 1, const.Scale.AP)
				if ap_carried > 950 then
					if text_ap and text_ap > 0 then
						text_ap = "<scale 600>"  .. text_ap .. " AP reserved"
						CreateFloatingText(target:GetPos(),  T(text_ap))
					end
					self:SetParameter("AP_Carried",ap_carried)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcStartTurnAP",
			Handler = function (self, target, value)
				local bonus = self:ResolveValue("AP_Carried") or 0 
				self:SetParameter("AP_Carried",0)
				
				return value + bonus
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCombatEnd",
			Handler = function (self, target)
				self:SetParameter("AP_Carried",0)
			end,
		}),
	},
	Modifiers = {},
	DisplayName = T(357872332596, --[[ModItemCharacterEffectCompositeDef shooting_stance DisplayName]] "Shooting Stance"),
	Description = T(731952370122, --[[ModItemCharacterEffectCompositeDef shooting_stance Description]] "This character has his weapon prepared to shoot. Gives 1 aim level to every attack. Changing weapons, going prone, taking too much damage, reloading or moving will remove this effect."),
	AddEffectText = T(537175194057, --[[ModItemCharacterEffectCompositeDef shooting_stance AddEffectText]] "Shooting Stance"),
	RemoveEffectText = T(790751756023, --[[ModItemCharacterEffectCompositeDef shooting_stance RemoveEffectText]] "Shooting Stance Removed"),
	OnAdded = function (self, obj)
		local wep, wep2 = obj:GetActiveWeapons()
		local slot = obj:GetEquippedWeaponSlot(wep)
		local slot2 = wep2 and obj:GetEquippedWeaponSlot(wep2) or false
		
		local effect = obj:GetStatusEffect("shooting_stance")
		effect:SetParameter("weapon1", slot == "Handheld A" and 1 or slot == "Handheld B" and 2)
		effect:SetParameter("weapon2", slot2 == "Handheld A" and 1 or slot2 == "Handheld B" and 2)
	end,
	Icon = "Mod/cfahRED/Images/stanceshoot2.png",
	RemoveOnSatViewTravel = true,
	RemoveOnCampaignTimeAdvance = true,
	Shown = true,
	HasFloatingText = true,
}

