UndefineClass('GruntyPerk')
DefineClass.GruntyPerk = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	__copy_group = "Perk-Personal",
	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCombatStarting",
			Handler = function (self, target, load_game)
				if load_game then return end
				
				local enemy = target:GetClosestEnemy()
				if enemy then
					local weapon = target:GetActiveWeapons()
					if IsKindOf(weapon, "Firearm") and not IsKindOf(weapon, "HeavyWeapon") then
						local action = target:GetDefaultAttackAction("ranged")
						local args = {target = enemy, gruntyPerk = true}
						LockCameraMovement("grunty perk")
						StartCombatAction(action.id, target, 0, args)
					end
				end
			end,
		}),
		PlaceObj('UnitReaction', {
			Event = "OnFirearmAttackStart",
			Handler = function (self, target, attacker, attack_target, action, attack_args)
								if target == attacker and attack_args.gruntyPerk then
									attack_args.aim = 1
								end
			end,
		}),
	},
	DisplayName = T(501045968656, --[[ModItemCharacterEffectCompositeDef  DisplayName]] "Überraschung"),
	Description = T(179559207784, --[[ModItemCharacterEffectCompositeDef  Description]] "<color EmStyle>Attacks</color> the <color EmStyle>closest</color> enemy with a firearm when <color EmStyle>combat starts</color>, if possible.\n\nCan't be used with Heavy Weapons."),
	Icon = "UI/Icons/Perks/GruntyPerk",
	Tier = "Personal",
}

