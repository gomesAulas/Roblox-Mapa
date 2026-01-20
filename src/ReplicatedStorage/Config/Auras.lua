local Auras = {
  AuraFogo = {
    Name = "Aura de Fogo",
    Cosmetic = "Chamas ao redor",
    Bonuses = { AttackPercent = 0.02, BurnChance = 0.05 },
  },
  AuraGelo = {
    Name = "Aura de Gelo",
    Cosmetic = "Brilho azulado",
    Bonuses = { DefensePercent = 0.02, SlowChance = 0.05 },
  },
  AuraRaio = {
    Name = "Aura de Raio",
    Cosmetic = "Faíscas elétricas",
    Bonuses = { SpeedPercent = 0.02, CritChance = 0.02 },
  },
}

return Auras
