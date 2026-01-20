local BadgeService = game:GetService("BadgeService")
local MarketplaceService = game:GetService("MarketplaceService")

local Rewards = require(game.ReplicatedStorage.Config.Rewards)

local AccountRewardService = {}

local function resolveIds(list, mapping)
  local ids = {}
  for _, key in ipairs(list or {}) do
    local id = mapping and mapping[key]
    if id then
      table.insert(ids, id)
    end
  end
  return ids
end

function AccountRewardService.deliverBadges(player, badgeKeys)
  local ids = resolveIds(badgeKeys, Rewards.AccountRewards and Rewards.AccountRewards.Badges)
  for _, badgeId in ipairs(ids) do
    local hasBadge = false
    local ok, result = pcall(function()
      return BadgeService:UserHasBadgeAsync(player.UserId, badgeId)
    end)
    if ok then
      hasBadge = result
    end
    if not hasBadge then
      pcall(function()
        BadgeService:AwardBadge(player.UserId, badgeId)
      end)
    end
  end
  return ids
end

function AccountRewardService.promptAvatarItems(player, itemKeys)
  local ids = resolveIds(itemKeys, Rewards.AccountRewards and Rewards.AccountRewards.AvatarItems)
  for _, itemId in ipairs(ids) do
    pcall(function()
      MarketplaceService:PromptPurchase(player, itemId)
    end)
  end
  return ids
end

return AccountRewardService
