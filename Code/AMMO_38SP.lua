-- ========== _38SP ==========

function GBO_38SP()
	print("GBO _38SP ...")

	_38SP_AP.Cost = 180
	_38SP_AP.AdditionalHint = T({ "" }) -- TODO
	_38SP_AP.Modifications = {} -- TODO
	_38SP_AP.AppliedEffects = {} -- TODO

	_38SP_Basic.Cost = 90
	_38SP_Basic.AdditionalHint = T({ "" }) -- TODO
	_38SP_Basic.Modifications = {} -- TODO
	_38SP_Basic.AppliedEffects = {} -- TODO

	_38SP_HP.Cost = 180
	_38SP_HP.AdditionalHint = T({ "" }) -- TODO
	_38SP_HP.Modifications = {} -- TODO
	_38SP_HP.AppliedEffects = {} -- TODO

	_38SP_Match.Cost = 180
	_38SP_Match.AdditionalHint = T({ "" }) -- TODO
	_38SP_Match.Modifications = {} -- TODO
	_38SP_Match.AppliedEffects = {} -- TODO

	print("GBO _38SP DONE")
end

OnMsg.ClassesGenerate = GBO_38SP

