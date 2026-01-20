local CollectionService = game:GetService("CollectionService")
local ServerStorage = game:GetService("ServerStorage")
local RunService = game:GetService("RunService")

local SpawnZones = require(game.ReplicatedStorage.Config.SpawnZones)
local MobSpawnService = require(game.ServerScriptService.Systems.MobSpawnService)

local MobSpawnerRuntimeService = {}

local spawners = {}

local function getTemplate(templateName)
  local folder = ServerStorage:FindFirstChild("MobTemplates")
  if not folder then
    return nil
  end
  return folder:FindFirstChild(templateName)
end

local function spawnAtZone(zone)
  local template = getTemplate(zone.MobId)
  if not template then
    return
  end
  local center = zone.Part.Position
  local offset = Vector3.new(math.random(-zone.Radius, zone.Radius), 0, math.random(-zone.Radius, zone.Radius))
  local cframe = CFrame.new(center + offset)
  local mob = MobSpawnService.spawnMob(template, zone.MobId, cframe, workspace)
  if mob then
    table.insert(zone.Alive, mob)
    mob.Destroying:Connect(function()
      for index, alive in ipairs(zone.Alive) do
        if alive == mob then
          table.remove(zone.Alive, index)
          break
        end
      end
    end)
  end
end

local function tickZone(zone, now)
  if #zone.Alive >= zone.MaxAlive then
    return
  end
  if now - zone.LastSpawn >= zone.SpawnInterval then
    zone.LastSpawn = now
    spawnAtZone(zone)
  end
end

local function initZone(part, config)
  local zone = {
    Part = part,
    MobId = config.MobId,
    Biome = config.Biome,
    Radius = config.Radius or 30,
    SpawnInterval = config.SpawnInterval or 10,
    MaxAlive = config.MaxAlive or 6,
    LastSpawn = 0,
    Alive = {},
  }
  spawners[part] = zone
end

function MobSpawnerRuntimeService.bindZones()
  for _, config in ipairs(SpawnZones) do
    local part = workspace:FindFirstChild(config.Id)
    if part then
      initZone(part, config)
      CollectionService:AddTag(part, "MobSpawn")
    end
  end

  CollectionService:GetInstanceAddedSignal("MobSpawn"):Connect(function(part)
    local config = {
      MobId = part:GetAttribute("MobId") or "LoboSombrio",
      Biome = part:GetAttribute("Biome") or "Forest",
      Radius = part:GetAttribute("Radius") or 30,
      SpawnInterval = part:GetAttribute("SpawnInterval") or 10,
      MaxAlive = part:GetAttribute("MaxAlive") or 6,
    }
    initZone(part, config)
  end)

  RunService.Heartbeat:Connect(function(now)
    for _, zone in pairs(spawners) do
      tickZone(zone, now)
    end
  end)
end

return MobSpawnerRuntimeService
