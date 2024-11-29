UndefineClass('R_outofbreath')
DefineClass.R_outofbreath = {
	__parents = { "StatusEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "StatusEffect",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcStartTurnAP",
			Handler = function (self, target, value)
				local reduc = self:ResolveValue("ap_loss") * self.stacks * const.Scale.AP
				
				
				return value + reduc
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnCalcFreeMove",
			Handler = function (self, target, data)
				local reduc= 100 - (50 * self.stacks)
				
				data.mul = reduc
			end,
		}),
	},
	Modifiers = {},
	DisplayName = T(373983661042, --[[ModItemCharacterEffectCompositeDef R_outofbreath DisplayName]] "Out of Breath"),
	Description = T(981332796704, --[[ModItemCharacterEffectCompositeDef R_outofbreath Description]] "Penalty of <color EmStyle><ap_loss></color> per stack is applied to your maximum AP. Reduces <color EmStyle>Free Move AP</color> per stack. Recovers in the next turn."),
	AddEffectText = T(132260163193, --[[ModItemCharacterEffectCompositeDef R_outofbreath AddEffectText]] "<color EmStyle><DisplayName></color> is out of breath"),
	OnAdded = function (self, obj)
		obj:RemoveStatusEffect("FreeMove")
	end,
	type = "Debuff",
	lifetime = "Until End of Next Turn",
	Icon = "UI/Hud/Status effects/tired",
	max_stacks = 2,
	RemoveOnEndCombat = true,
	RemoveOnSatViewTravel = true,
	RemoveOnCampaignTimeAdvance = true,
	Shown = true,
	ShownSatelliteView = true,
	HasFloatingText = true,
}

