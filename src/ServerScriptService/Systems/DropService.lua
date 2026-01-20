local DropTables = require(game.ReplicatedStorage.Config.DropTables)

local DropService = {}

local function pickRandom(list)
  if not list or #list == 0 then
    return nil
  end
  return list[math.random(1, #list)]
end

function DropService.generateMobDrops(mobConfig, biome)
  local drops = {
    Currency = 0,
    RareCurrency = 0,
    Items = {},
  }

  local tableConfig = biome and DropTables[biome]
  if tableConfig and tableConfig.Currency then
    drops.Currency = math.random(tableConfig.Currency.Min, tableConfig.Currency.Max)
  end

  if tableConfig and tableConfig.RareCurrencyChance then
    if math.random() <= tableConfig.RareCurrencyChance then
      drops.RareCurrency = 1
    end
  end

  local item = pickRandom(mobConfig and mobConfig.Drops)
  if item then
    table.insert(drops.Items, item)
  end

  return drops
end

function DropService.generateBossDrops(bossConfig)
  local drops = {
    Currency = 0,
    RareCurrency = 0,
    Items = {},
  }

  if bossConfig and bossConfig.Drops then
    for _, item in ipairs(bossConfig.Drops.Guaranteed or {}) do
      table.insert(drops.Items, item)
    end

    local rareItem = pickRandom(bossConfig.Drops.Rare or {})
    if rareItem then
      table.insert(drops.Items, rareItem)
    end
  end

  return drops
end

function DropService.spawnDropParts(dropData, position, parent)
  local container = Instance.new("Folder")
  container.Name = "Drops"
  container.Parent = parent or workspace

  local function spawnPart(name, color)
    local part = Instance.new("Part")
    part.Name = name
    part.Shape = Enum.PartType.Ball
    part.Size = Vector3.new(1, 1, 1)
    part.Color = color
    part.Position = position + Vector3.new(math.random(-2, 2), 2, math.random(-2, 2))
    part.Anchored = false
    part.CanCollide = false
    part.Parent = container
    return part
  end

  if dropData.Currency and dropData.Currency > 0 then
    local part = spawnPart("Moeda", Color3.fromRGB(255, 215, 0))
    part:SetAttribute("Currency", dropData.Currency)
  end

  if dropData.RareCurrency and dropData.RareCurrency > 0 then
    local part = spawnPart("MoedaRara", Color3.fromRGB(140, 90, 255))
    part:SetAttribute("RareCurrency", dropData.RareCurrency)
  end

  for _, item in ipairs(dropData.Items or {}) do
    local part = spawnPart(item, Color3.fromRGB(120, 220, 160))
    part:SetAttribute("ItemId", item)
  end

  return container
end

return DropService
