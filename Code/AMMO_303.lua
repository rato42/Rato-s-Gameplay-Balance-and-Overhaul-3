-- ========== _303 ==========

function GBO_303()
	print("GBO _303 ...")

	_303_AP.Cost = 180
	_303_AP.AdditionalHint = T({ "" }) -- TODO
	_303_AP.Modifications = {} -- TODO
	_303_AP.AppliedEffects = {} -- TODO

	_303_Basic.Cost = 90
	_303_Basic.AdditionalHint = T({ "" }) -- TODO
	_303_Basic.Modifications = {} -- TODO
	_303_Basic.AppliedEffects = {} -- TODO

	_303_HP.Cost = 180
	_303_HP.AdditionalHint = T({ "" }) -- TODO
	_303_HP.Modifications = {} -- TODO
	_303_HP.AppliedEffects = {} -- TODO

	_303_Match.Cost = 180
	_303_Match.AdditionalHint = T({ "" }) -- TODO
	_303_Match.Modifications = {} -- TODO
	_303_Match.AppliedEffects = {} -- TODO

	print("GBO _303 DONE")
end

OnMsg.ClassesGenerate = GBO_303

