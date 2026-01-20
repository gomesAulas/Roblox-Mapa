local Players = game:GetService("Players")

local StatReplicationService = {}

local function ensureRemote()
  local remotes = game.ReplicatedStorage:FindFirstChild("Remotes")
  if not remotes then
    remotes = Instance.new("Folder")
    remotes.Name = "Remotes"
    remotes.Parent = game.ReplicatedStorage
  end

  local remote = remotes:FindFirstChild("StatsUpdate")
  if not remote then
    remote = Instance.new("RemoteEvent")
    remote.Name = "StatsUpdate"
    remote.Parent = remotes
  end

  return remote
end

local function getPlayer(profile)
  return Players:GetPlayerByUserId(profile.PlayerId)
end

function StatReplicationService.push(profile)
  if not profile then
    return
  end

  local player = getPlayer(profile)
  if not player then
    return
  end

  local remote = ensureRemote()
  remote:FireClient(player, {
    Mana = profile.Mana,
    MaxMana = profile.MaxMana,
    Stamina = profile.Stamina,
    MaxStamina = profile.MaxStamina,
    Level = profile.Level,
    Xp = profile.Xp,
    Currency = profile.Currency,
    RareCurrency = profile.RareCurrency,
  })
end

return StatReplicationService
