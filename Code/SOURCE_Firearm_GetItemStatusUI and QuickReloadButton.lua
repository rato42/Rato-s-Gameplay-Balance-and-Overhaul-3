
----Weapon.lua

function Firearm:GetItemStatusUI()-- centered text
	
	if self:IsCondition("Broken") then
		return T(623193685060, "BROKEN")
	end
	if self.jammed then 
		return T(935110589090, "JAMMED")
	end
	---
	if self.unbolted then
		local text = unbolted_text(self)
		return T(text)
	end
	---
	return InventoryItem.GetItemStatusUI(self) -- locked item
end

-----UI/IModeCommonUnitControl.lua

function QuickReloadButton(parent, weapon, delayed_fx)
	local unit = SelectedObj
	---------------
	if weapon.unbolted then
		local ap_cost = rat_get_manual_cyclingAP(unit, weapon) * const.Scale.AP
		if unit:UIHasAP(ap_cost) then
		
			unit.ActionPoints = unit.ActionPoints - ap_cost
			CombatPathReset(unit)
			Msg("UnitAPChanged", unit)
			
			

				--PlayFX("WeaponReload", "start", weapon.class, weapon.class)
			
			weapon.unbolted = false
			ObjModified(weapon)
			ObjModified(unit)
		else
			CreateFloatingText(GetCursorPos(),  T(179344335298, "<color AmmoAPColor>INSUFFICIENT AP</color>"))
		end
		return true
	end
	
	-----------------------
	local wepIdx, ammo = GetQuickReloadWeaponAndAmmo(parent, weapon)
	if not wepIdx then return end
	CombatActions.Reload:Execute({unit}, { weapon = wepIdx, target = ammo.class, delayed_fx = delayed_fx, item_id = weapon and weapon.id })
	return true
end



---------------------------------------------------------------------------------------------------------

local t_id_table = {
[623193685060] = "BROKEN",
[935110589090] = "JAMMED",
[179344335298] = "<color AmmoAPColor>INSUFFICIENT AP</color>",
}

ratG_T_table['SOURCE_Firearm_GetItemStatusUI and QuickReloadButton.lua'] = t_id_table