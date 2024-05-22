-- ========== _6_5Creedmoor ==========

function GBO_6_5Creedmoor()
	print("GBO _6_5Creedmoor ...")

	_6_5Creedmoor_AP.Cost = 180
	_6_5Creedmoor_AP.AdditionalHint = T({ "" }) -- TODO
	_6_5Creedmoor_AP.Modifications = {} -- TODO
	_6_5Creedmoor_AP.AppliedEffects = {} -- TODO

	_6_5Creedmoor_Basic.Cost = 90
	_6_5Creedmoor_Basic.AdditionalHint = T({ "" }) -- TODO
	_6_5Creedmoor_Basic.Modifications = {} -- TODO
	_6_5Creedmoor_Basic.AppliedEffects = {} -- TODO

	_6_5Creedmoor_HP.Cost = 180
	_6_5Creedmoor_HP.AdditionalHint = T({ "" }) -- TODO
	_6_5Creedmoor_HP.Modifications = {} -- TODO
	_6_5Creedmoor_HP.AppliedEffects = {} -- TODO

	_6_5Creedmoor_Match.Cost = 180
	_6_5Creedmoor_Match.AdditionalHint = T({ "" }) -- TODO
	_6_5Creedmoor_Match.Modifications = {} -- TODO
	_6_5Creedmoor_Match.AppliedEffects = {} -- TODO

	print("GBO _6_5Creedmoor DONE")
end

OnMsg.ClassesGenerate = GBO_6_5Creedmoor

