
function OnMsg.DataLoaded()
	aim_cth()
	two_weaponcth()
	autofire_range()
	bipod_standing()
	prone_cover()
	ow_cth()
	runandgun_cth()
	targeted_noburst()
	point_blank_cth()

	------
	rat_combat_actions()
	rat_MGSetup_getap()
	presets_char_effect()
	
	----
	rat_change_template_boltaction()
	------
	rat_upd_visu()
	------
	
	
	----place obj
	place_standing_penalCTH()
	weapon_components_rat() --- should not be called on mod options applied
	rat_category_description()
	rat_place_prepareweapon_combat_actions()
	place_ranged_melee_CTH()
	place_scope_pen_cth()
	place_hipfire_cth()
	recoil_template()
	--add_recalcUI() ----smart ow compatibility
	
end

function OnMsg.EnterSector()
	recoil_template()
end

function OnMsg.ModsReloaded()
	rat_upd_visu()
end
	-- aim_cth()
	-- two_weaponcth()
	-- autofire_range()
	-- bipod_standing()
	-- prone_cover()
	-- ow_cth()
	-- runandgun_cth()
	-- targeted_noburst()
	-- point_blank_cth()
	-- rat_combat_actions()
	-- presets_char_effect()
	-- rat_change_template_boltaction()
	-- rat_MGSetup_getap()