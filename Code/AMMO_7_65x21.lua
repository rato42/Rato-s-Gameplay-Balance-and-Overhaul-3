-- ========== _7_65x21 ==========

function GBO_7_65x21()
	print("GBO _7_65x21 ...")

	_7_65x21_AP.Cost = 180
	_7_65x21_AP.AdditionalHint = T({ "" }) -- TODO
	_7_65x21_AP.Modifications = {} -- TODO
	_7_65x21_AP.AppliedEffects = {} -- TODO

	_7_65x21_Basic.Cost = 90
	_7_65x21_Basic.AdditionalHint = T({ "" }) -- TODO
	_7_65x21_Basic.Modifications = {} -- TODO
	_7_65x21_Basic.AppliedEffects = {} -- TODO

	_7_65x21_HP.Cost = 180
	_7_65x21_HP.AdditionalHint = T({ "" }) -- TODO
	_7_65x21_HP.Modifications = {} -- TODO
	_7_65x21_HP.AppliedEffects = {} -- TODO

	_7_65x21_Match.Cost = 180
	_7_65x21_Match.AdditionalHint = T({ "" }) -- TODO
	_7_65x21_Match.Modifications = {} -- TODO
	_7_65x21_Match.AppliedEffects = {} -- TODO

	print("GBO _7_65x21 DONE")
end

OnMsg.ClassesGenerate = GBO_7_65x21

