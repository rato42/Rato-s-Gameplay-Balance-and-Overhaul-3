-- ========== _6_5Grendel ==========

function GBO_6_5Grendel()
	print("GBO _6_5Grendel ...")

	_6_5Grendel_AP.Cost = 180
	_6_5Grendel_AP.AdditionalHint = T({ "" }) -- TODO
	_6_5Grendel_AP.Modifications = {} -- TODO
	_6_5Grendel_AP.AppliedEffects = {} -- TODO

	_6_5Grendel_Basic.Cost = 90
	_6_5Grendel_Basic.AdditionalHint = T({ "" }) -- TODO
	_6_5Grendel_Basic.Modifications = {} -- TODO
	_6_5Grendel_Basic.AppliedEffects = {} -- TODO

	_6_5Grendel_HP.Cost = 180
	_6_5Grendel_HP.AdditionalHint = T({ "" }) -- TODO
	_6_5Grendel_HP.Modifications = {} -- TODO
	_6_5Grendel_HP.AppliedEffects = {} -- TODO

	_6_5Grendel_Match.Cost = 180
	_6_5Grendel_Match.AdditionalHint = T({ "" }) -- TODO
	_6_5Grendel_Match.Modifications = {} -- TODO
	_6_5Grendel_Match.AppliedEffects = {} -- TODO

	print("GBO _6_5Grendel DONE")
end

OnMsg.ClassesGenerate = GBO_6_5Grendel

