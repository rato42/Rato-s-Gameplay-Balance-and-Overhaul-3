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
				
				if not g_Combat then
					unit:RemoveStatusEffect("shooting_stance")
				end
				
				DestroyStanceConeV(unit)
				end
			end,
			HandlerCode = function (self, unit, target, toDoStance)
				unit.return_pos_reserved = false
				
				if not g_Combat then
					unit:RemoveStatusEffect("shooting_stance")
				end
				
				DestroyStanceConeV(unit)
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "unit",
			Event = "UnitDowned",
			Handler = function (self, unit)
				local reaction_def = (self.msg_reactions or empty_table)[2]
				if self:VerifyReaction("UnitDowned", reaction_def, unit, unit) then
					unit:RemoveStatusEffect("shooting_stance")
				DestroyStanceConeV(unit)
				end
			end,
			HandlerCode = function (self, unit)
				unit:RemoveStatusEffect("shooting_stance")
				DestroyStanceConeV(unit)
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "obj",
			Event = "StatusEffectRemoved",
			Handler = function (self, obj, id, stacks, reason)
				local reaction_def = (self.msg_reactions or empty_table)[3]
				if self:VerifyReaction("StatusEffectRemoved", reaction_def, obj, obj, id, stacks, reason) then
					if id == "shooting_stance"  and obj and IsKindOf(obj, "Unit") then
					if HasPerk(obj,"Rat_recoil") then
						obj:RemoveStatusEffect("Rat_recoil", "all")
					end
					
					DestroyStanceConeV(obj)
					
					obj.return_pos = obj.return_pos_reserved
					obj.return_pos_reserved = false
				
				    obj:InterruptPreparedAttack()
				end
				end
			end,
			HandlerCode = function (self, obj, id, stacks, reason)
				if id == "shooting_stance"  and obj and IsKindOf(obj, "Unit") then
					if HasPerk(obj,"Rat_recoil") then
						obj:RemoveStatusEffect("Rat_recoil", "all")
					end
					
					DestroyStanceConeV(obj)
					
					obj.return_pos = obj.return_pos_reserved
					obj.return_pos_reserved = false
				
				    obj:InterruptPreparedAttack()
				end
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "obj",
			Event = "ItemRemoved",
			Handler = function (self, obj,item, slot_name, pos)
				local reaction_def = (self.msg_reactions or empty_table)[4]
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
			Event = "OnCalcMinAimActions",
			Handler = function (self, target, value, attacker, attack_target, action, weapon)
				
						if target == attacker  and not target.AI_dont_return_Stance_min_aim_level then
				          return value + 1
				        end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnEndTurn",
			Handler = function (self, target)
				local ap_carried = Min(self:ResolveValue("MaxAPCarried") * const.Scale.AP,target.ActionPoints)
				local text_ap = MulDivRound(ap_carried, 1, const.Scale.AP)
				if ap_carried > 950 then
					if text_ap and text_ap > 0 and not R_IsAI(target) then
						text_ap = "<scale 600>"  .. text_ap .. " AP reserved"
						CreateFloatingText(target:GetPos(),  T(text_ap))
					end
					self:SetParameter("AP_Carried",ap_carried)
				end
				
				
				----- visual
				DestroyStanceConeV(target)
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
		PlaceObj('UnitReaction', {
			Event = "OnStatusEffectAdded",
			Handler = function (self, target, id, stacks)
				if id == "Protected" then
					target:RemoveStatusEffect("shooting_stance")
				end
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

