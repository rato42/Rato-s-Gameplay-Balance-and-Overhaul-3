UndefineClass('wounded_Test')
DefineClass.wounded_Test = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	msg_reactions = {},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnStatusEffectAdded",
			Handler = function (self, target, id, stacks)
				if self.class == id then
					-- handle add/remove stacks
					RecalcMaxHitPoints(target)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnStatusEffectRemoved",
			Handler = function (self, target, id, stacks_remaining)
				if self.class == id and stacks_remaining > 0 then
					-- handle add/remove stacks
					RecalcMaxHitPoints(target)	
				end
			end,
		}),
	},
	DisplayName = T(266755219257, --[[ModItemCharacterEffectCompositeDef wounded_Test DisplayName]] "Wounded"),
	Description = T(509462874890, --[[ModItemCharacterEffectCompositeDef wounded_Test Description]] "Maximum <color EmStyle>HP reduced by <MaxHpReductionPerStack></color> per wound. Cured by the <color EmStyle>Treat Wounds</color> Operation in the Sat View.\n\n<hide>Wounds also progressively impair <color EmStyle>Accuracy</color> and <color EmStyle>Free Move</color> due to the Heavy Wounds game rule.</hide>"),
	OnAdded = function (self, obj)
		RecalcMaxHitPoints(obj)
		
		if not IsKindOf(obj, "Unit") then
			return
		end
		
		if not obj:HasStainType("Blood") then
			local spot = obj:GetEffectValue("wounded_stain_spot")
			if spot then
				obj:AddStain("Blood", spot)
			end
		end
		
		if not obj.wounded_this_turn and GameState.Heat then
			if not RollSkillCheck(obj, "Health") then
				obj:ChangeTired(1)
			end
		end
		local attackObj = obj.hit_this_turn and obj.hit_this_turn[#obj.hit_this_turn]
		local friendlyFire = attackObj and attackObj.team and obj.team and attackObj.team :IsAllySide(obj.team)
		local effect = obj:GetStatusEffect("Wounded")
		if effect.stacks >= 4 and obj:IsMerc() and not friendlyFire then
			PlayVoiceResponse(obj, "SeriouslyWounded")
		elseif not friendlyFire then
			PlayVoiceResponse(obj, "Wounded")
		end
		obj.wounded_this_turn = true
	end,
	OnRemoved = function (self, obj)
		RecalcMaxHitPoints(obj)
		if obj:IsKindOf("Unit") and not obj:IsDead() then
			obj:ClearStains("Blood")
		end
	end,
	type = "Debuff",
	Icon = "UI/Hud/Status effects/wounded",
	max_stacks = 999,
	Shown = true,
	ShownSatelliteView = true,
}

