local Rewards = {}

Rewards.Codes = {
  BEMVINDO = {
    Currency = 500,
    RareCurrency = 1,
    Items = { "PocaoPequena" },
    Xp = 250,
  },
  ANIME2024 = {
    Currency = 1500,
    Items = { "EspadaRelampago", "CapaSombra" },
    Xp = 1000,
    AccountRewards = {
      Badges = { "EventoFundador" },
      AvatarItems = { "CapaAnime" },
    },
  },
}

Rewards.AccountRewards = {
  Badges = {
    EventoFundador = 1234567890,
    VencedorRaid = 2234567890,
  },
  AvatarItems = {
    CapaAnime = 3344556677,
    MascaraLendaria = 7788990011,
  },
}

Rewards.PartyShare = {
  CurrencySplit = 1.0,
  XpSplit = 1.0,
  DropSplit = 1.0,
}

Rewards.Guild = {
  BaseXpShare = 0.05,
  RankBonuses = {
    Iniciante = 0.0,
    Bronze = 0.02,
    Prata = 0.05,
    Ouro = 0.08,
    Lendaria = 0.12,
  },
}

return Rewards
