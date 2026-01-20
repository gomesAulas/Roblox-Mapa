local Abilities = {
  CorteRelampago = {
    Name = "Corte Relâmpago",
    Type = "Attack",
    Element = "Relampago",
    Cooldown = 6,
    PowerScale = 1.4,
    Cost = { Mana = 15 },
    AnimationId = "rbxassetid://522635514",
    Vfx = {
      Color = Color3.fromRGB(120, 200, 255),
      Trail = "Relampago",
      Impact = "Choque",
    },
    Hitbox = {
      Shape = "Arc",
      Radius = 8,
      Angle = 90,
    },
    Description = "Golpe rápido em arco com dano elétrico.",
  },
  EscudoArcano = {
    Name = "Escudo Arcano",
    Type = "Defense",
    Element = "Arcano",
    Cooldown = 12,
    PowerScale = 0.0,
    Cost = { Mana = 20 },
    AnimationId = "rbxassetid://507767968",
    Vfx = {
      Color = Color3.fromRGB(175, 120, 255),
      Aura = "Escudo",
    },
    Hitbox = {
      Shape = "Self",
      Radius = 0,
    },
    Description = "Gera uma barreira temporária que reduz dano recebido.",
  },
  InvestidaFera = {
    Name = "Investida da Fera",
    Type = "Attack",
    Element = "Terra",
    Cooldown = 8,
    PowerScale = 1.2,
    Cost = { Stamina = 20 },
    AnimationId = "rbxassetid://507767968",
    Vfx = {
      Color = Color3.fromRGB(255, 180, 90),
      Trail = "Terra",
      Impact = "Estouro",
    },
    Hitbox = {
      Shape = "Dash",
      Length = 12,
      Width = 4,
    },
    Description = "Avança em linha reta e empurra inimigos.",
  },
}

return Abilities
