local Balance = require(game.ReplicatedStorage.Config.Balance)

local AttributeShop = {}

AttributeShop.Items = {
  Strength = { BaseCost = 100, Value = 1 },
  Agility = { BaseCost = 100, Value = 1 },
  Intelligence = { BaseCost = 100, Value = 1 },
  Vitality = { BaseCost = 100, Value = 1 },
  Luck = { BaseCost = 120, Value = 1 },
}

function AttributeShop.getCost(attributeName, useRareCurrency)
  local item = AttributeShop.Items[attributeName]
  if not item then
    return nil
  end

  if useRareCurrency then
    return item.BaseCost * Balance.RareCurrencyCostMultiplier
  end

  return item.BaseCost
end

return AttributeShop
