-- ========== _357MAG ==========

function GBO_357MAG()
	print("GBO _357MAG ...")

	_357MAG_AP.Cost = 180
	_357MAG_AP.AdditionalHint = T({ "" }) -- TODO
	_357MAG_AP.Modifications = {} -- TODO
	_357MAG_AP.AppliedEffects = {} -- TODO

	_357MAG_Basic.Cost = 90
	_357MAG_Basic.AdditionalHint = T({ "" }) -- TODO
	_357MAG_Basic.Modifications = {} -- TODO
	_357MAG_Basic.AppliedEffects = {} -- TODO

	_357MAG_HP.Cost = 180
	_357MAG_HP.AdditionalHint = T({ "" }) -- TODO
	_357MAG_HP.Modifications = {} -- TODO
	_357MAG_HP.AppliedEffects = {} -- TODO

	_357MAG_Match.Cost = 180
	_357MAG_Match.AdditionalHint = T({ "" }) -- TODO
	_357MAG_Match.Modifications = {} -- TODO
	_357MAG_Match.AppliedEffects = {} -- TODO

	print("GBO _357MAG DONE")
end

OnMsg.ClassesGenerate = GBO_357MAG

