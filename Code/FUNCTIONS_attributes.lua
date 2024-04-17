function rGetHandEyeCoordination(unit)
	local one = (unit.Marksmanship or 0) * 0.35
	local two = (unit.Dexterity or 0) * 0.65
	
	return cRound(one+two)
end

function rGetComposure(unit)
	local one = (unit.Marksmanship or 0) * 0.60
	local two = (unit.Wisdom or 0) * 0.40
	
	return cRound(one+two)
end

function rGetReflex(unit)
	local one = (unit.Agility or 0) * 0.50
	local two = (unit.Dexterity or 0) * 0.50
	
	return cRound(one+two)
end
