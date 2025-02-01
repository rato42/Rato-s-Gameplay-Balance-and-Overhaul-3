----- Crit
const.Combat.BurstFireCriticalChanceMul = 70 -- % -- Crit * Constant / 100
---TODO: Change all my crit per aim to be per aim and then make it not affect burst fire
----- CTH
-- Recoil
const.Combat.MultishotGrazeThreshold = 18 -- 12
const.Combat.SingleShotGrazeThreshold = 10
const.Combat.MultishotMinCTH = 5

-------------------- Add for MG calcs here
--- Hipfire
const.Combat.Hipfire_BasePenalty = -10 --- - 18
const.Combat.HipFireMaxPenalty = -123 ---- -75
const.Combat.Hipfire_MaxDistforPenalty = 27 -- 26
-- Snapshot
const.Combat.Snapshot_BasePenalty = -5 ---- -10
const.Combat.SnapshotMaxPenalty = -61
const.Combat.Snapshot_MaxDistforPenalty = 40
const.Combat.MGSetupSnapshotReductionMul = 50
-- RunAndGun
const.Combat.RunAndGunMaxPenalty = -15
const.Combat.RunAndGun_MaxDistforPenalty = 14
const.Combat.RunAndGunSnapshotHipfirePenaltyMul = 1.25
-- MobileShot
const.Combat.MobileShotSnapshotHipfirePenaltyMul = 1.15
-- OW
const.Combat.MGSetupBonusInterruptAccuracy = 5
const.Combat.MGSetupConeMul = 110 --- MulDivRound
const.Combat.MGSetupConeFlat = 180 --- addition
const.Combat.InterruptSnapshotPenalty = 150 --- MulDivRound

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
----TODO: remove light barrel extra attacks
const.Combat.GrazingHitDamage = 30 --- %
const.Combat.MGFreeInterruptAttacks = 1
const.Weapons.PointBlankRange = 6 --- tiles
const.EnvEffects.RainAimingMultiplier = 100 --- %
const.Weapons.CriticalDamage = 50
