local HudLayout = {}

HudLayout.Theme = {
  Primary = Color3.fromRGB(20, 20, 28),
  Accent = Color3.fromRGB(90, 200, 255),
  Warning = Color3.fromRGB(255, 120, 90),
  Success = Color3.fromRGB(120, 220, 160),
  Text = Color3.fromRGB(235, 235, 245),
}

HudLayout.Bars = {
  Health = { Position = UDim2.new(0.03, 0, 0.88, 0), Size = UDim2.new(0.28, 0, 0.035, 0) },
  Mana = { Position = UDim2.new(0.03, 0, 0.92, 0), Size = UDim2.new(0.22, 0, 0.028, 0) },
  Stamina = { Position = UDim2.new(0.03, 0, 0.95, 0), Size = UDim2.new(0.18, 0, 0.022, 0) },
}

HudLayout.Hotbar = {
  Position = UDim2.new(0.35, 0, 0.9, 0),
  SlotCount = 6,
  SlotSize = UDim2.new(0, 54, 0, 54),
  Gap = 8,
}

HudLayout.Minimap = {
  Position = UDim2.new(0.82, 0, 0.03, 0),
  Size = UDim2.new(0.16, 0, 0.18, 0),
}

HudLayout.StatusPanel = {
  Position = UDim2.new(0.03, 0, 0.03, 0),
  Size = UDim2.new(0.22, 0, 0.12, 0),
}

HudLayout.QuestTracker = {
  Position = UDim2.new(0.72, 0, 0.28, 0),
  Size = UDim2.new(0.25, 0, 0.22, 0),
}

HudLayout.Currency = {
  Position = UDim2.new(0.72, 0, 0.03, 0),
  Size = UDim2.new(0.22, 0, 0.06, 0),
}

return HudLayout
