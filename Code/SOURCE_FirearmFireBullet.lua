-- local GBO_originalFirearmFireBullet = Firearm.FireBullet
function Firearm:FireBullet(attacker, shot, threads, results, attack_args)
    local pellets = shot.pellets
    if pellets and #pellets > 0 then
        shot.main_pellet = true
        table.insert(pellets, shot)
        for i = 1, #pellets do
            self:FirePellets(attacker, pellets[i], threads, results, attack_args, GameTime())
        end
        return
    end
    ratG_originalFirearmFireBullet(self, attacker, shot, threads, results, attack_args)
end
