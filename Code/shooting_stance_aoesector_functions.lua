function CreateAOETilesSector_Shooter(voxels, step_objs, values, obj, center, target, r1, r2, cone_angle, material, falloff_percent)
  local dir_angle = CalcOrientation(center, target)
  local ray1 = RotateRadius(4096, dir_angle - cone_angle / 2 + 5400)
  local ray2 = RotateRadius(4096, dir_angle + cone_angle / 2 - 5400)
  local main_ray = RotateRadius(4096, dir_angle)
  local mesh, avgx, avgy = CreateAOETiles(voxels, step_objs, values)
  if not obj then
    obj = Mesh:new()
    obj:SetMeshFlags(const.mfWorldSpace)
  end
  obj:SetMesh(mesh)
  local mat 

	
  if not mat then
    mat = CRM_AOETilesMaterial:GetById("Overwatch_Default"):Clone()
	--3590055038
	mat.BorderColor = 3590055038--3705261453--2712577864 
	mat.FillColor = 503316480--2673957440--503316480--3590055038--3705261453--503316480---2712577864--1162758216
	mat.PulseColor= 503316480--503316480--3590055038--3705261453--503316480--3705261453--2712577864--1162758216
	mat.PartialLosColor = 10871039
	mat.NoLosColor = 10871039
	mat.PulseSize = 1
	mat.PulseLength = 1
    mat.GridPosX = center:x()
    mat.GridPosY = center:y()
  end
  mat.center = center:IsValidZ() and center or center:SetTerrainZ()
  mat.radius1 = r1
  mat.radius2 = r2
  mat.ray1 = ray1
  mat.ray2 = ray2
  mat.main_ray = main_ray
  mat.vertical_angle = MulDivRound(cone_angle, 3141, 10800)
  mat.horizontal_angle = mat.vertical_angle
  mat.Transparency0_Distance = r2 * (falloff_percent or 100) / 100
  mat.Transparency1_Distance = mat.Transparency0_Distance + (r2 - mat.Transparency0_Distance) * 33 / 100
  mat.Transparency2_Distance = mat.Transparency0_Distance + (r2 - mat.Transparency0_Distance) * 66 / 100
  mat.Transparency3_Distance = r2
  mat.dirty = true
  obj:SetCRMaterial(mat)
  if avgx then
    obj:SetPos(avgx, avgy, terrain.GetHeight(avgx, avgy))
  end
  return obj, avgx and terrain.GetHeight(avgx, avgy)
end

function CreateAOETilesSector_Snap(voxels, step_objs, values, obj, center, target, r1, r2, cone_angle, material, falloff_percent)
  
  local dir_angle = CalcOrientation(center, target)
  local ray1 = RotateRadius(4096, dir_angle - cone_angle / 2 + 5400)
  local ray2 = RotateRadius(4096, dir_angle + cone_angle / 2 - 5400)
  local main_ray = RotateRadius(4096, dir_angle)
  local mesh, avgx, avgy = CreateAOETiles(voxels, step_objs, values)
  if not obj then
    obj = Mesh:new()
    obj:SetMeshFlags(const.mfWorldSpace)
  end
  obj:SetMesh(mesh)
  local mat  --obj.CRMaterial

	
  if not mat then
    mat = CRM_AOETilesMaterial:GetById("Overwatch_Default"):Clone()
	
	mat.BorderColor = 1216181075--503316480--503316480
	mat.FillColor = 503316480
	mat.PulseColor= 503316480
	mat.PartialLosColor = 10871039
	mat.NoLosColor = 10871039
	mat.PulseSize = 10
	mat.PulseLength = 10
	
    mat.GridPosX = center:x()
    mat.GridPosY = center:y()
  end
  mat.center = center:IsValidZ() and center or center:SetTerrainZ()
  mat.radius1 = r1
  mat.radius2 = r2
  mat.ray1 = ray1
  mat.ray2 = ray2
  mat.main_ray = main_ray
  mat.vertical_angle = MulDivRound(cone_angle, 3141, 10800)
  mat.horizontal_angle = mat.vertical_angle
  mat.Transparency0_Distance = r2 * (falloff_percent or 100) / 100
  mat.Transparency1_Distance = mat.Transparency0_Distance + (r2 - mat.Transparency0_Distance) * 33 / 100
  mat.Transparency2_Distance = mat.Transparency0_Distance + (r2 - mat.Transparency0_Distance) * 66 / 100
  mat.Transparency3_Distance = r2
  mat.dirty = true
  obj:SetCRMaterial(mat)
  if avgx then
    obj:SetPos(avgx, avgy, terrain.GetHeight(avgx, avgy))
  end
  return obj, avgx and terrain.GetHeight(avgx, avgy)
end




