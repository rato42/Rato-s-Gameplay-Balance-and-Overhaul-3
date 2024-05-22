-- ========== _7_5x54 ==========

function GBO_7_5x54()
	print("GBO _7_5x54 ...")

	_7_5x54_AP.Cost = 180
	_7_5x54_AP.AdditionalHint = T({ "" }) -- TODO
	_7_5x54_AP.Modifications = {} -- TODO
	_7_5x54_AP.AppliedEffects = {} -- TODO

	_7_5x54_Basic.Cost = 90
	_7_5x54_Basic.AdditionalHint = T({ "" }) -- TODO
	_7_5x54_Basic.Modifications = {} -- TODO
	_7_5x54_Basic.AppliedEffects = {} -- TODO

	_7_5x54_HP.Cost = 180
	_7_5x54_HP.AdditionalHint = T({ "" }) -- TODO
	_7_5x54_HP.Modifications = {} -- TODO
	_7_5x54_HP.AppliedEffects = {} -- TODO

	_7_5x54_Match.Cost = 180
	_7_5x54_Match.AdditionalHint = T({ "" }) -- TODO
	_7_5x54_Match.Modifications = {} -- TODO
	_7_5x54_Match.AppliedEffects = {} -- TODO

	print("GBO _7_5x54 DONE")
end

OnMsg.ClassesGenerate = GBO_7_5x54

