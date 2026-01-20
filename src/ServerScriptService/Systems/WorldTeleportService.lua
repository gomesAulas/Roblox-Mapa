local WorldSpawns = require(game.ReplicatedStorage.Config.WorldSpawns)

local WorldTeleportService = {}

function WorldTeleportService.getSpawnCFrame(worldId, spawnId)
  local world = WorldSpawns[worldId]
  if not world then
    return nil
  end
  return world[spawnId or "Default"]
end

function WorldTeleportService.teleportCharacter(character, worldId, spawnId)
  local root = character and character:FindFirstChild("HumanoidRootPart")
  local cframe = WorldTeleportService.getSpawnCFrame(worldId, spawnId)
  if root and cframe then
    root.CFrame = cframe
    return true
  end
  return false
end

return WorldTeleportService
