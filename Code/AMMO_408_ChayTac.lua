-- ========== _408_ChayTac ==========

function GBO_408_ChayTac()
	print("GBO _408_ChayTac ...")

	_408_ChayTac_AP.Cost = 180
	_408_ChayTac_AP.AdditionalHint = T({ "" }) -- TODO
	_408_ChayTac_AP.Modifications = {} -- TODO
	_408_ChayTac_AP.AppliedEffects = {} -- TODO

	_408_ChayTac_Basic.Cost = 90
	_408_ChayTac_Basic.AdditionalHint = T({ "" }) -- TODO
	_408_ChayTac_Basic.Modifications = {} -- TODO
	_408_ChayTac_Basic.AppliedEffects = {} -- TODO

	_408_ChayTac_HP.Cost = 180
	_408_ChayTac_HP.AdditionalHint = T({ "" }) -- TODO
	_408_ChayTac_HP.Modifications = {} -- TODO
	_408_ChayTac_HP.AppliedEffects = {} -- TODO

	_408_ChayTac_Match.Cost = 180
	_408_ChayTac_Match.AdditionalHint = T({ "" }) -- TODO
	_408_ChayTac_Match.Modifications = {} -- TODO
	_408_ChayTac_Match.AppliedEffects = {} -- TODO

	print("GBO _408_ChayTac DONE")
end

OnMsg.ClassesGenerate = GBO_408_ChayTac

