const.Combat.SnapshotHipfire = {}
const.Combat.Hipfire = {}
const.Combat.Snapshot = {}

---------------
--- Hipfire
const.Combat.Hipfire.BasePenalty = -10 --- - 18
const.Combat.Hipfire.MaxPenalty = -123 ---- -75
const.Combat.Hipfire.MaxDistforPenalty = 28 -- 26
-- Snapshot
const.Combat.Snapshot.BasePenalty = -5 ---- -10
const.Combat.Snapshot.MaxPenalty = -61
const.Combat.Snapshot.MaxDistforPenalty = 40 --- tiles
const.Combat.Snapshot.MGSetupMul = 60 -- MulDivRound
const.Combat.Snapshot.InterruptMul = 140 --- MulDivRound
---------------

const.Combat.SnapshotHipfire.Components = {
    LaserMul = 0.88,
    VerticalGripMul = 0.95,
    TacticalGripMul = 0.90,
    LightStockMul = 0.92
}

const.Combat.SnapshotHipfire.RunAndGunMul = 1.20
const.Combat.SnapshotHipfire.MobileShotMul = 1.10
const.Combat.SnapshotHipfire.MeleeWeaponMul = 0.85

const.Combat.Hipfire.Components = {
    BullpupMul = 1.08,
    LongBarrelMul = {Pistol = 0.94, Revolver = 0.92, Other = 0.89},
    ShortBarrelMul = {Pistol = 1.06, Revolver = 1.08, Other = 1.11}
}

const.Combat.Hipfire.Other = {Prone = 1.10, Crouch = 1.05}

const.Combat.Snapshot.Components = {
    DrumMagMul = 1.1,
    NoStockMul = 0.92,
    BullpupMul = 0.96,
    LongBarrelMul = {Pistol = 1.06, Revolver = 1.07, Other = 1.10},
    ShortBarrelMul = {Pistol = 0.94, Revolver = 0.93, Other = 0.90},
    LightBarrelMul = 0.92, -- {Pistol = 1.02, Revolver = 1.03, Other = 0.92},
    HeavyBarrelMul = 1.08 -- {Pistol = 0.98, Revolver = 0.97, Other = 0.94},
}

function OnMsg.ClassesGenerate()
    AppendClass.Firearm = {
        properties = {
            {id = "class_base_hipfire_mul", editor = "number", default = 100, no_edit = true},
            {id = "class_base_snapshot_mul", editor = "number", default = 100, no_edit = true}
        }
    }

    Pistol.class_base_hipfire_mul = 145
    Revolver.class_base_hipfire_mul = 138
    SubmachineGun.class_base_hipfire_mul = 120
    Shotgun.class_base_hipfire_mul = 105
    ---
    Pistol.class_base_snapshot_mul = 60
    Revolver.class_base_snapshot_mul = 60
    SubmachineGun.class_base_snapshot_mul = 85
    Shotgun.class_base_snapshot_mul = 115
    SniperRifle.class_base_snapshot_mul = 135
    AssaultRifle.class_base_snapshot_mul = 125
    MachineGun.class_base_snapshot_mul = 135
end
