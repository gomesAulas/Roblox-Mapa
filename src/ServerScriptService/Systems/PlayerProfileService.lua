local Players = game:GetService("Players")

local PlayerProfileService = {}

local profiles = {}

local function createProfile(player)
  return {
    PlayerId = player.UserId,
    Level = 1,
    Xp = 0,
    Currency = 0,
    RareCurrency = 0,
    Mana = 100,
    MaxMana = 100,
    Stamina = 100,
    MaxStamina = 100,
    Items = {},
    Attributes = {
      Strength = 1,
      Agility = 1,
      Intelligence = 1,
    },
    ActiveAuras = {},
  }
end

function PlayerProfileService.getProfile(player)
  return profiles[player.UserId]
end

function PlayerProfileService.ensureProfile(player)
  if not profiles[player.UserId] then
    profiles[player.UserId] = createProfile(player)
  end
  return profiles[player.UserId]
end

function PlayerProfileService.removeProfile(player)
  profiles[player.UserId] = nil
end

Players.PlayerAdded:Connect(function(player)
  PlayerProfileService.ensureProfile(player)
end)

Players.PlayerRemoving:Connect(function(player)
  PlayerProfileService.removeProfile(player)
end)

return PlayerProfileService
