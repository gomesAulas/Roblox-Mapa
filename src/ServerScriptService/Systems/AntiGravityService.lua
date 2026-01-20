local Players = game:GetService("Players")

local AntiGravityService = {}

local function applyFloatForce(character, multiplier)
  local root = character:FindFirstChild("HumanoidRootPart")
  if not root then
    return nil
  end

  local attachment = root:FindFirstChild("AntiGravityAttachment")
  if not attachment then
    attachment = Instance.new("Attachment")
    attachment.Name = "AntiGravityAttachment"
    attachment.Parent = root
  end

  local force = root:FindFirstChild("AntiGravityForce")
  if not force then
    force = Instance.new("VectorForce")
    force.Name = "AntiGravityForce"
    force.ApplyAtCenterOfMass = true
    force.Attachment0 = attachment
    force.Parent = root
  end

  local mass = root.AssemblyMass
  local gravity = workspace.Gravity
  force.Force = Vector3.new(0, gravity * mass * (multiplier or 0.5), 0)
  return force
end

function AntiGravityService.setCharacterGravity(character, multiplier)
  if not character then
    return nil
  end

  if multiplier and multiplier > 0 then
    return applyFloatForce(character, multiplier)
  end

  local root = character:FindFirstChild("HumanoidRootPart")
  if root then
    local force = root:FindFirstChild("AntiGravityForce")
    if force then
      force:Destroy()
    end
    local attachment = root:FindFirstChild("AntiGravityAttachment")
    if attachment then
      attachment:Destroy()
    end
  end

  return nil
end

function AntiGravityService.bindZone(zonePart, multiplier)
  if not zonePart then
    return nil
  end

  zonePart.Touched:Connect(function(hit)
    local character = hit:FindFirstAncestorOfClass("Model")
    if character and Players:GetPlayerFromCharacter(character) then
      AntiGravityService.setCharacterGravity(character, multiplier)
    end
  end)

  zonePart.TouchEnded:Connect(function(hit)
    local character = hit:FindFirstAncestorOfClass("Model")
    if character and Players:GetPlayerFromCharacter(character) then
      AntiGravityService.setCharacterGravity(character, 0)
    end
  end)
end

return AntiGravityService
