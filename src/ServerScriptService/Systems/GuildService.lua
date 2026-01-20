local Rewards = require(game.ReplicatedStorage.Config.Rewards)

local GuildService = {}

local guilds = {}
local nextGuildId = 1

local function createGuild(name, ownerId)
  local guildId = nextGuildId
  nextGuildId = nextGuildId + 1

  guilds[guildId] = {
    Id = guildId,
    Name = name,
    OwnerId = ownerId,
    Rank = "Iniciante",
    Members = { ownerId },
    TotalXp = 0,
  }

  return guilds[guildId]
end

function GuildService.createGuild(name, ownerId)
  return createGuild(name, ownerId)
end

function GuildService.addMember(guildId, playerId)
  local guild = guilds[guildId]
  if not guild then
    return false
  end

  for _, memberId in ipairs(guild.Members) do
    if memberId == playerId then
      return false
    end
  end

  table.insert(guild.Members, playerId)
  return true
end

function GuildService.removeMember(guildId, playerId)
  local guild = guilds[guildId]
  if not guild then
    return false
  end

  for index, memberId in ipairs(guild.Members) do
    if memberId == playerId then
      table.remove(guild.Members, index)
      if guild.OwnerId == playerId then
        guild.OwnerId = guild.Members[1]
      end
      return true
    end
  end

  return false
end

function GuildService.addGuildXp(guildId, xp)
  local guild = guilds[guildId]
  if not guild then
    return 0
  end

  guild.TotalXp = guild.TotalXp + xp
  return guild.TotalXp
end

function GuildService.getGuildXpShare(guildId)
  local guild = guilds[guildId]
  if not guild then
    return 0
  end

  local rankBonus = Rewards.Guild.RankBonuses[guild.Rank] or 0
  return Rewards.Guild.BaseXpShare + rankBonus
end

return GuildService
