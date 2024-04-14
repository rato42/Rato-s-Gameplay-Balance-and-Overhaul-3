UndefineClass('grunty_bonus')
DefineClass.grunty_bonus = {
	__parents = { "CharacterEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "CharacterEffect",
	msg_reactions = {
		PlaceObj('MsgActorReaction', {
			ActorParam = "attacker",
			Event = "Attack",
			Handler = function (self, action, results, attack_args, combat_starting, attacker, target)
				local reaction_def = (self.msg_reactions or empty_table)[1]
				if self:VerifyReaction("Attack", reaction_def, attacker, action, results, attack_args, combat_starting, attacker, target) then
					attacker:RemoveStatusEffect("grunty_bonus")
				end
			end,
			HandlerCode = function (self, action, results, attack_args, combat_starting, attacker, target)
				attacker:RemoveStatusEffect("grunty_bonus")
			end,
		}),
	},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcChanceToHit",
			Handler = function (self, target, attacker, action, attack_target, weapon1, weapon2, data)
				if target == attacker then
					local gruntybonus = {id = "grunty_bonus", name = T{"Perk: Grunty"}, value = 10}
					table.insert(data.modifiers, gruntybonus)
					data.mod_add = data.mod_add +10
				end
			end,
		}),
	},
}

