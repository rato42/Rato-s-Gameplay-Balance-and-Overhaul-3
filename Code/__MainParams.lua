----- Crit
const.Combat.BurstFireCriticalChanceMul = 70 -- % -- Crit * Constant / 100
---TODO: Change all my crit per aim to be per aim and then make it not affect burst fire

----- CTH
const.Combat.SprintingCTH = -10 --- to hit sprinting target
-- Recoil
const.Combat.MultishotGrazeThreshold = 18 -- 12
const.Combat.SingleShotGrazeThreshold = 10
const.Combat.PelletShotGrazeThreshold = 22
const.Combat.MultishotMinCTH = 5
const.Combat.MaxShotIndexForRecoilCTHLoss = 6
-------------------- Add for MG calcs here

-- RunAndGun
const.Combat.RunAndGunMaxPenalty = -10
const.Combat.RunAndGun_MaxDistforPenalty = 14

-- OW
const.Combat.MGSetupBonusInterruptAccuracy = 5
const.Combat.MGSetupConeMul = 110 --- MulDivRound
const.Combat.MGSetupConeFlat = 180 --- addition (minutes)

------ old
const.Combat.R_MinTargetedScaling = 10
const.Combat.R_MaxTargetedScaling = 100
const.Combat.R_MinAimScaling = 10
const.Combat.R_MaxAimScaling = 100

----- AP
const.Combat.CumbersomeStanceAP_StrThreshold = 80
const.Combat.ShootMoveSMGorHandgun_FreeMoveMul = 50

----- BoltAction
const.Combat.BoltActionDexFirstThreshold = 85
const.Combat.BoltActionDexSecondThreshold = 95

------ Pindown (Sniping)
const.Combat.PindownCritPerAimLevel = 5
const.Combat.PindownAimLevelsForAPCost = 2
const.Combat.PindownRangeMul = 150 --- MulDivRound

------ Perks
const.Combat.Perks = {}
const.Combat.Perks.RelentlessAdvanceFreeMoveMul = 150
const.Combat.Perks.OutOfBreathAimMul = 70
const.Combat.Perks.SaviorAdrenalineRushFreeMoveMul = 120
const.Combat.Perks.SaviorAdrenalineRushFreeMoveBonus = 4
const.Combat.Perks.SaviorAdrenalineRushBonusAP = 2

----- Critical
const.Combat.Critical = {}
const.Combat.Critical.PrismScopeCritPerAim = 3 -- 4
const.Combat.Critical.LaserDotCritPerAim = 1
const.Combat.Critical.PSOScopeCritOnAimed = 10
const.Combat.Critical.FirstAimCrit = 6

-------------
----- Vanilla
const.Combat.GrazingHitDamage = 30 --- %
const.Combat.MGFreeInterruptAttacks = 1
const.Weapons.PointBlankRange = 6 --- tiles
const.EnvEffects.RainAimingMultiplier = 100 --- %
const.Weapons.CriticalDamage = 50
const.Weapons.DoubleBarrelDamageBonus = 0 -- 50

-- function OnMsg.ClassesGenerate()
--      AppendClass.FirearmProperties = {
--          {
--              -- category = "Caliber",
--              id = "APStance",
--              name = "Shooting Stance AP",
--              help = "Ap to enter Shooting Stance (not in scale)",
--              editor = "number",
--              default = 3,
--              template = true,
--              min = 0,
--              max = 50,
--              modifiable = true
--          }
--      }

--      Pistol.APStance = 1
--      Revolver.APStance = 1
--      SubmachineGun.APStance = 3
--      Shotgun.APStance = 3
--      SniperRifle.APStance = 5
--      AssaultRifle.APStance = 4
--      MachineGun.APStance = 5
-- end
