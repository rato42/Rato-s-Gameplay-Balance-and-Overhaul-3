function GBO_PlaceCaliberModificationObj(args)
    return PlaceObj("CaliberModification", args)
end

---- Not used yet

const.Calibers = {}
const.Calibers.AP = {
    Modifications = {
        PenetrationClass = 2,
        CritDamage = -20,
        ArmorPir = 1
    }
}

const.Calibers.HP = {
    Modifications = {
        CritDamage = 50,
        PenetrationClass = -4
    },
    AppliedEffects = {"Bleeding"}
}

const.Calibers.Match = {
    Modifications = {
        AimAccuracy = 2,
        WeaponRange = 2,
        CritChanceScaled = 10
    }
}

const.Calibers.Shock = {
    Modifications = {
        CritDamage = 70,
        WeaponRange = -4
    },
    AppliedEffects = {"Exposed", "Bleeding"}
}

const.Calibers.Subsonic = {
    Modifications = {
        ---- if table, first is mod_add, second is mod_mul
        Noise = {15, 350},
        AimAccuracy = -1,
        WeaponRange = -2
    }
}

const.Calibers.Tracer = {
    Modifications = {tracer = 1},
    AppliedEffects = {"Marked", "Revealed_R"}
}

const.Calibers._45ACP = {
    Modifications = {
        CritDamage = 2,
        CritChance = 1
    }
}

const.Calibers._44CAL = {
    Modifications = {
        PenetrationClass = 1,
        CritDamage = 2
    }
}

const.Calibers._5_45x39 = {
    Modifications = {
        CritChance = 15,
        PenetrationClass = 2
    }
}
const.Calibers._556 = {
    Modifications = {
        CritDamage = 30,
        PenetrationClass = 2
    }
}

const.Calibers._762WP = {
    Modifications = {PenetrationClass = 1}
}

const.Calibers._7_92x33 = {
    Modifications = {
        PenetrationClass = 2,
        CritChance = -2
    }
}

