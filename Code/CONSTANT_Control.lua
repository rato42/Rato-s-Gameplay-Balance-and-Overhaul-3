----- Crit
const.Combat.BurstFireCriticalChanceMul = 70 -- % -- Crit * Constant / 100

----- CTH
-- Recoil
const.Combat.Recoil_BasePenalty = -5 ----- -5
const.Combat.Recoil_MaxPenalty = -50
const.Combat.Recoil_MaxDistforPenalty = 26 ----- -18
const.Combat.Recoil_StacksMultiplier = 0.35 ---- * -- for Persistant Recoil
const.Combat.Recoil_MGSetupMul = 0.70 ---- * -- MG Setup recoil reduction
const.Combat.Recoil_RunAndGunPenalty = -15
-------------------- Add for MG calcs here
--- Hipfire
const.Combat.Hipfire_BasePenalty = -10 --- - 18
const.Combat.HipFireMaxPenalty = -65 ---- -75
const.Combat.Hipfire_MaxDistforPenalty = 26
-- Snapshot
const.Combat.Snapshot_BasePenalty = -5 ---- -10
const.Combat.SnapshotMaxPenalty = -35
const.Combat.Snapshot_MaxDistforPenalty = 26
const.Combat.MGSetupSnapshotReductionMul = 40
-- RunAndGun
const.Combat.RunAndGunMaxPenalty = -20
const.Combat.RunAndGun_MaxDistforPenalty = 14
const.Combat.RunAndGunSnapshotHipfirePenaltyMul = 1.75
-- MobileShot
const.Combat.MobileShotSnapshotHipfirePenaltyMul = 1.55
-- OW
const.Combat.MGSetupBonusInterruptAccuracy = 15
const.Combat.MGSetupConeMul = 120 --- MulDivRound
const.Combat.MGSetupConeFlat = 180 --- addition

----- AI
-- const.Combat.AI_ShootingStanceAP_Mul = 50 --- % Became a Mod Option
----- AP
const.Combat.CumbersomeStanceAP_StrThreshold = 80

----- BoltAction
const.Combat.BoltActionDexFirstThreshold = 85
const.Combat.BoltActionDexSecondThreshold = 95

------ Pindown (Sniping)
const.Combat.PindownCritPerAimLevel = 5
const.Combat.PindownAimLevelsForAPCost = 2
const.Combat.PindownRangeMul = 150 --- MulDivRound

-------------
----- Vanilla
const.Combat.GrazingHitDamage = 40 --- %
const.Combat.MGFreeInterruptAttacks = 2
const.Weapons.PointBlankRange = 6 --- tiles
const.EnvEffects.RainAimingMultiplier = 100 --- %
const.Weapons.CriticalDamage = 60
