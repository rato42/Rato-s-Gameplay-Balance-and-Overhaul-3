-- ========== _280British ==========

function GBO_280British()
	print("GBO _280British ...")

	_280British_AP.Cost = 180
	_280British_AP.AdditionalHint = T({ "" }) -- TODO
	_280British_AP.Modifications = {} -- TODO
	_280British_AP.AppliedEffects = {} -- TODO

	_280British_Basic.Cost = 90
	_280British_Basic.AdditionalHint = T({ "" }) -- TODO
	_280British_Basic.Modifications = {} -- TODO
	_280British_Basic.AppliedEffects = {} -- TODO

	_280British_HP.Cost = 180
	_280British_HP.AdditionalHint = T({ "" }) -- TODO
	_280British_HP.Modifications = {} -- TODO
	_280British_HP.AppliedEffects = {} -- TODO

	_280British_Match.Cost = 180
	_280British_Match.AdditionalHint = T({ "" }) -- TODO
	_280British_Match.Modifications = {} -- TODO
	_280British_Match.AppliedEffects = {} -- TODO

	print("GBO _280British DONE")
end

OnMsg.ClassesGenerate = GBO_280British

