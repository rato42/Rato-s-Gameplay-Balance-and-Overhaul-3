-- ========== _7_62x25 ==========

function GBO_7_62x25()
	print("GBO _7_62x25 ...")

	_7_62x25_AP.Cost = 180
	_7_62x25_AP.AdditionalHint = T({ "" }) -- TODO
	_7_62x25_AP.Modifications = {} -- TODO
	_7_62x25_AP.AppliedEffects = {} -- TODO

	_7_62x25_Basic.Cost = 90
	_7_62x25_Basic.AdditionalHint = T({ "" }) -- TODO
	_7_62x25_Basic.Modifications = {} -- TODO
	_7_62x25_Basic.AppliedEffects = {} -- TODO

	_7_62x25_HP.Cost = 180
	_7_62x25_HP.AdditionalHint = T({ "" }) -- TODO
	_7_62x25_HP.Modifications = {} -- TODO
	_7_62x25_HP.AppliedEffects = {} -- TODO

	_7_62x25_Match.Cost = 180
	_7_62x25_Match.AdditionalHint = T({ "" }) -- TODO
	_7_62x25_Match.Modifications = {} -- TODO
	_7_62x25_Match.AppliedEffects = {} -- TODO

	print("GBO _7_62x25 DONE")
end

OnMsg.ClassesGenerate = GBO_7_62x25

