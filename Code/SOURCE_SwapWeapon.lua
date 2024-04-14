function Unit:SwapActiveWeapon(action_id, cost_ap)
	local igi = GetInGameInterfaceModeDlg()
	if IsKindOf(igi, "IModeCombatBase") and igi.attacker == self then
		InvokeShortcutAction(igi, "ExitAttackMode", igi)
	end

	if self.current_weapon == "Handheld A" then
		self.current_weapon = "Handheld B"
	else
		self.current_weapon = "Handheld A"
	end
	
	------
	self:RemoveStatusEffect("Rat_recoil", "all")
	self:RemoveStatusEffect("shooting_stance")
	------
	
	
	self:OnSetActiveWeapon(action_id, cost_ap)
end
