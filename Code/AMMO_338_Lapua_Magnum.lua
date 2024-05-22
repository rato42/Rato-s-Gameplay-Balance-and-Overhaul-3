-- ========== _338_Lapua_Magnum ==========

function GBO_338_Lapua_Magnum()
	print("GBO _338_Lapua_Magnum ...")

	_338_Lapua_Magnum_AP.Cost = 180
	_338_Lapua_Magnum_AP.AdditionalHint = T({ "" }) -- TODO
	_338_Lapua_Magnum_AP.Modifications = {} -- TODO
	_338_Lapua_Magnum_AP.AppliedEffects = {} -- TODO

	_338_Lapua_Magnum_Basic.Cost = 90
	_338_Lapua_Magnum_Basic.AdditionalHint = T({ "" }) -- TODO
	_338_Lapua_Magnum_Basic.Modifications = {} -- TODO
	_338_Lapua_Magnum_Basic.AppliedEffects = {} -- TODO

	_338_Lapua_Magnum_HP.Cost = 180
	_338_Lapua_Magnum_HP.AdditionalHint = T({ "" }) -- TODO
	_338_Lapua_Magnum_HP.Modifications = {} -- TODO
	_338_Lapua_Magnum_HP.AppliedEffects = {} -- TODO

	_338_Lapua_Magnum_Match.Cost = 180
	_338_Lapua_Magnum_Match.AdditionalHint = T({ "" }) -- TODO
	_338_Lapua_Magnum_Match.Modifications = {} -- TODO
	_338_Lapua_Magnum_Match.AppliedEffects = {} -- TODO

	print("GBO _338_Lapua_Magnum DONE")
end

OnMsg.ClassesGenerate = GBO_338_Lapua_Magnum

