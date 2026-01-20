local Abilities = require(game.ReplicatedStorage.Config.Abilities)

local AbilityService = {}

local cooldowns = {}

local function ensurePlayer(playerId)
  if not cooldowns[playerId] then
    cooldowns[playerId] = {}
  end
  return cooldowns[playerId]
end

function AbilityService.isOnCooldown(playerId, abilityId, now)
  local playerCooldowns = ensurePlayer(playerId)
  local readyAt = playerCooldowns[abilityId] or 0
  return now < readyAt
end

function AbilityService.activate(playerId, abilityId, now)
  local ability = Abilities[abilityId]
  if not ability then
    return false, "Habilidade nao encontrada"
  end

  local playerCooldowns = ensurePlayer(playerId)
  local readyAt = playerCooldowns[abilityId] or 0
  if now < readyAt then
    return false, "Habilidade em recarga"
  end

  playerCooldowns[abilityId] = now + ability.Cooldown
  return true, ability
end

function AbilityService.getPresentation(abilityId)
  local ability = Abilities[abilityId]
  if not ability then
    return nil
  end
  return {
    AnimationId = ability.AnimationId,
    Vfx = ability.Vfx,
    Hitbox = ability.Hitbox,
    Description = ability.Description,
  }
end

return AbilityService
