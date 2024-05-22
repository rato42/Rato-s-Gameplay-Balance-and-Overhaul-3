-- ========== _32HRMAG ==========

function GBO_32HRMAG()
	print("GBO _32HRMAG ...")

	_32HRMAG_AP.Cost = 180
	_32HRMAG_AP.AdditionalHint = T({ "" }) -- TODO
	_32HRMAG_AP.Modifications = {} -- TODO
	_32HRMAG_AP.AppliedEffects = {} -- TODO

	_32HRMAG_Basic.Cost = 90
	_32HRMAG_Basic.AdditionalHint = T({ "" }) -- TODO
	_32HRMAG_Basic.Modifications = {} -- TODO
	_32HRMAG_Basic.AppliedEffects = {} -- TODO

	_32HRMAG_HP.Cost = 180
	_32HRMAG_HP.AdditionalHint = T({ "" }) -- TODO
	_32HRMAG_HP.Modifications = {} -- TODO
	_32HRMAG_HP.AppliedEffects = {} -- TODO

	_32HRMAG_Match.Cost = 180
	_32HRMAG_Match.AdditionalHint = T({ "" }) -- TODO
	_32HRMAG_Match.Modifications = {} -- TODO
	_32HRMAG_Match.AppliedEffects = {} -- TODO

	print("GBO _32HRMAG DONE")
end

OnMsg.ClassesGenerate = GBO_32HRMAG

