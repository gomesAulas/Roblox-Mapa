local Rewards = require(game.ReplicatedStorage.Config.Rewards)

local PartyService = {}

local parties = {}
local nextPartyId = 1

local function createParty(ownerId)
  local partyId = nextPartyId
  nextPartyId = nextPartyId + 1

  parties[partyId] = {
    Id = partyId,
    OwnerId = ownerId,
    Members = { ownerId },
  }

  return parties[partyId]
end

function PartyService.createParty(ownerId)
  return createParty(ownerId)
end

function PartyService.addMember(partyId, playerId)
  local party = parties[partyId]
  if not party then
    return false
  end

  for _, memberId in ipairs(party.Members) do
    if memberId == playerId then
      return false
    end
  end

  table.insert(party.Members, playerId)
  return true
end

function PartyService.removeMember(partyId, playerId)
  local party = parties[partyId]
  if not party then
    return false
  end

  for index, memberId in ipairs(party.Members) do
    if memberId == playerId then
      table.remove(party.Members, index)
      if party.OwnerId == playerId then
        party.OwnerId = party.Members[1]
      end
      return true
    end
  end

  return false
end

function PartyService.splitRewards(partyId, rewards)
  local party = parties[partyId]
  if not party then
    return {}
  end

  local count = #party.Members
  if count == 0 then
    return {}
  end

  local split = {
    Currency = (rewards.Currency or 0) * Rewards.PartyShare.CurrencySplit / count,
    Xp = (rewards.Xp or 0) * Rewards.PartyShare.XpSplit / count,
    Drop = (rewards.Drop or 0) * Rewards.PartyShare.DropSplit / count,
  }

  local perPlayer = {}
  for _, memberId in ipairs(party.Members) do
    perPlayer[memberId] = split
  end

  return perPlayer
end

return PartyService
