-- ========== _308Win ==========

function GBO_308Win()
	print("GBO _308Win ...")

	_308Win_AP.Cost = 180
	_308Win_AP.AdditionalHint = T({ "" }) -- TODO
	_308Win_AP.Modifications = {} -- TODO
	_308Win_AP.AppliedEffects = {} -- TODO

	_308Win_Basic.Cost = 90
	_308Win_Basic.AdditionalHint = T({ "" }) -- TODO
	_308Win_Basic.Modifications = {} -- TODO
	_308Win_Basic.AppliedEffects = {} -- TODO

	_308Win_HP.Cost = 180
	_308Win_HP.AdditionalHint = T({ "" }) -- TODO
	_308Win_HP.Modifications = {} -- TODO
	_308Win_HP.AppliedEffects = {} -- TODO

	_308Win_Match.Cost = 180
	_308Win_Match.AdditionalHint = T({ "" }) -- TODO
	_308Win_Match.Modifications = {} -- TODO
	_308Win_Match.AppliedEffects = {} -- TODO

	print("GBO _308Win DONE")
end

OnMsg.ClassesGenerate = GBO_308Win

