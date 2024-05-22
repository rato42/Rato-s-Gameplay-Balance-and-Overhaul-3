-- ========== _300Blackout ==========

function GBO_300Blackout()
	print("GBO _300Blackout ...")

	_300Blackout_AP.Cost = 180
	_300Blackout_AP.AdditionalHint = T({ "" }) -- TODO
	_300Blackout_AP.Modifications = {} -- TODO
	_300Blackout_AP.AppliedEffects = {} -- TODO

	_300Blackout_Basic.Cost = 90
	_300Blackout_Basic.AdditionalHint = T({ "" }) -- TODO
	_300Blackout_Basic.Modifications = {} -- TODO
	_300Blackout_Basic.AppliedEffects = {} -- TODO

	_300Blackout_HP.Cost = 180
	_300Blackout_HP.AdditionalHint = T({ "" }) -- TODO
	_300Blackout_HP.Modifications = {} -- TODO
	_300Blackout_HP.AppliedEffects = {} -- TODO

	_300Blackout_Match.Cost = 180
	_300Blackout_Match.AdditionalHint = T({ "" }) -- TODO
	_300Blackout_Match.Modifications = {} -- TODO
	_300Blackout_Match.AppliedEffects = {} -- TODO

	print("GBO _300Blackout DONE")
end

OnMsg.ClassesGenerate = GBO_300Blackout

