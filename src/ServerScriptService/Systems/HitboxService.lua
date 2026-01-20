local HitboxService = {}

local function collectHumanoids(parts)
  local seen = {}
  local targets = {}

  for _, part in ipairs(parts or {}) do
    local model = part:FindFirstAncestorOfClass("Model")
    if model and not seen[model] then
      local humanoid = model:FindFirstChildOfClass("Humanoid")
      if humanoid and humanoid.Health > 0 then
        seen[model] = true
        table.insert(targets, { Model = model, Humanoid = humanoid })
      end
    end
  end

  return targets
end

function HitboxService.createOverlapParams(exclude)
  local params = OverlapParams.new()
  params.FilterType = Enum.RaycastFilterType.Exclude
  params.FilterDescendantsInstances = exclude or {}
  return params
end

function HitboxService.getTargetsInBox(cframe, size, overlapParams)
  local parts = workspace:GetPartBoundsInBox(cframe, size, overlapParams)
  return collectHumanoids(parts)
end

function HitboxService.getTargetsInRadius(position, radius, overlapParams)
  local parts = workspace:GetPartBoundsInRadius(position, radius, overlapParams)
  return collectHumanoids(parts)
end

function HitboxService.filterTargets(targets, ignoreModel)
  local filtered = {}
  for _, target in ipairs(targets or {}) do
    if target.Model ~= ignoreModel then
      table.insert(filtered, target)
    end
  end
  return filtered
end

function HitboxService.applyDamage(targets, damage)
  for _, target in ipairs(targets or {}) do
    target.Humanoid:TakeDamage(damage)
  end
end

return HitboxService
