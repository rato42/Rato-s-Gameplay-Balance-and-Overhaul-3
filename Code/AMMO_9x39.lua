-- ========== _9x39 ==========

function GBO_9x39()
	print("GBO _9x39 ...")

	_9x39_AP.Cost = 180
	_9x39_AP.AdditionalHint = T({ "" }) -- TODO
	_9x39_AP.Modifications = {} -- TODO
	_9x39_AP.AppliedEffects = {} -- TODO

	_9x39_Basic.Cost = 90
	_9x39_Basic.AdditionalHint = T({ "" }) -- TODO
	_9x39_Basic.Modifications = {} -- TODO
	_9x39_Basic.AppliedEffects = {} -- TODO

	_9x39_HP.Cost = 180
	_9x39_HP.AdditionalHint = T({ "" }) -- TODO
	_9x39_HP.Modifications = {} -- TODO
	_9x39_HP.AppliedEffects = {} -- TODO

	_9x39_Match.Cost = 180
	_9x39_Match.AdditionalHint = T({ "" }) -- TODO
	_9x39_Match.Modifications = {} -- TODO
	_9x39_Match.AppliedEffects = {} -- TODO

	print("GBO _9x39 DONE")
end

OnMsg.ClassesGenerate = GBO_9x39

