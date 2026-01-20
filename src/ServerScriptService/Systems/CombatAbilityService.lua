local AbilityService = require(game.ServerScriptService.Systems.AbilityService)
local CombatService = require(game.ServerScriptService.Systems.CombatService)
local HitboxService = require(game.ServerScriptService.Systems.HitboxService)

local CombatAbilityService = {}

local function buildHitTargets(attackerModel, hitbox, overlapParams)
  if hitbox.Shape == "Arc" then
    local cframe = attackerModel:GetPivot()
    local radius = hitbox.Radius or 6
    local targets = HitboxService.getTargetsInRadius(cframe.Position, radius, overlapParams)
    return HitboxService.filterTargets(targets, attackerModel)
  end

  if hitbox.Shape == "Dash" then
    local cframe = attackerModel:GetPivot()
    local length = hitbox.Length or 10
    local width = hitbox.Width or 4
    local size = Vector3.new(width, 4, length)
    local offset = cframe * CFrame.new(0, 0, -length / 2)
    local targets = HitboxService.getTargetsInBox(offset, size, overlapParams)
    return HitboxService.filterTargets(targets, attackerModel)
  end

  return {}
end

function CombatAbilityService.execute(attackerStats, attackerModel, abilityId, now)
  local success, abilityOrMessage = AbilityService.activate(attackerStats.PlayerId, abilityId, now)
  if not success then
    return false, abilityOrMessage
  end

  local ability = abilityOrMessage
  if ability.Type ~= "Attack" then
    return true, ability
  end

  local overlapParams = HitboxService.createOverlapParams({ attackerModel })
  local targets = buildHitTargets(attackerModel, ability.Hitbox or {}, overlapParams)
  local damage = CombatService.calculateDamage(attackerStats, 0)

  HitboxService.applyDamage(targets, math.floor(damage * (ability.PowerScale or 1)))
  return true, ability, targets
end

return CombatAbilityService
