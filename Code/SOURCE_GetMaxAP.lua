
-----ClassDef-Zulu.generated.lua

function UnitProperties:GetMaxActionPoints()
	local level = self:GetLevel()
	--return ((3 + self:GetProperty("Agility") / 10) + (level / 3)) * const.Scale.AP
	---
	return ((3 + self:GetProperty("Agility") / 10) + (level / 3) + (const.Combat.R_ExtraAP or 0)) * const.Scale.AP
	---
end