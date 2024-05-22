-- ========== _300WinMag ==========

function GBO_300WinMag()
	print("GBO _300WinMag ...")

	_300WinMag_AP.Cost = 180
	_300WinMag_AP.AdditionalHint = T({ "" }) -- TODO
	_300WinMag_AP.Modifications = {} -- TODO
	_300WinMag_AP.AppliedEffects = {} -- TODO

	_300WinMag_Basic.Cost = 90
	_300WinMag_Basic.AdditionalHint = T({ "" }) -- TODO
	_300WinMag_Basic.Modifications = {} -- TODO
	_300WinMag_Basic.AppliedEffects = {} -- TODO

	_300WinMag_HP.Cost = 180
	_300WinMag_HP.AdditionalHint = T({ "" }) -- TODO
	_300WinMag_HP.Modifications = {} -- TODO
	_300WinMag_HP.AppliedEffects = {} -- TODO

	_300WinMag_Match.Cost = 180
	_300WinMag_Match.AdditionalHint = T({ "" }) -- TODO
	_300WinMag_Match.Modifications = {} -- TODO
	_300WinMag_Match.AppliedEffects = {} -- TODO

	print("GBO _300WinMag DONE")
end

OnMsg.ClassesGenerate = GBO_300WinMag

