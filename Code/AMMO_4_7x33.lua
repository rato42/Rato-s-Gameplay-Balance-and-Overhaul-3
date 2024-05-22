-- ========== _4_7x33 ==========

function GBO_4_7x33()
	print("GBO _4_7x33 ...")

	_4_7x33_AP.Cost = 180
	_4_7x33_AP.AdditionalHint = T({ "" }) -- TODO
	_4_7x33_AP.Modifications = {} -- TODO
	_4_7x33_AP.AppliedEffects = {} -- TODO

	_4_7x33_Basic.Cost = 90
	_4_7x33_Basic.AdditionalHint = T({ "" }) -- TODO
	_4_7x33_Basic.Modifications = {} -- TODO
	_4_7x33_Basic.AppliedEffects = {} -- TODO

	_4_7x33_HP.Cost = 180
	_4_7x33_HP.AdditionalHint = T({ "" }) -- TODO
	_4_7x33_HP.Modifications = {} -- TODO
	_4_7x33_HP.AppliedEffects = {} -- TODO

	_4_7x33_Match.Cost = 180
	_4_7x33_Match.AdditionalHint = T({ "" }) -- TODO
	_4_7x33_Match.Modifications = {} -- TODO
	_4_7x33_Match.AppliedEffects = {} -- TODO

	print("GBO _4_7x33 DONE")
end

OnMsg.ClassesGenerate = GBO_4_7x33

