local Bosses = {
  GuardiaoDaFloresta = {
    Name = "Guardião da Floresta",
    Level = 15,
    World = "FlorestaInicial",
    Hp = 1200,
    Attack = 40,
    Drops = {
      Guaranteed = { "TituloGuardiao" },
      Rare = { "ArcoVerde", "MascaraFolha" },
    },
  },
  FeraDaTempestade = {
    Name = "Fera da Tempestade",
    Level = 30,
    World = "DesertoRubro",
    Hp = 2200,
    Attack = 65,
    Drops = {
      Guaranteed = { "TituloTempestade" },
      Rare = { "LaminaRelampago", "MantoAreia" },
    },
  },
  ReiDoGelo = {
    Name = "Rei do Gelo",
    Level = 45,
    World = "Tundra",
    Hp = 3200,
    Attack = 85,
    Drops = {
      Guaranteed = { "TituloReiDoGelo" },
      Rare = { "CajadoPolar", "ArmaduraCristal" },
    },
  },
  RainhaDoLodo = {
    Name = "Rainha do Lodo",
    Level = 60,
    World = "Pantano",
    Hp = 4500,
    Attack = 105,
    Drops = {
      Guaranteed = { "TituloPantano" },
      Rare = { "AdagaLodo", "AmuletoVeneno" },
    },
  },
}

return Bosses
