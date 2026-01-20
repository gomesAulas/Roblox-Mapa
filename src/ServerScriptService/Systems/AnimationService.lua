local Animations = require(game.ReplicatedStorage.Config.Animations)

local AnimationService = {}

local function mergeAnimationSets(baseSet, overrideSet)
  local merged = {}
  for key, value in pairs(baseSet or {}) do
    merged[key] = value
  end
  for key, value in pairs(overrideSet or {}) do
    merged[key] = value
  end
  return merged
end

function AnimationService.getMovementSet(classId)
  local base = Animations.Base or {}
  local classSet = Animations.Classes and Animations.Classes[classId] or {}
  return mergeAnimationSets(base, classSet)
end

function AnimationService.getAbilityAnimation(abilityId, classId)
  local classSet = Animations.Classes and Animations.Classes[classId] or {}
  if classSet.Ability and classSet.Ability[abilityId] then
    return classSet.Ability[abilityId]
  end
  return Animations.Abilities and Animations.Abilities[abilityId] or nil
end

function AnimationService.getAbilityBundle(abilityIds, classId)
  local bundle = {}
  for _, abilityId in ipairs(abilityIds or {}) do
    bundle[abilityId] = AnimationService.getAbilityAnimation(abilityId, classId)
  end
  return bundle
end

return AnimationService
