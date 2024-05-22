-- ========== _45ACP ==========

function GBO_45ACP()
	print("GBO _45ACP ...")

	_45ACP_AP.Cost = 180
	_45ACP_AP.AdditionalHint = T({ "" }) -- TODO
	_45ACP_AP.Modifications = {} -- TODO
	_45ACP_AP.AppliedEffects = {} -- TODO

	_45ACP_Basic.Cost = 90
	_45ACP_Basic.AdditionalHint = T({ "" }) -- TODO
	_45ACP_Basic.Modifications = {} -- TODO
	_45ACP_Basic.AppliedEffects = {} -- TODO

	_45ACP_HP.Cost = 180
	_45ACP_HP.AdditionalHint = T({ "" }) -- TODO
	_45ACP_HP.Modifications = {} -- TODO
	_45ACP_HP.AppliedEffects = {} -- TODO

	_45ACP_Match.Cost = 180
	_45ACP_Match.AdditionalHint = T({ "" }) -- TODO
	_45ACP_Match.Modifications = {} -- TODO
	_45ACP_Match.AppliedEffects = {} -- TODO

	print("GBO _45ACP DONE")
end

OnMsg.ClassesGenerate = GBO_45ACP

