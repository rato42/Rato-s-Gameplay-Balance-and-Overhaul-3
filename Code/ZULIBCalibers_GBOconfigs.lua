-- function OnMsg.DataLoaded()
--     zz_vanillasToSwap["Winchester1894"] = "_44CAL"
--     zz_vanillasToSwap["ColtAnaconda"] = "_44CAL"
--     zz_vanillasToSwap["DesertEagle"] = "_44CAL"
-- end
function OnMsg.zCore_ClassesGenerate()
    zz_vanillasToSwap["Winchester1894"] = nil -- "_44CAL"
    zz_vanillasToSwap["ColtAnaconda"] = nil -- "_44CAL"
    zz_vanillasToSwap["DesertEagle"] = nil -- "_44CAL"
end
