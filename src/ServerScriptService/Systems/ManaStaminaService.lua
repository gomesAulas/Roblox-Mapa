local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local PlayerProfileService = require(game.ServerScriptService.Systems.PlayerProfileService)
local StatReplicationService = require(game.ServerScriptService.Systems.StatReplicationService)

local ManaStaminaService = {}

local connections = {}

local DEFAULTS = {
  MaxMana = 100,
  MaxStamina = 100,
  ManaRegen = 5,
  StaminaRegen = 6,
}

local function clamp(value, min, max)
  return math.max(min, math.min(max, value))
end

local function updateProfile(profile, deltaTime)
  profile.Mana = clamp(profile.Mana + DEFAULTS.ManaRegen * deltaTime, 0, profile.MaxMana)
  profile.Stamina = clamp(profile.Stamina + DEFAULTS.StaminaRegen * deltaTime, 0, profile.MaxStamina)
end

function ManaStaminaService.initializeProfile(profile)
  profile.MaxMana = profile.MaxMana or DEFAULTS.MaxMana
  profile.MaxStamina = profile.MaxStamina or DEFAULTS.MaxStamina
  profile.Mana = profile.Mana or profile.MaxMana
  profile.Stamina = profile.Stamina or profile.MaxStamina
end

function ManaStaminaService.consumeMana(profile, amount)
  if not profile or amount <= 0 then
    return false
  end
  if profile.Mana < amount then
    return false
  end
  profile.Mana = profile.Mana - amount
  StatReplicationService.push(profile)
  return true
end

function ManaStaminaService.consumeStamina(profile, amount)
  if not profile or amount <= 0 then
    return false
  end
  if profile.Stamina < amount then
    return false
  end
  profile.Stamina = profile.Stamina - amount
  StatReplicationService.push(profile)
  return true
end

function ManaStaminaService.bindPlayer(player)
  local profile = PlayerProfileService.ensureProfile(player)
  ManaStaminaService.initializeProfile(profile)
  StatReplicationService.push(profile)

  local connection
  connection = RunService.Heartbeat:Connect(function(deltaTime)
    updateProfile(profile, deltaTime)
    StatReplicationService.push(profile)
  end)
  connections[player.UserId] = connection
end

function ManaStaminaService.unbindPlayer(player)
  local connection = connections[player.UserId]
  if connection then
    connection:Disconnect()
    connections[player.UserId] = nil
  end
end

Players.PlayerAdded:Connect(function(player)
  ManaStaminaService.bindPlayer(player)
end)

Players.PlayerRemoving:Connect(function(player)
  ManaStaminaService.unbindPlayer(player)
end)

return ManaStaminaService
