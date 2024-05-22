-- ========== _5_45x39 ==========

function GBO_5_45x39()
	print("GBO _5_45x39 ...")

	_5_45x39_AP.Cost = 180
	_5_45x39_AP.AdditionalHint = T({ "" }) -- TODO
	_5_45x39_AP.Modifications = {} -- TODO
	_5_45x39_AP.AppliedEffects = {} -- TODO

	_5_45x39_Basic.Cost = 90
	_5_45x39_Basic.AdditionalHint = T({ "" }) -- TODO
	_5_45x39_Basic.Modifications = {} -- TODO
	_5_45x39_Basic.AppliedEffects = {} -- TODO

	_5_45x39_HP.Cost = 180
	_5_45x39_HP.AdditionalHint = T({ "" }) -- TODO
	_5_45x39_HP.Modifications = {} -- TODO
	_5_45x39_HP.AppliedEffects = {} -- TODO

	_5_45x39_Match.Cost = 180
	_5_45x39_Match.AdditionalHint = T({ "" }) -- TODO
	_5_45x39_Match.Modifications = {} -- TODO
	_5_45x39_Match.AppliedEffects = {} -- TODO

	print("GBO _5_45x39 DONE")
end

OnMsg.ClassesGenerate = GBO_5_45x39

