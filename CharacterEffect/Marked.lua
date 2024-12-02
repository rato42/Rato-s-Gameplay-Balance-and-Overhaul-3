UndefineClass('Marked')
DefineClass.Marked = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	msg_reactions = {
		PlaceObj('MsgActorReaction', {
			ActorParam = "target",
			Event = "DamageTaken",
			Handler = function (self, attacker, target, dmg, hit_descr)
				local reaction_def = (self.msg_reactions or empty_table)[1]
				if self:VerifyReaction("DamageTaken", reaction_def, target, attacker, target, dmg, hit_descr) then
					--if IsKindOf(attacker, "Unit") and hit_descr.critical then
					--target:RemoveStatusEffect("Marked")
				--end
				end
			end,
			HandlerCode = function (self, attacker, target, dmg, hit_descr)
				--if IsKindOf(attacker, "Unit") and hit_descr.critical then
					--target:RemoveStatusEffect("Marked")
				--end
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "unit",
			Event = "UnitBeginTurn",
			Handler = function (self, unit)
				local reaction_def = (self.msg_reactions or empty_table)[2]
				if self:VerifyReaction("UnitBeginTurn", reaction_def, unit, unit) then
					unit:RemoveStatusEffect("Marked")
				end
			end,
			HandlerCode = function (self, unit)
				unit:RemoveStatusEffect("Marked")
			end,
		}),
		PlaceObj('MsgActorReaction', {
			ActorParam = "target",
			Event = "GatherCritChanceModifications",
			Handler = function (self, attacker, target, action_id, weapon, data)
				local reaction_def = (self.msg_reactions or empty_table)[3]
				if self:VerifyReaction("GatherCritChanceModifications", reaction_def, target, attacker, target, action_id, weapon, data) then
					data.crit_chance = data.crit_chance + 15
				end
			end,
			HandlerCode = function (self, attacker, target, action_id, weapon, data)
				data.crit_chance = data.crit_chance + 15
			end,
		}),
	},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcChanceToHit",
			Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
				if target == attack_target then
					local value_mod = 10
					local markedcth = {id = "markedcth", name = T{"Marked"}, value = value_mod}
						data.mod_add = data.mod_add + value_mod
					if data.modifiers then
						table.insert(data.modifiers, markedcth)
					end
				
				end
			end,
		}),
	},
	DisplayName = T(951132865971, --[[ModItemCharacterEffectCompositeDef Marked DisplayName]] "Marked"),
	Description = T(700991940591, --[[ModItemCharacterEffectCompositeDef Marked Description]] "Attacks against the unit have increased <color EmStyle>Accuracy</color> and chance to score a <color EmStyle>Critical Hit</color>. "),
	AddEffectText = T(655587146312, --[[ModItemCharacterEffectCompositeDef Marked AddEffectText]] "<color EmStyle><DisplayName></color> is marked"),
	RemoveEffectText = T(265057968990, --[[ModItemCharacterEffectCompositeDef Marked RemoveEffectText]] "<color EmStyle><DisplayName></color> is no longer marked"),
	type = "Debuff",
	lifetime = "Until End of Turn",
	Icon = "UI/Hud/Status effects/marked",
	RemoveOnEndCombat = true,
	Shown = true,
}

