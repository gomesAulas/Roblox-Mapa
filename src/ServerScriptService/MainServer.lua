local PortalRuntimeService = require(game.ServerScriptService.Systems.PortalRuntimeService)
local MobSpawnerRuntimeService = require(game.ServerScriptService.Systems.MobSpawnerRuntimeService)
require(game.ServerScriptService.Systems.ManaStaminaService)

PortalRuntimeService.bindAll()
MobSpawnerRuntimeService.bindZones()
