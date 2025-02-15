UndefineClass('AdrenalineRush_Savior')
DefineClass.AdrenalineRush_Savior = {
	__parents = { "CharacterEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	object_class = "CharacterEffect",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCalcFreeMove",
			Handler = function (self, target, data)
				data.mul = MulDivRound(data.mul or 100, const.Combat.Perks.SaviorAdrenalineRushFreeMoveMul, 100)
				data.add = (data.add  or 0 ) + const.Combat.Perks.SaviorAdrenalineRushFreeMoveBonus
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnEndTurn",
			Handler = function (self, target)
				if self:ResolveValue("applied") then
					target:RemoveStatusEffect(self.class)
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnBeginTurn",
			Handler = function (self, target)
				if not self:ResolveValue("applied") then
					target:GainAP(const.Combat.Perks.SaviorAdrenalineRushBonusAP * const.Scale.AP)
					self:SetParameter("applied", true)
				end
			end,
		}),
	},
	DisplayName = T(899715108608, --[[ModItemCharacterEffectCompositeDef AdrenalineRush_Savior DisplayName]] "Adrenaline Rush"),
	Description = T(861022314793, --[[ModItemCharacterEffectCompositeDef AdrenalineRush_Savior Description]] "This character is in an adrenaline rush and has bonus AP and Free Move."),
	AddEffectText = T(326681280446, --[[ModItemCharacterEffectCompositeDef AdrenalineRush_Savior AddEffectText]] "<em><DisplayName></em> is rushed"),
	OnAdded = function (self, obj)
		if g_Combat and g_Teams[g_CurrentTeam] == obj.team then
			obj:GainAP(const.Combat.Perks.SaviorAdrenalineRushBonusAP * const.Scale.AP)
			obj:RemoveStatusEffect("FreeMove")
			obj:AddStatusEffect("FreeMove")
			self:SetParameter("applied", true)
		end
	end,
	type = "Buff",
	lifetime = "Until End of Turn",
	Icon = "UI/Hud/Status effects/inspired",
	RemoveOnEndCombat = true,
	RemoveOnSatViewTravel = true,
	RemoveOnCampaignTimeAdvance = true,
	Shown = true,
	HasFloatingText = true,
}

