local Balance = require(game.ReplicatedStorage.Config.Balance)
local Classes = require(game.ReplicatedStorage.Config.Classes)
local RankCaps = require(game.ReplicatedStorage.Config.RankCaps)

local PlayerStats = {}

local function getRankBonus(rankName)
  for _, rank in ipairs(RankCaps) do
    if rank.Rank == rankName then
      return rank.AttackBonus
    end
  end
  return 0
end

function PlayerStats.getAttackSoftCap(level, className, rankName)
  local classTier = 1
  if Classes[className] then
    classTier = Classes[className].Tier
  end
  local rankBonus = getRankBonus(rankName)
  return Balance.AttackSoftCap.Base
    + Balance.AttackSoftCap.PerLevel * level
    + Balance.AttackSoftCap.PerClassTier * classTier
    + Balance.AttackSoftCap.PerRank * rankBonus
end

function PlayerStats.calculateBaseAttack(attributes)
  local strength = attributes.Strength or 0
  local agility = attributes.Agility or 0
  local intelligence = attributes.Intelligence or 0

  return Balance.BaseAttack
    + strength * Balance.AttributeWeights.Strength.Attack
    + agility * Balance.AttributeWeights.Agility.Attack
    + intelligence * Balance.AttributeWeights.Intelligence.Attack
end

function PlayerStats.applySoftCap(attackValue, softCap)
  if attackValue <= softCap then
    return attackValue
  end

  local overflow = attackValue - softCap
  local reducedOverflow = overflow * 0.5
  return softCap + reducedOverflow
end

return PlayerStats
