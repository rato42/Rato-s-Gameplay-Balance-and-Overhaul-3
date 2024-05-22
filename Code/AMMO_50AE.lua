-- ========== _50AE ==========

function GBO_50AE()
	print("GBO _50AE ...")

	_50AE_AP.Cost = 180
	_50AE_AP.AdditionalHint = T({ "" }) -- TODO
	_50AE_AP.Modifications = {} -- TODO
	_50AE_AP.AppliedEffects = {} -- TODO

	_50AE_Basic.Cost = 90
	_50AE_Basic.AdditionalHint = T({ "" }) -- TODO
	_50AE_Basic.Modifications = {} -- TODO
	_50AE_Basic.AppliedEffects = {} -- TODO

	_50AE_HP.Cost = 180
	_50AE_HP.AdditionalHint = T({ "" }) -- TODO
	_50AE_HP.Modifications = {} -- TODO
	_50AE_HP.AppliedEffects = {} -- TODO

	_50AE_Match.Cost = 180
	_50AE_Match.AdditionalHint = T({ "" }) -- TODO
	_50AE_Match.Modifications = {} -- TODO
	_50AE_Match.AppliedEffects = {} -- TODO

	print("GBO _50AE DONE")
end

OnMsg.ClassesGenerate = GBO_50AE

