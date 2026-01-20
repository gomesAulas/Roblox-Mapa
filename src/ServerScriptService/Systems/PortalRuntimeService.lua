local CollectionService = game:GetService("CollectionService")

local PlayerProfileService = require(game.ServerScriptService.Systems.PlayerProfileService)
local PortalService = require(game.ServerScriptService.Systems.PortalService)
local WorldTeleportService = require(game.ServerScriptService.Systems.WorldTeleportService)

local PortalRuntimeService = {}

local function ensurePrompt(portalPart)
  local prompt = portalPart:FindFirstChildOfClass("ProximityPrompt")
  if not prompt then
    prompt = Instance.new("ProximityPrompt")
    prompt.ActionText = "Entrar"
    prompt.ObjectText = portalPart.Name
    prompt.Parent = portalPart
  end
  return prompt
end

local function bindPortal(portalPart)
  local portalId = portalPart:GetAttribute("PortalId") or portalPart.Name
  local prompt = ensurePrompt(portalPart)

  prompt.Triggered:Connect(function(player)
    local profile = PlayerProfileService.getProfile(player)
    local ok, destination = PortalService.canEnter(portalId, profile)
    if ok then
      WorldTeleportService.teleportCharacter(player.Character, destination, "Default")
    end
  end)
end

function PortalRuntimeService.bindAll()
  for _, portal in ipairs(CollectionService:GetTagged("Portal")) do
    bindPortal(portal)
  end

  CollectionService:GetInstanceAddedSignal("Portal"):Connect(function(instance)
    bindPortal(instance)
  end)
end

return PortalRuntimeService
