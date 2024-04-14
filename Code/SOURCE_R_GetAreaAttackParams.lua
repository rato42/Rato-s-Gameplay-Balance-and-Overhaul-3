function Firearm:R_GetAreaAttackParams(action_id, attacker, target_pos, step_pos, stance)
  local params = {
    attacker = attacker,
    weapon = self,
    target_pos = target_pos,
    step_pos = step_pos,
    used_ammo = 1,
    damage_mod = 100,
    attribute_bonus = 0,
    dont_destroy_covers = true
  }
  if attacker then
    params.step_pos = step_pos or not attacker:IsValidPos() or GetPassSlab(attacker) or attacker:GetPos()
    params.stance = stance or attacker.stance
  end
  --if action_id == "Buckshot" or action_id == "DoubleBarrel" or action_id == "BuckshotBurst" or action_id == "CancelShotCone" then
  if action_id == "Buckshot" or action_id == "DoubleBarrel" or action_id == "BuckshotBurst" or action_id == "CancelShotCone" then
    if attacker then
      params.attribute_bonus = MulDivRound(const.Combat.BuckshotAttribBonus, attacker.Marksmanship, 100)
    end
    params.falloff_start = self.BuckshotFalloffStart
    params.falloff_damage = self.BuckshotFalloffDamage
    params.cone_angle = self.BuckshotConeAngle
    params.min_range = self.WeaponRange
    params.max_range = self.WeaponRange
  elseif action_id == "EyesOnTheBack" then
    local effect = attacker:GetStatusEffect("EyesOnTheBack")
    params.cone_angle = effect and effect:ResolveValue("cone_angle") * 60
    params.min_range = self:GetOverwatchConeParam("MinRange")
    params.max_range = self:GetOverwatchConeParam("MaxRange")
  elseif action_id == "Overwatch" or action_id == "MGRotate" or action_id == "MGSetup" or action_id == "R_PrepareWeapon" then
    params.cone_angle = self.OverwatchAngle
    if self.emplacement_weapon then
      params.min_distance_2d = const.EmplacementWeaponMinDistance2D
    end
    params.min_range = self:GetOverwatchConeParam("MinRange")
    params.max_range = self:GetOverwatchConeParam("MaxRange")
  elseif action_id == "BulletHell" or action_id == "DanceForMe" then
    params.cone_angle = self.OverwatchAngle
    params.min_range = self:GetOverwatchConeParam("MinRange")
    params.max_range = self:GetOverwatchConeParam("MaxRange")
  elseif action_id == "FireFlare" then
    params.min_range = self.ammo and self.ammo.AreaOfEffect or 0
    params.max_range = self.ammo and self.ammo.AreaOfEffect or 0
  end
  return params
end


---ok ---changed in 1.4 but not relavant to shooting stance action