local Quests = {
  Introducao = {
    Name = "Introdução ao Mundo",
    Level = 1,
    Objectives = {
      { Type = "Kill", Target = "LoboSombrio", Count = 3 },
      { Type = "Collect", Item = "PeleLobo", Count = 2 },
    },
    Rewards = { Currency = 100, Xp = 150, Items = { "PocaoPequena" } },
  },
  TempestadeRubro = {
    Name = "Tempestade no Deserto",
    Level = 20,
    Objectives = {
      { Type = "Kill", Target = "EscorpiaoRubra", Count = 5 },
    },
    Rewards = { Currency = 300, Xp = 500, Items = { "CapaSombra" } },
  },
}

return Quests
