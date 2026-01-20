local Portals = require(game.ReplicatedStorage.Config.Portals)

local PortalService = {}

local function findPortal(portalId)
  for _, portal in ipairs(Portals) do
    if portal.Id == portalId then
      return portal
    end
  end
  return nil
end

function PortalService.getPortal(portalId)
  return findPortal(portalId)
end

function PortalService.canEnter(portalId, profile)
  local portal = findPortal(portalId)
  if not portal then
    return false, "Portal nao encontrado"
  end

  local level = profile and profile.Level or 1
  if level < portal.RequiredLevel then
    return false, "Nivel insuficiente"
  end

  return true, portal.To
end

return PortalService
