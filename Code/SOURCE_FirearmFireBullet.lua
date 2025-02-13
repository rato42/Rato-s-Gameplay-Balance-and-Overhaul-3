-- local GBO_originalFirearmFireBullet = Firearm.FireBullet
local dmg_table = {}

function res_dmgtbl()
    dmg_table = {}
end

function insp_dmgtbl()
    Inspect(dmg_table)
end

function Firearm:FireBullet(attacker, shot, threads, results, attack_args)
    local pellets = shot.pellets
    if pellets and #pellets > 0 then
        for i = 1, #pellets do
            self:FirePellets(attacker, pellets[i], threads, results, attack_args, GameTime())
        end
        return
    end
    ratG_originalFirearmFireBullet(self, attacker, shot, threads, results, attack_args)
end
