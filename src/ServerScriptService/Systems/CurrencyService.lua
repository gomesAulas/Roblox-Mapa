local Balance = require(game.ReplicatedStorage.Config.Balance)

local CurrencyService = {}

function CurrencyService.calculateRareCurrencyDrop(chance)
  local roll = math.random()
  if roll <= chance then
    return 1
  end
  return 0
end

function CurrencyService.applyRareCurrencyCost(baseCost)
  return baseCost * Balance.RareCurrencyCostMultiplier
end

return CurrencyService
