-- ========== _7_92x33 ==========

function GBO_7_92x33()
	print("GBO _7_92x33 ...")

	_7_92x33_AP.Cost = 180
	_7_92x33_AP.AdditionalHint = T({ "" }) -- TODO
	_7_92x33_AP.Modifications = {} -- TODO
	_7_92x33_AP.AppliedEffects = {} -- TODO

	_7_92x33_Basic.Cost = 90
	_7_92x33_Basic.AdditionalHint = T({ "" }) -- TODO
	_7_92x33_Basic.Modifications = {} -- TODO
	_7_92x33_Basic.AppliedEffects = {} -- TODO

	_7_92x33_HP.Cost = 180
	_7_92x33_HP.AdditionalHint = T({ "" }) -- TODO
	_7_92x33_HP.Modifications = {} -- TODO
	_7_92x33_HP.AppliedEffects = {} -- TODO

	_7_92x33_Match.Cost = 180
	_7_92x33_Match.AdditionalHint = T({ "" }) -- TODO
	_7_92x33_Match.Modifications = {} -- TODO
	_7_92x33_Match.AppliedEffects = {} -- TODO

	print("GBO _7_92x33 DONE")
end

OnMsg.ClassesGenerate = GBO_7_92x33

