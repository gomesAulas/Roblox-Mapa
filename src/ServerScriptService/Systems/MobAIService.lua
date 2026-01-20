local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local MobAIService = {}

local DEFAULTS = {
  AggroRange = 50,
  AttackRange = 4,
  AttackCooldown = 2.5,
  WanderRadius = 12,
  WanderInterval = 4,
}

local function getClosestPlayer(position, maxDistance)
  local closest = nil
  local closestDistance = maxDistance

  for _, player in ipairs(Players:GetPlayers()) do
    local character = player.Character
    if character and character.PrimaryPart then
      local distance = (character.PrimaryPart.Position - position).Magnitude
      if distance < closestDistance then
        closest = character
        closestDistance = distance
      end
    end
  end

  return closest, closestDistance
end

function MobAIService.start(mobModel, mobConfig, options)
  local humanoid = mobModel:FindFirstChildOfClass("Humanoid")
  local root = mobModel.PrimaryPart or mobModel:FindFirstChild("HumanoidRootPart")
  if not humanoid or not root then
    return nil
  end

  local config = options or {}
  for key, value in pairs(DEFAULTS) do
    if config[key] == nil then
      config[key] = value
    end
  end

  local state = {
    LastAttack = 0,
    LastWander = 0,
  }

  local connection
  connection = RunService.Heartbeat:Connect(function(now)
    if humanoid.Health <= 0 then
      if connection then
        connection:Disconnect()
      end
      return
    end

    local target, distance = getClosestPlayer(root.Position, config.AggroRange)
    if target and target.PrimaryPart then
      humanoid:MoveTo(target.PrimaryPart.Position)

      if distance <= config.AttackRange and now - state.LastAttack >= config.AttackCooldown then
        state.LastAttack = now
        local targetHumanoid = target:FindFirstChildOfClass("Humanoid")
        if targetHumanoid then
          targetHumanoid:TakeDamage(mobConfig.Attack or 5)
        end
      end
    else
      if now - state.LastWander >= config.WanderInterval then
        state.LastWander = now
        local offset = Vector3.new(
          math.random(-config.WanderRadius, config.WanderRadius),
          0,
          math.random(-config.WanderRadius, config.WanderRadius)
        )
        humanoid:MoveTo(root.Position + offset)
      end
    end
  end)

  return connection
end

return MobAIService
