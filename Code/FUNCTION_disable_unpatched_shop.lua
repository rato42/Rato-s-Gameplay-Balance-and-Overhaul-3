

function disable_unpatched_shop()
	print("RAT MOD TOG PATCH - Disabling unpatched weapons in shop")
	ForEachPreset("InventoryItemCompositeDef", function(w)
		local item = g_Classes[w.id]
		if IsKindOf(item, "Katana_1") then
			item.CanAppearInShop = false
		end
		if IsKindOf(item, "Firearm") and not IsKindOf(item, "HeavyWeapon") then 
			if not (IsVanillaFirearm(item) or item.is_tog_patched) then
				--w.CanAppearInShop = false
				item.CanAppearInShop = false
			end
		end
	end)
end

function OnMsg.DataLoaded()
	disable_unpatched_shop()
end

function OnMsg.ModsReloaded()
	disable_unpatched_shop()
end


function IsVanillaFirearm(weapon)
    local class = weapon.class or weapon.id
    local vanilla = {
        "GoldenGun",
        "AK47",
        "AK74",
        "AR15",
        "AUG",
        "FAMAS",
        "FNFAL",
        "G36",
        "Galil",
        "M14SAW",
        "M14SAW_AUTO",
        "M16A2",
        "Bereta92",
        "ColtAnaconda",
        "ColtPeacemaker",
        "DesertEagle",
        "FlareHandgun",
        "Glock18",
        "HiPower",
        "TexRevolver",
        "BrowningM2HMG",
        "FNMinimi",
        "HK21",
        "MG42",
        "MG58",
        "RPK74",
        "BarretM82",
        "DragunovSVD",
        "Gewehr98",
        "M24Sniper",
        "PSG1",
        "Winchester1894",
        "AKSU",
        "M4Commando",
        "MP40",
        "MP5",
        "MP5K",
        "UZI",
        "AA12",
        "Auto5",
        "DoubleBarrelShotgun",
        "M41Shotgun",
        "Auto5_quest",
        "Galil_FlagHill",
        "LionRoar",
        "Winchester_Quest"
    }
    
    for _, vanillaClass in ipairs(vanilla) do
        if class == vanillaClass then
            return true
        end
    end
    
    return false
end