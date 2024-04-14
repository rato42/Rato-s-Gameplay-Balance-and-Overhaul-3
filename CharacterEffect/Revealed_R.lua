UndefineClass('Revealed_R')
DefineClass.Revealed_R = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	msg_reactions = {
		PlaceObj('MsgActorReaction', {
			ActorParam = "target",
			Event = "GatherCTHModifications",
			Handler = function (self, attacker, cth_id, action_id, target, weapon1, weapon2, data)
				local reaction_def = (self.msg_reactions or empty_table)[1]
				if self:VerifyReaction("GatherCTHModifications", reaction_def, target, attacker, cth_id, action_id, target, weapon1, weapon2, data) then
					if cth_id == "Darkness" then
					data.mod_mul = 50
				end
				end
			end,
			HandlerCode = function (self, attacker, cth_id, action_id, target, weapon1, weapon2, data)
				if cth_id == "Darkness" then
					data.mod_mul = 50
				end
			end,
		}),
	},
	Conditions = {
		PlaceObj('OR', {
			Conditions = {
				PlaceObj('CheckGameState', {
					GameState = "Underground",
				}),
				PlaceObj('CheckGameState', {
					GameState = "Night",
				}),
			},
		}),
	},
	DisplayName = T(578915441971, --[[ModItemCharacterEffectCompositeDef Revealed_R DisplayName]] "Revealed"),
	Description = T(283258611358, --[[ModItemCharacterEffectCompositeDef Revealed_R Description]] "This unit has had its position revealed. Attacks against it <color EmStyle>In the dark</color> only suffer half the normal penalty. "),
	AddEffectText = T(926321942272, --[[ModItemCharacterEffectCompositeDef Revealed_R AddEffectText]] "<color EmStyle><DisplayName></color> is revealed"),
	RemoveEffectText = T(281710807919, --[[ModItemCharacterEffectCompositeDef Revealed_R RemoveEffectText]] "<color EmStyle><DisplayName></color> is no longer revealed"),
	type = "Debuff",
	lifetime = "Until End of Next Turn",
	Icon = "Mod/cfahRED/Images/revealed3.png",
	RemoveOnEndCombat = true,
	Shown = true,
}

