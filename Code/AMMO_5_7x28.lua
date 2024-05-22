-- ========== _5_7x28 ==========

function GBO_5_7x28()
	print("GBO _5_7x28 ...")

	_5_7x28_AP.Cost = 180
	_5_7x28_AP.AdditionalHint = T({ "" }) -- TODO
	_5_7x28_AP.Modifications = {} -- TODO
	_5_7x28_AP.AppliedEffects = {} -- TODO

	_5_7x28_Basic.Cost = 90
	_5_7x28_Basic.AdditionalHint = T({ "" }) -- TODO
	_5_7x28_Basic.Modifications = {} -- TODO
	_5_7x28_Basic.AppliedEffects = {} -- TODO

	_5_7x28_HP.Cost = 180
	_5_7x28_HP.AdditionalHint = T({ "" }) -- TODO
	_5_7x28_HP.Modifications = {} -- TODO
	_5_7x28_HP.AppliedEffects = {} -- TODO

	_5_7x28_Match.Cost = 180
	_5_7x28_Match.AdditionalHint = T({ "" }) -- TODO
	_5_7x28_Match.Modifications = {} -- TODO
	_5_7x28_Match.AppliedEffects = {} -- TODO

	print("GBO _5_7x28 DONE")
end

OnMsg.ClassesGenerate = GBO_5_7x28

