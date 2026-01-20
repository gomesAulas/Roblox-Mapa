local Rewards = require(game.ReplicatedStorage.Config.Rewards)

local CodeRedeemService = {}

local redeemedByPlayer = {}

local function ensurePlayerRecord(playerId)
  if not redeemedByPlayer[playerId] then
    redeemedByPlayer[playerId] = {}
  end
  return redeemedByPlayer[playerId]
end

local function appendAll(target, values)
  for _, value in ipairs(values or {}) do
    table.insert(target, value)
  end
end

function CodeRedeemService.redeem(playerId, code, profile)
  if not code or code == "" then
    return false, "Codigo invalido"
  end

  local normalized = string.upper(code)
  local reward = Rewards.Codes[normalized]
  if not reward then
    return false, "Codigo nao encontrado"
  end

  local record = ensurePlayerRecord(playerId)
  if record[normalized] then
    return false, "Codigo ja usado"
  end

  record[normalized] = true

  profile.Currency = (profile.Currency or 0) + (reward.Currency or 0)
  profile.RareCurrency = (profile.RareCurrency or 0) + (reward.RareCurrency or 0)
  profile.Xp = (profile.Xp or 0) + (reward.Xp or 0)
  profile.Items = profile.Items or {}
  profile.AccountRewardsPending = profile.AccountRewardsPending or {
    Badges = {},
    AvatarItems = {},
  }

  appendAll(profile.Items, reward.Items)

  if reward.AccountRewards then
    appendAll(profile.AccountRewardsPending.Badges, reward.AccountRewards.Badges)
    appendAll(profile.AccountRewardsPending.AvatarItems, reward.AccountRewards.AvatarItems)
  end

  return true, "Recompensa aplicada", reward
end

return CodeRedeemService
