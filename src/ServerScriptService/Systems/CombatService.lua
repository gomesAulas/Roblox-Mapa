local PlayerStats = require(game.ServerScriptService.Systems.PlayerStats)

local CombatService = {}

function CombatService.calculateDamage(attackerStats, targetDefense)
  local baseAttack = PlayerStats.calculateBaseAttack(attackerStats.Attributes or {})
  local softCap = PlayerStats.getAttackSoftCap(
    attackerStats.Level or 1,
    attackerStats.Class or "Warrior",
    attackerStats.Rank or "Iniciante"
  )

  local finalAttack = PlayerStats.applySoftCap(baseAttack, softCap)
  local defense = targetDefense or 0
  local damage = math.max(finalAttack - defense, 1)
  return math.floor(damage)
end

return CombatService
