-- ==========  7.92x57mm Mauser ==========
-- = Group 6: Battle Rifle and Full-Power Rifle Cartridges =
function GBO_792x57()
	print("GBO 792x57 ...")

	_7_92x57_AP.Cost = 300
	_7_92x57_AP.Icon = "Mod/cfahRED/Images/mouserap.png"
	_7_92x57_AP.AdditionalHint = T({
		"<bullet_point> Improved armor penetration\n<bullet_point> Decreased Critical Damage\n<bullet_point> Increased recoil"})
	_7_92x57_AP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 4,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = -25,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = 31,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "ArmorPir",
		})}

	_7_92x57_Basic.Cost = 150
	_7_92x57_Basic.Icon = "Mod/cfahRED/Images/mauserstandard.png"
	_7_92x57_Basic.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 31,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = -5,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		})}

	_7_92x57_Tracer.Cost = 300
	_7_92x57_Tracer.Icon = "Mod/cfahRED/Images/mousertracer.png"
	_7_92x57_Tracer.AdditionalHint = T({
		"<bullet_point> Hit enemies are <color EmStyle>Marked</color> \n<bullet_point> Attacker and target have their positions <color EmStyle>Revealed</color>, making them easier to hit in the dark\n<bullet_point> Easier to compensate recoil in multishot attacks"})
	_7_92x57_Tracer.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = -5,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = 31,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 1,
			target_prop = "tracer",
		})}
	_7_92x57_Tracer.AppliedEffects = {"Marked", "Revealed_R"}

	_7_92x57_HP.Cost = 300
	_7_92x57_HP.Icon = "Mod/cfahRED/Images/mouserhp.png"
	_7_92x57_HP.AdditionalHint = T({
		"<bullet_point> No armor penetration\n<bullet_point> High Critical Damage\n<bullet_point> Inflicts <color EmStyle>Bleeding</color> "})
	_7_92x57_HP.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 45,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = -4,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = 31,
			target_prop = "Noise",
		})}
	_7_92x57_HP.AppliedEffects = {"Bleeding"}

	_7_92x57_Match.Cost = 400
	_7_92x57_Match.Icon = "Mod/cfahRED/Images/mausermatch.png"
	_7_92x57_Match.AdditionalHint = T({
		"<bullet_point> Increased bonus from Aiming\n<bullet_point> Increased range\n<bullet_point> Increased Critical Chance scaling"})
	_7_92x57_Match.Modifications = {
		PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "PenetrationClass",
		}), PlaceObj("CaliberModification", {
			mod_add = -5,
			target_prop = "CritDamage",
		}), PlaceObj("CaliberModification", {
			mod_add = 10,
			target_prop = "CritChanceScaled",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "WeaponRange",
		}), PlaceObj("CaliberModification", {
			mod_add = 31,
			target_prop = "Noise",
		}), PlaceObj("CaliberModification", {
			mod_add = 2,
			target_prop = "AimAccuracy",
		})}

	-- TODO _79257_Tracer.lua

	print("GBO 792x57 DONE")
end

OnMsg.zCore_ClassesGenerate = GBO_792x57
