local Balance = {}

Balance.BaseAttack = 10
Balance.BaseHealth = 100
Balance.AttributePointPerLevel = 5

Balance.AttributeWeights = {
  Strength = { Attack = 1.5 },
  Agility = { Attack = 0.75, CritChance = 0.01 },
  Intelligence = { Attack = 1.25 },
  Vitality = { Health = 10 },
  Luck = { DropChance = 0.005 },
}

Balance.RareCurrencyDropRate = 0.02
Balance.RareCurrencyCostMultiplier = 5

Balance.AttackSoftCap = {
  Base = 50,
  PerLevel = 2,
  PerRank = 10,
  PerClassTier = 15,
}

return Balance
