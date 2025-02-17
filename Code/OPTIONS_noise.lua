local caliber_map = {
    -- vanilla
    ["9mm"] = 15,
    ["44CAL"] = 19,
    ["12gauge"] = 34,
    ["762WP"] = 25,
    ["556"] = 23,
    ["762NATO"] = 30,
    -- old GBO
    ["5.7x28mm"] = 12,
    ["545x39"] = 22,
    ["792x33"] = 26,
    ["792x57"] = 31,
    ["762x54R"] = 32,
    ["50BMG"] = 41,
    -- Zulib(which were in GBO before udner the same id)
    ["45ACP"] = 17,
    ----
    ["MoW_45ACP"] = 17,
    ----
    ["9x39"] = 13,
    -- Zulib
    ["4_6x30"] = 16,
    ["4_7x33"] = 22,
    ["5_7x28"] = 16,
    ["5_45x39"] = 22,
    ["6_5Creedmoor"] = 25,
    ["6_5Grendel"] = 24,
    ["7_5x54"] = 24,
    ["7_62x25"] = 17,
    ["7_62x54R"] = 32,
    ["7_65x21"] = 14,
    ["7_92x33"] = 24,
    ["7_92x57"] = 31,
    ["9x18"] = 13,
    ["20x82"] = 39,
    ["22LR"] = 12,
    ["30-60"] = 25,
    ["32ACP"] = 12,
    ["32HRMAG"] = 18,
    ["38SP"] = 18,
    ["40SW"] = 16,
    ["44AMP"] = 19,
    ["44MAG"] = 19,
    ["50AE"] = 21,
    ["280"] = 24,
    ["300Blackout"] = 21,
    ["300WinMag"] = 26,
    ["303"] = 25,
    ["308Win"] = 30,
    ["338_Lapua_Magnum"] = 27,
    ["357MAG"] = 20,
    ["380ACP"] = 13,
    ["408_ChayTac"] = 28
}

local weapons = {
    ["SteyrScout_1"] = 3,
    ["AR5"] = 3,
    ["FAMAS"] = 3,
    ["G36"] = 3,
    ["M16A2"] = 3,
    ["ColtAnaconda"] = 3,
    ["ColtPeacemaker"] = 3,
    ["Glock17_1"] = 3,
    ["Glock18"] = 3,
    ["HiPower"] = 3,
    ["P08_1"] = 3,
    ["TexRevolver"] = 3,
    ["USP_1"] = 3,
    ["VikingMP446_1"] = 3,
    ["M79SAW_1"] = 3,
    ["B93RR_1"] = 3,
    ["Bereta92"] = 3,
    ["AN94_1"] = 5,
    ["MAC11_1"] = 5,
    ["GoldenGun"] = 5,
    ["AUG"] = 5,
    ["Groza_1"] = 5,
    ["M14SAW"] = 5,
    ["M14SAW_AUTO"] = 5,
    ["STG44R_1"] = 5,
    ["DesertEagle"] = 5,
    ["MicroUZI_1"] = 5,
    ["MP40"] = 5,
    ["MP5K"] = 5,
    ["Papovka2SKS_1"] = 5,
    ["PapovkaSKS_1"] = 5,
    ["SKS_1"] = 5,
    ["SSG69_1"] = 5,
    ["Winchester1894"] = 5,
    ["AKSU"] = 5,
    ["M4Commando"] = 5,
    ["MP5"] = 5,
    ["M41Shotgun"] = 5,
    ["AK47"] = 8,
    ["AK74"] = 8,
    ["Galil"] = 8,
    ["Galil_FlagHill"] = 8,
    ["B93RR_1"] = 8,
    ["M79SAW2_1"] = 8,
    ["FNMinimi"] = 8,
    ["HK21"] = 8,
    ["MG42"] = 8,
    ["MG58"] = 8,
    ["PKM_1"] = 8,
    ["RPD_1"] = 8,
    ["RPK74"] = 8,
    ["BarretM82"] = 8,
    ["DragunovSVD"] = 8,
    ["Gewehr43_1"] = 8,
    ["Gewehr98"] = 8,
    ["M1Garand_2"] = 8,
    ["M24Sniper"] = 8,
    ["Mosin_1"] = 8,
    ["PSG1"] = 8,
    ["PapovkaSKS_1"] = 8,
    ["Type56A_1"] = 8,
    ["Type56B_1"] = 8,
    ["Type56C_1"] = 8,
    ["Type56D_1"] = 8,
    ["VSS_1"] = 8,
    ["P90_2"] = 5,
    ["StenMK2_1"] = 10,
    ["UZI"] = 6,
    ["AA12"] = 10,
    ["Auto5"] = 10,
    ["Auto5_quest"] = 10,
    ["DoubleBarrelShotgun"] = 10,
    ["BrowningM2HMG"] = 13,
    ["GoldenGun"] = 8,
    ["LionRoar"] = 6,
    ["Winchester_Quest"] = 13,
    ["AR15"] = 5,
    ["FNFAL"] = 8
}

local vanilla_map = {
    ["DebugAuto"] = 20,
    ["AN94_1"] = 20,
    ["AutomagI_2"] = 20,
    ["BrenMKI_1"] = 20,
    ["FAMAESAF_1"] = 10,
    ["Jungle_Carbine_1"] = 25,
    ["M24Sniper2"] = 20,
    ["M60_1"] = 20,
    ["MAC11_1"] = 12,
    ["MP7A1_1"] = 14,
    ["PP91_1"] = 15,
    ["RocketRifle"] = 20,
    ["RocketRifle_1"] = 20,
    ["Special38_1"] = 20,
    ["SteyrScout_1"] = 26,
    ["output_recoil"] = 20,
    ["AK47"] = 20,
    ["AK74"] = 20,
    ["AR15"] = 20,
    ["AUG"] = 20,
    ["EM2JF_1"] = 20,
    ["FAMAS"] = 10,
    ["FN2000R_1"] = 26,
    ["FNFAL"] = 20,
    ["Fn2000_1"] = 26,
    ["G11_1"] = 20,
    ["G36"] = 20,
    ["G3A3Green_1"] = 20,
    ["G3A3_1"] = 20,
    ["G3_1"] = 20,
    ["Galil"] = 20,
    ["Groza_1"] = 10,
    ["HK33A2_1"] = 20,
    ["HK53_1"] = 20,
    ["L85A1_1"] = 20,
    ["M134_1"] = 42,
    ["M14SAW"] = 20,
    ["M16A2"] = 20,
    ["M70D_1"] = 20,
    ["M70_1"] = 20,
    ["RK62_1"] = 20,
    ["RK95_1"] = 20,
    ["STG44R_1"] = 20,
    ["Sturmgewehr44"] = 20,
    ["Sturmgewehr44_Special"] = 20,
    ["TAR21_1"] = 20,
    ["ValmetM82_1"] = 20,
    ["APS_1"] = 20,
    ["B93RR_1"] = 15,
    ["B93R_1"] = 15,
    ["Bereta92"] = 10,
    ["C96R_1"] = 20,
    ["ColtAnaconda"] = 20,
    ["ColtPeacemaker"] = 20,
    ["DesertEagle"] = 20,
    ["FlareHandgun"] = 3,
    ["Glock17_1"] = 16,
    ["Glock18"] = 20,
    ["Glock19_1"] = 20,
    ["HiPower"] = 20,
    ["LP34_1"] = 3,
    ["M1911_1"] = 20,
    ["MK23R_1"] = 5,
    ["MK23_1"] = 5,
    ["Mauser_C96_1"] = 20,
    ["P08_1"] = 20,
    ["PPK_1"] = 18,
    ["Taurus38_1"] = 20,
    ["TexRevolver"] = 20,
    ["Tokarev33_1"] = 18,
    ["USP_1"] = 20,
    ["VikingMP446_1"] = 20,
    ["m625_1"] = 20,
    ["M72LAW_1"] = 20,
    ["M79SAW2_1"] = 20,
    ["M79SAW_1"] = 20,
    ["M79_1"] = 20,
    ["MGL"] = 20,
    ["MortarInventoryItem"] = 50,
    ["Panzerschreck"] = 50,
    ["RPG7"] = 20,
    ["UnderslungGrenadeLauncher"] = 20,
    ["BrowningM2HMG"] = 30,
    ["FG42_1"] = 20,
    ["FNMD_1"] = 20,
    ["FNMinimi"] = 20,
    ["HK21"] = 20,
    ["HK23ECamo_1"] = 20,
    ["HK23E_1"] = 20,
    ["M1918A2_1"] = 20,
    ["MG42"] = 20,
    ["MG58"] = 20,
    ["Mac24_1"] = 20,
    ["PKM_1"] = 20,
    ["RPD_1"] = 28,
    ["RPK74"] = 20,
    ["U100C_1"] = 20,
    ["U100_1"] = 20,
    ["AWP_1"] = 30,
    ["BarretM82"] = 30,
    ["Delisle_1"] = 20,
    ["DragunovSVD"] = 30,
    ["Gewehr43_1"] = 25,
    ["Gewehr98"] = 30,
    ["HK_SL8_1"] = 20,
    ["M1Garand_1"] = 25,
    ["M1Garand_2"] = 25,
    ["M1Garand_3"] = 25,
    ["M1Garand_4"] = 25,
    ["M1Garand_5"] = 25,
    ["M24Sniper"] = 30,
    ["M48_1"] = 30,
    ["M76_1"] = 30,
    ["Mosin_1"] = 25,
    ["NTW20_1"] = 30,
    ["PSG1"] = 20,
    ["Papovka2SKS_1"] = 30,
    ["PapovkaSKS_1"] = 30,
    ["SKS_1"] = 30,
    ["SSG69_1"] = 30,
    ["Type56A_1"] = 30,
    ["Type56B_1"] = 30,
    ["Type56C_1"] = 30,
    ["Type56D_1"] = 30,
    ["VSK94_1"] = 5,
    ["VSS_1"] = 3,
    ["WA2000_1"] = 30,
    ["Winchester1894"] = 20,
    ["AKSU"] = 15,
    ["M4Commando"] = 15,
    ["MP40"] = 15,
    ["MP5"] = 10,
    ["MP5K"] = 10,
    ["MP9_1"] = 20,
    ["MicroUZI_1"] = 10,
    ["P90_2"] = 14,
    ["PPSh41_1"] = 15,
    ["StenMK2_1"] = 15,
    ["UMP_1"] = 16,
    ["UZI"] = 10,
    ["VigM2_1"] = 10,
    ["AA12"] = 20,
    ["Auto5"] = 20,
    ["CAWS_1"] = 22,
    ["Condor_1"] = 20,
    ["DoubleBarrelShotgun"] = 20,
    ["FP6_1"] = 20,
    ["M41Shotgun"] = 20,
    ["M870_1"] = 20,
    ["Spas12_1"] = 20,
    ["Winchester1897_1"] = 20,
    ["Auto5_quest"] = 20,
    ["Galil_FlagHill"] = 20,
    ["GoldenGun"] = 30,
    ["LionRoar"] = 20,
    ["Winchester_Quest"] = 20
}

local new_wep_noise = {
    ["SteyrScout_1"] = 18,
    ["AR5"] = 18,
    ["FAMAS"] = 18,
    ["G36"] = 18,
    ["M16A2"] = 18,
    ["ColtAnaconda"] = 18,
    ["ColtPeacemaker"] = 18,
    ["Glock17_1"] = 18,
    ["Glock18"] = 18,
    ["HiPower"] = 18,
    ["P08_1"] = 18,
    ["TexRevolver"] = 18,
    ["USP_1"] = 18,
    ["VikingMP446_1"] = 18,
    ["M79SAW_1"] = 18,
    ["B93RR_1"] = 18,
    ["Bereta92"] = 18,
    ["AN94_1"] = 20,
    ["MAC11_1"] = 20,
    ["GoldenGun"] = 20,
    ["AUG"] = 20,
    ["Groza_1"] = 20,
    ["M14SAW"] = 20,
    ["M14SAW_AUTO"] = 20,
    ["STG44R_1"] = 20,
    ["DesertEagle"] = 20,
    ["MicroUZI_1"] = 20,
    ["MP40"] = 20,
    ["MP5K"] = 20,
    ["Papovka2SKS_1"] = 20,
    ["PapovkaSKS_1"] = 20,
    ["SKS_1"] = 20,
    ["SSG69_1"] = 20,
    ["Winchester1894"] = 20,
    ["AKSU"] = 20,
    ["M4Commando"] = 20,
    ["MP5"] = 20,
    ["M41Shotgun"] = 20,
    ["AK47"] = 22,
    ["AK74"] = 22,
    ["Galil"] = 22,
    ["Galil_FlagHill"] = 22,
    ["B93RR_1"] = 22,
    ["M79SAW2_1"] = 22,
    ["FNMinimi"] = 22,
    ["HK21"] = 22,
    ["MG42"] = 22,
    ["MG58"] = 22,
    ["PKM_1"] = 22,
    ["RPD_1"] = 22,
    ["RPK74"] = 22,
    ["BarretM82"] = 22,
    ["DragunovSVD"] = 22,
    ["Gewehr43_1"] = 22,
    ["Gewehr98"] = 22,
    ["M1Garand_2"] = 22,
    ["M24Sniper"] = 22,
    ["Mosin_1"] = 22,
    ["PSG1"] = 22,
    ["PapovkaSKS_1"] = 22,
    ["Type56A_1"] = 22,
    ["Type56B_1"] = 22,
    ["Type56C_1"] = 22,
    ["Type56D_1"] = 22,
    ["VSS_1"] = 22,
    ["P90_2"] = 20,
    ["StenMK2_1"] = 25,
    ["UZI"] = 20,
    ["AA12"] = 25,
    ["Auto5"] = 25,
    ["Auto5_quest"] = 25,
    ["DoubleBarrelShotgun"] = 25,
    ["BrowningM2HMG"] = 30,
    ["GoldenGun"] = 22,
    ["LionRoar"] = 20,
    ["Winchester_Quest"] = 30,
    ["AR15"] = 20,
    ["FNFAL"] = 22
}

function rat_noise_settings(param)
    print("RATMOD: changing caliber noise values")
    ForEachPreset("InventoryItemCompositeDef", function(p)
        local item = g_Classes[p.id]
        if IsKindOf(item, "Ammo") then
            local caliber = p.Caliber
            if item.Modifications then
                for i, v in ipairs(item.Modifications) do
                    if v.target_prop and v.target_prop == "Noise" and const.Calibers.Noise[caliber] then
                        v.mod_add = Max(0, MulDivRound(const.Calibers.Noise[caliber], param, 100))
                    end
                end
            end
        end
    end)

end

function rat_caliber_noise() ---these have to be called from the console and will affect presets only

    ForEachPreset("ModItemInventoryItemCompositeDef", function(p)
        local item = g_Classes[p.id]
        if IsKindOf(item, "Ammo") then
            local caliber = p.Caliber
            -- print(p.id, caliber)
            if item.Modifications then
                for i, v in ipairs(p.Modifications) do
                    if v.target_prop and v.target_prop == "Noise" then

                        v.mod_add = caliber_map[caliber] or 0

                    end
                end
            end

        end
    end)
end

function rat_weapon_noise() ---these have to be called from the console and will affect presets only

    ForEachPreset("ModItemInventoryItemCompositeDef", function(p)
        local item = g_Classes[p.id]
        if IsKindOf(item, "Firearm") then
            -- if item.is_vanilla_firearm then
            -- print(p.id, p.Caliber, vanilla_map[p.id], "vanilla")
            -- elseif item.is_tog_patched then
            -- print(p.id, p.Caliber, vanilla_map[p.id], "TOG")
            -- end
            p.Noise = new_wep_noise[p.id] -- weapons[p.id]
            -- if (item.is_vanilla_firearm or item.is_tog_patched) and (item.noise and item.Noise > 13) then
            -- print(p.id, "wrong noise value", item.Noise)
            -- end
        end

    end)

end

function print_noise()
    for i, k in ipairs(vanilla_map) do
        print(i, k)
        local item = g_Classes[k]
        if item and (item.is_vanilla_firearm or item.is_tog_patched) then
            if item.is_vanilla_firearm then
                print("vanilla", k[1], k[2])
            else
                print("TOG", k[1], k[2])
            end
        end
    end
end
