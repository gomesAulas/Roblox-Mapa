local InventoryService = {}

function InventoryService.addItem(profile, itemId, amount)
  if not profile then
    return false
  end

  profile.Items = profile.Items or {}
  local qty = amount or 1
  for _ = 1, qty do
    table.insert(profile.Items, itemId)
  end

  return true
end

function InventoryService.addCurrency(profile, amount)
  if not profile then
    return false
  end

  profile.Currency = (profile.Currency or 0) + (amount or 0)
  return true
end

function InventoryService.addRareCurrency(profile, amount)
  if not profile then
    return false
  end

  profile.RareCurrency = (profile.RareCurrency or 0) + (amount or 0)
  return true
end

return InventoryService
