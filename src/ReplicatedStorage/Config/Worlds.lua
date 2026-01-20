local Worlds = {
  {
    Id = "FlorestaInicial",
    Name = "Floresta Inicial",
    LevelRange = { Min = 1, Max = 15 },
    Biome = "Forest",
    Description = "Área de início com mobs básicos e missões tutorial.",
  },
  {
    Id = "DesertoRubro",
    Name = "Deserto Rubro",
    LevelRange = { Min = 16, Max = 30 },
    Biome = "Desert",
    Description = "Inimigos resistentes, eventos de tempestade de areia.",
  },
  {
    Id = "Tundra",
    Name = "Tundra Congelada",
    LevelRange = { Min = 31, Max = 45 },
    Biome = "Tundra",
    Description = "Gelos e mobs com controle de movimento.",
  },
  {
    Id = "Pantano",
    Name = "Pântano Sombrio",
    LevelRange = { Min = 46, Max = 60 },
    Biome = "Swamp",
    Description = "Debuffs, venenos e elites.",
  },
}

return Worlds
