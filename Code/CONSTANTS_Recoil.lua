const.Combat.Recoil = {Components = {}, Perks = {}, Other = {}}

const.Combat.Recoil.MarksmanshipMaxReduction = 0.85 -- 0.77
const.Combat.Recoil.MarksmanshipMinStat = 50

const.Combat.Recoil.BasePenalty = -5 ----- -5
const.Combat.Recoil.MaxPenalty = -90 --- -50
const.Combat.Recoil.MaxDistforPenalty = 36 -- 26 ----- -18
const.Combat.Recoil.StacksMultiplier = 0.35 ---- * -- for Persistant Recoil
const.Combat.Recoil.MGSetupMul = 0.80 ---- * -- MG Setup recoil reduction
const.Combat.Recoil.RunAndGunExtraPenalty = -5

const.Combat.Recoil.Components = {
    VerticalGripMul = 0.96, ---0.92, 
    FoldableGripMul = 0.99, ---0.97,
    NoStockMul = {SubmachineGun = 1.40, Other = 1.70},
    CompensatorMul = 0.93, -- 0.90,
    RecoilBoosterMul = 0.98, -- 0.96,
    IntegratedMuzzleBrakeMul = 0.94, -- 0.91,
    SuppressorMul = 0.96,
    ImprovisedSuppressorMul = 0.98,
    LongBarrelMul = {Pistol = 0.98, Revolver = 0.97, SubmachineGun = 0.94, Other = 0.92},
    ShortBarrelMul = {Pistol = 1.02, Revolver = 1.03, SubmachineGun = 1.04, Other = 1.05},
    LightBarrelMul = {Pistol = 1.02, Revolver = 1.03, SubmachineGun = 1.04, Other = 1.05},
    HeavyBarrelMul = {Pistol = 0.98, Revolver = 0.97, SubmachineGun = 0.96, Other = 0.94},
    HeavyStockMul = 0.95,
    LightStockMul = 1.05,
    RecoilBumpMul = 1.06,
    BipodMul = 0.85
}
----- Perks
const.Combat.Recoil.Perks.TakeAimMul = 0.90
const.Combat.Recoil.Perks.AutoWeaponsMul = 0.90
----
const.Combat.Recoil.Other = {Prone = 0.96, Crouch = 0.98, Tracer = 0.95, AP = 1.06}

