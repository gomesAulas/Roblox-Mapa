local Animations = {}

Animations.Base = {
  Idle = "rbxassetid://507766666",
  Walk = "rbxassetid://507777826",
  Run = "rbxassetid://507767714",
  Jump = "rbxassetid://507765000",
  Fall = "rbxassetid://507767968",
  Land = "rbxassetid://507767968",
}

Animations.Classes = {
  Espadachim = {
    Idle = "rbxassetid://616006778",
    Walk = "rbxassetid://616008087",
    Run = "rbxassetid://616008936",
    Ability = {
      Corte = "rbxassetid://522635514",
      Finalizador = "rbxassetid://522635514",
    },
  },
  Mago = {
    Idle = "rbxassetid://507766666",
    Walk = "rbxassetid://507777826",
    Run = "rbxassetid://507767714",
    Ability = {
      Explosao = "rbxassetid://10559757335",
      Raio = "rbxassetid://10559757335",
    },
  },
}

Animations.Abilities = {
  Impacto = "rbxassetid://522635514",
  Cortina = "rbxassetid://10559757335",
}

return Animations
