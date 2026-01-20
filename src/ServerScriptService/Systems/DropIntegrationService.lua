local InventoryService = require(game.ServerScriptService.Systems.InventoryService)
local DropService = require(game.ServerScriptService.Systems.DropService)
local DropPickupService = require(game.ServerScriptService.Systems.DropPickupService)

local DropIntegrationService = {}

function DropIntegrationService.spawnAndBindDrops(mobConfig, biome, position, parent, profileLookup)
  local dropData = DropService.generateMobDrops(mobConfig, biome)
  local container = DropService.spawnDropParts(dropData, position, parent)

  DropPickupService.bindPickup(container, function(character, part)
    local profile = profileLookup and profileLookup(character)
    if not profile then
      return
    end

    local currency = part:GetAttribute("Currency")
    local rareCurrency = part:GetAttribute("RareCurrency")
    local itemId = part:GetAttribute("ItemId")

    if currency then
      InventoryService.addCurrency(profile, currency)
    end
    if rareCurrency then
      InventoryService.addRareCurrency(profile, rareCurrency)
    end
    if itemId then
      InventoryService.addItem(profile, itemId, 1)
    end
  end)

  return container, dropData
end

return DropIntegrationService
