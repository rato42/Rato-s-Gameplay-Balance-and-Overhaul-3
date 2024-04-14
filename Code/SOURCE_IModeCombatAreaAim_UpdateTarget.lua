function IModeCombatAreaAim:UpdateTarget(...)
	local canTarget = self.action.IsTargetableAttack
	if self.action.id == "Overwatch" then
		local apCost = self.action:GetAPCost(SelectedObj)
		SetAPIndicator(apCost > 0 and apCost or false, "attack")
	elseif self.action.id == "MGRotate" then
		local apCost = self.action:GetAPCost(SelectedObj)
		SetAPIndicator(apCost > 0 and apCost or false, "attack")
		-----
	elseif self.action.id == "R_PrepareWeapon" then
		local apCost = self.action:GetAPCost(SelectedObj)
		SetAPIndicator(apCost > 0 and apCost or false, "attack")
	end
	---------------------
	local unit = SelectedObj
	if IsKindOf(unit, "Unit") then
		unit:RecalcUIActions(true)
	end
	ObjModified(APIndicator)

	--------------------
	if not canTarget then
		return
	end
	
	IModeCombatAttackBase.UpdateTarget(self, ...)
end


----ok
