-- ========== _380ACP ==========

function GBO_380ACP()
	print("GBO _380ACP ...")

	_380ACP_AP.Cost = 180
	_380ACP_AP.AdditionalHint = T({ "" }) -- TODO
	_380ACP_AP.Modifications = {} -- TODO
	_380ACP_AP.AppliedEffects = {} -- TODO

	_380ACP_Basic.Cost = 90
	_380ACP_Basic.AdditionalHint = T({ "" }) -- TODO
	_380ACP_Basic.Modifications = {} -- TODO
	_380ACP_Basic.AppliedEffects = {} -- TODO

	_380ACP_HP.Cost = 180
	_380ACP_HP.AdditionalHint = T({ "" }) -- TODO
	_380ACP_HP.Modifications = {} -- TODO
	_380ACP_HP.AppliedEffects = {} -- TODO

	_380ACP_Match.Cost = 180
	_380ACP_Match.AdditionalHint = T({ "" }) -- TODO
	_380ACP_Match.Modifications = {} -- TODO
	_380ACP_Match.AppliedEffects = {} -- TODO

	print("GBO _380ACP DONE")
end

OnMsg.ClassesGenerate = GBO_380ACP

