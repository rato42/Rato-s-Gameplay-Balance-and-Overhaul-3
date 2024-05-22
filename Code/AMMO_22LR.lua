-- ========== _22LR ==========

function GBO_22LR()
	print("GBO _22LR ...")

	_22LR_AP.Cost = 180
	_22LR_AP.AdditionalHint = T({ "" }) -- TODO
	_22LR_AP.Modifications = {} -- TODO
	_22LR_AP.AppliedEffects = {} -- TODO

	_22LR_Basic.Cost = 90
	_22LR_Basic.AdditionalHint = T({ "" }) -- TODO
	_22LR_Basic.Modifications = {} -- TODO
	_22LR_Basic.AppliedEffects = {} -- TODO

	_22LR_HP.Cost = 180
	_22LR_HP.AdditionalHint = T({ "" }) -- TODO
	_22LR_HP.Modifications = {} -- TODO
	_22LR_HP.AppliedEffects = {} -- TODO

	_22LR_Match.Cost = 180
	_22LR_Match.AdditionalHint = T({ "" }) -- TODO
	_22LR_Match.Modifications = {} -- TODO
	_22LR_Match.AppliedEffects = {} -- TODO

	print("GBO _22LR DONE")
end

OnMsg.ClassesGenerate = GBO_22LR

