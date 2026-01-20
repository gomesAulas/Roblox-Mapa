local Auras = require(game.ReplicatedStorage.Config.Auras)

local AuraService = {}

function AuraService.getAura(auraId)
  return Auras[auraId]
end

function AuraService.applyAura(profile, auraId)
  local aura = Auras[auraId]
  if not aura then
    return false, "Aura nao encontrada"
  end

  profile.ActiveAuras = profile.ActiveAuras or {}
  profile.ActiveAuras[auraId] = true
  return true, aura
end

function AuraService.removeAura(profile, auraId)
  if not profile.ActiveAuras then
    return false
  end

  profile.ActiveAuras[auraId] = nil
  return true
end

return AuraService
