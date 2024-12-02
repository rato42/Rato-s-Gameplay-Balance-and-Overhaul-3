function OnMsg.GetCustomFXInheritActorRules(rules)
    -- ApplyEffectToActor(rules)
    rat_apply_inherit(rules)
end

function rat_apply_inherit(rules)
    local data = {
        {
            "BarrelLong", "long_barrel_light", "long_barrel_AUG_light", "BarrelHeavyLong", "winni_to54r",
            "BarrelLong_jaggerMeister", "BarrelLongImproved_handgun", "long_barrel_light_handgun", "BarrelLong_handgun"
        }, {"BarrelNormal", "BarrelLight", "rpk_to762wp", "BarrelLight_handgun"},
        {"BarrelShort", "BarrelShort_Light", "BarrelShort_Light_handgun", "BarrelShort_handgun"}, {"AK47", "SKS"},

        {"M14SAW", "M14SAW_AUTO"}, {
            "Suppressor", "R_VSS_suppressor", "VSS_Barrel_def_1", "VSS_Barrel_ext_1", "RAT_TOG_suppressor",
            "RAT_VSK_Suppressor", "RAT_TOG_suppressor_762", "RAT_TOG_suppressor_wp", "SteyrS_Muzzle_def_1"

        }, {"Compensator", "RAT_TOG_compensator"}, {"LaserDot", "RAT_TOG_laser_dot", "TAR21_Scope_Rflx_1"},

        {"UVDot", "RAT_TOG_uv_dot"}, {"HE_Grenade", "HE_Grenade_1"}, -- { 	"SmokeGrenade",
        -- "HE_Grenade_1" 
        -- },
        {"FragGrenade", "ShapedCharge"}, {"UnderslungGrenadeLauncher", "rat_22mmUnderslungGrenadeLauncher"},
        {"Warhead_Frag", "_22m_HE"}, {"MP40", "VigM2_1"}, {'ToG_VFX_Muzzle', "VigM2_Barrel_def_1"}

    }

    for _, entry in ipairs(data) do
        local category = entry[1]

        local tags = {table.unpack(entry, 2)}

        for _, tag in ipairs(tags) do
            rules[#rules + 1] = tag
            rules[#rules + 1] = category
        end
    end

end

