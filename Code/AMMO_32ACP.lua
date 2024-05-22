-- ========== _32ACP ==========

function GBO_32ACP()
	print("GBO _32ACP ...")

	_32ACP_AP.Cost = 180
	_32ACP_AP.AdditionalHint = T({ "" }) -- TODO
	_32ACP_AP.Modifications = {} -- TODO
	_32ACP_AP.AppliedEffects = {} -- TODO

	_32ACP_Basic.Cost = 90
	_32ACP_Basic.AdditionalHint = T({ "" }) -- TODO
	_32ACP_Basic.Modifications = {} -- TODO
	_32ACP_Basic.AppliedEffects = {} -- TODO

	_32ACP_HP.Cost = 180
	_32ACP_HP.AdditionalHint = T({ "" }) -- TODO
	_32ACP_HP.Modifications = {} -- TODO
	_32ACP_HP.AppliedEffects = {} -- TODO

	_32ACP_Match.Cost = 180
	_32ACP_Match.AdditionalHint = T({ "" }) -- TODO
	_32ACP_Match.Modifications = {} -- TODO
	_32ACP_Match.AppliedEffects = {} -- TODO

	print("GBO _32ACP DONE")
end

OnMsg.ClassesGenerate = GBO_32ACP

