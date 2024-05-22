-- ========== _4_6x30 ==========

function GBO_4_6x30()
	print("GBO _4_6x30 ...")

	_4_6x30_AP.Cost = 180
	_4_6x30_AP.AdditionalHint = T({ "" }) -- TODO
	_4_6x30_AP.Modifications = {} -- TODO
	_4_6x30_AP.AppliedEffects = {} -- TODO

	_4_6x30_Basic.Cost = 90
	_4_6x30_Basic.AdditionalHint = T({ "" }) -- TODO
	_4_6x30_Basic.Modifications = {} -- TODO
	_4_6x30_Basic.AppliedEffects = {} -- TODO

	_4_6x30_HP.Cost = 180
	_4_6x30_HP.AdditionalHint = T({ "" }) -- TODO
	_4_6x30_HP.Modifications = {} -- TODO
	_4_6x30_HP.AppliedEffects = {} -- TODO

	_4_6x30_Match.Cost = 180
	_4_6x30_Match.AdditionalHint = T({ "" }) -- TODO
	_4_6x30_Match.Modifications = {} -- TODO
	_4_6x30_Match.AppliedEffects = {} -- TODO

	print("GBO _4_6x30 DONE")
end

OnMsg.ClassesGenerate = GBO_4_6x30

