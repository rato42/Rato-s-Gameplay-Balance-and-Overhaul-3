UndefineClass('shoot_move')
DefineClass.shoot_move = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	msg_reactions = {
		PlaceObj('MsgActorReaction', {
			ActorParam = "attacker",
			Event = "Attack",
			Handler = function (self, action, results, attack_args, combat_starting, attacker, target)
				local reaction_def = (self.msg_reactions or empty_table)[1]
				if self:VerifyReaction("Attack", reaction_def, attacker, action, results, attack_args, combat_starting, attacker, target) then
					attacker:RemoveStatusEffect("shoot_move")
				end
			end,
			HandlerCode = function (self, action, results, attack_args, combat_starting, attacker, target)
				attacker:RemoveStatusEffect("shoot_move")
			end,
		}),
	},
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcFreeMove",
			Handler = function (self, target, data)
				data.mul = MulDivRound(data.mul, const.Combat.ShootMoveSMGorHandgun_FreeMoveMul, 100)
			end,
		}),
	},
	Modifiers = {},
	DisplayName = T(353011297055, --[[ModItemCharacterEffectCompositeDef shoot_move DisplayName]] "#you shouldnt be seeing this, msg rato, light stock effect"),
	Description = "",
	OnAdded = function (self, obj)
		if g_Combat then
			obj:AddStatusEffect("FreeMove")
		elseif g_StartingCombat then
			obj:AddStatusEffect("FreeMoveOnCombatStart")
		end
	end,
	lifetime = "Until End of Turn",
	Icon = "UI/Icons/Perks/BreachAndClear",
}

