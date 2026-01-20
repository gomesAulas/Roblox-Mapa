local Mobs = require(game.ReplicatedStorage.Config.Mobs)
local Bosses = require(game.ReplicatedStorage.Config.Bosses)
local MobAIService = require(game.ServerScriptService.Systems.MobAIService)

local MobSpawnService = {}

local function spawnModel(template, spawnCFrame, parent)
  local clone = template:Clone()
  clone:PivotTo(spawnCFrame)
  clone.Parent = parent or workspace
  return clone
end

function MobSpawnService.spawnMob(template, mobId, spawnCFrame, parent)
  local config = Mobs[mobId]
  if not config then
    return nil, "Mob nao encontrado"
  end

  local mob = spawnModel(template, spawnCFrame, parent)
  MobAIService.start(mob, config)
  return mob, config
end

function MobSpawnService.spawnBoss(template, bossId, spawnCFrame, parent)
  local config = Bosses[bossId]
  if not config then
    return nil, "Boss nao encontrado"
  end

  local boss = spawnModel(template, spawnCFrame, parent)
  MobAIService.start(boss, { Attack = config.Attack })
  return boss, config
end

return MobSpawnService
