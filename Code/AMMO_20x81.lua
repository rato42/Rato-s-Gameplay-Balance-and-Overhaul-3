-- ========== _20x81 ==========

function GBO_20x81()
	print("GBO _20x81 ...")

	_20x81_Incendiary.Cost = 500
	_20x81_Incendiary.AdditionalHint = T({ "" }) -- TODO
	_20x81_Incendiary.Modifications = {} -- TODO
	_20x81_Incendiary.AppliedEffects = {} -- TODO

	_20x82_Basic.Cost = 250
	_20x82_Basic.AdditionalHint = T({ "" }) -- TODO
	_20x82_Basic.Modifications = {} -- TODO
	_20x82_Basic.AppliedEffects = {} -- TODO

	_20x82_HE.Cost = 500
	_20x82_HE.AdditionalHint = T({ "" }) -- TODO
	_20x82_HE.Modifications = {} -- TODO
	_20x82_HE.AppliedEffects = {} -- TODO

	_20x82_SLAP.Cost = 500
	_20x82_SLAP.AdditionalHint = T({ "" }) -- TODO
	_20x82_SLAP.Modifications = {} -- TODO
	_20x82_SLAP.AppliedEffects = {} -- TODO

	print("GBO _20x81 DONE")
end

OnMsg.ClassesGenerate = GBO_20x81

