-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

function RatoGBOComponents()
	print("Running RatoGBOComponents...")
	WeaponComponents["MagLargeFine"].ModificationEffects = table.copy(WeaponComponents["_Master_MagLargeFine"].ModificationEffects)
	WeaponComponents["MagLargeFine"].Parameters = table.copy(WeaponComponents["_Master_MagLargeFine"].Parameters)
	WeaponComponents["MagLargeFine"].Visuals = table.copy(WeaponComponents["_Master_MagLargeFine"].Visuals)
	WeaponComponents["MagLargeFine"]:PostLoad()
	WeaponComponents["MagLarge"].ModificationEffects = table.copy(WeaponComponents["_Master_MagLarge"].ModificationEffects)
	WeaponComponents["MagLarge"].Parameters = table.copy(WeaponComponents["_Master_MagLarge"].Parameters)
	WeaponComponents["MagLarge"].Visuals = table.copy(WeaponComponents["_Master_MagLarge"].Visuals)
	WeaponComponents["MagLarge"]:PostLoad()
	WeaponComponents["MagNormalFine"].ModificationEffects = table.copy(WeaponComponents["_Master_MagNormalFine"].ModificationEffects)
	WeaponComponents["MagNormalFine"].Parameters = table.copy(WeaponComponents["_Master_MagNormalFine"].Parameters)
	WeaponComponents["MagNormalFine"].Visuals = table.copy(WeaponComponents["_Master_MagNormalFine"].Visuals)
	WeaponComponents["MagNormalFine"]:PostLoad()
	WeaponComponents["MagNormal"].ModificationEffects = table.copy(WeaponComponents["_Master_MagNormal"].ModificationEffects)
	WeaponComponents["MagNormal"].Parameters = table.copy(WeaponComponents["_Master_MagNormal"].Parameters)
	WeaponComponents["MagNormal"].Visuals = table.copy(WeaponComponents["_Master_MagNormal"].Visuals)
	WeaponComponents["MagNormal"]:PostLoad()
	WeaponComponents["foldable_StockNormal"].ModificationEffects = table.copy(WeaponComponents["StockNormal"].ModificationEffects)
	WeaponComponents["foldable_StockNormal"].Parameters = table.copy(WeaponComponents["StockNormal"].Parameters)
	WeaponComponents["foldable_StockNormal"]:PostLoad()
	WeaponComponents["StockFolded"].ModificationEffects = table.copy(WeaponComponents["StockNo"].ModificationEffects)
	WeaponComponents["StockFolded"].Parameters = table.copy(WeaponComponents["StockNo"].Parameters)
	WeaponComponents["StockFolded"]:PostLoad()
	print("Running RatoGBOComponents Done")
end
