local Players = game:GetService("Players")

local HudLayout = require(game.ReplicatedStorage.Config.HudLayout)

local player = Players.LocalPlayer
local remoteFolder = game.ReplicatedStorage:WaitForChild("Remotes", 5)
local statsRemote = remoteFolder and remoteFolder:FindFirstChild("StatsUpdate")

local function createBar(name, color, layout)
  local frame = Instance.new("Frame")
  frame.Name = name
  frame.BackgroundColor3 = HudLayout.Theme.Primary
  frame.BorderSizePixel = 0
  frame.Position = layout.Position
  frame.Size = layout.Size

  local fill = Instance.new("Frame")
  fill.Name = "Fill"
  fill.BackgroundColor3 = color
  fill.BorderSizePixel = 0
  fill.Size = UDim2.new(1, 0, 1, 0)
  fill.Parent = frame

  local label = Instance.new("TextLabel")
  label.Name = "Label"
  label.BackgroundTransparency = 1
  label.TextColor3 = HudLayout.Theme.Text
  label.Font = Enum.Font.GothamBold
  label.TextScaled = true
  label.Size = UDim2.new(1, 0, 1, 0)
  label.Parent = frame

  return frame
end

local function buildHud()
  local screenGui = Instance.new("ScreenGui")
  screenGui.Name = "MainHud"
  screenGui.ResetOnSpawn = false

  local healthBar = createBar("Health", HudLayout.Theme.Warning, HudLayout.Bars.Health)
  local manaBar = createBar("Mana", HudLayout.Theme.Accent, HudLayout.Bars.Mana)
  local staminaBar = createBar("Stamina", HudLayout.Theme.Success, HudLayout.Bars.Stamina)

  healthBar.Parent = screenGui
  manaBar.Parent = screenGui
  staminaBar.Parent = screenGui

  local hotbar = Instance.new("Frame")
  hotbar.Name = "Hotbar"
  hotbar.BackgroundTransparency = 1
  hotbar.Position = HudLayout.Hotbar.Position
  hotbar.Size = UDim2.new(0, (HudLayout.Hotbar.SlotSize.X.Offset + HudLayout.Hotbar.Gap) * HudLayout.Hotbar.SlotCount, 0, HudLayout.Hotbar.SlotSize.Y.Offset)
  hotbar.Parent = screenGui

  for i = 1, HudLayout.Hotbar.SlotCount do
    local slot = Instance.new("Frame")
    slot.Name = "Slot" .. i
    slot.BackgroundColor3 = HudLayout.Theme.Primary
    slot.BorderSizePixel = 0
    slot.Size = HudLayout.Hotbar.SlotSize
    slot.Position = UDim2.new(0, (i - 1) * (HudLayout.Hotbar.SlotSize.X.Offset + HudLayout.Hotbar.Gap), 0, 0)
    slot.Parent = hotbar

    local key = Instance.new("TextLabel")
    key.BackgroundTransparency = 1
    key.Text = tostring(i)
    key.TextColor3 = HudLayout.Theme.Text
    key.Font = Enum.Font.GothamBold
    key.TextScaled = true
    key.Size = UDim2.new(1, 0, 1, 0)
    key.Parent = slot
  end

  screenGui.Parent = player:WaitForChild("PlayerGui")
  return screenGui
end

local function bindCharacter(character, screenGui)
  local humanoid = character:WaitForChild("Humanoid")
  local healthFill = screenGui.Health.Fill
  local healthLabel = screenGui.Health.Label

  local manaFill = screenGui.Mana.Fill
  local manaLabel = screenGui.Mana.Label

  local staminaFill = screenGui.Stamina.Fill
  local staminaLabel = screenGui.Stamina.Label

  local maxMana = 100
  local maxStamina = 100
  local mana = maxMana
  local stamina = maxStamina

  local function updateHealth()
    local ratio = humanoid.Health / humanoid.MaxHealth
    healthFill.Size = UDim2.new(math.clamp(ratio, 0, 1), 0, 1, 0)
    healthLabel.Text = string.format("HP %d/%d", humanoid.Health, humanoid.MaxHealth)
  end

  local function updateMana()
    manaFill.Size = UDim2.new(mana / maxMana, 0, 1, 0)
    manaLabel.Text = string.format("Mana %d/%d", mana, maxMana)
  end

  local function updateStamina()
    staminaFill.Size = UDim2.new(stamina / maxStamina, 0, 1, 0)
    staminaLabel.Text = string.format("Stamina %d/%d", stamina, maxStamina)
  end

  humanoid.HealthChanged:Connect(updateHealth)
  updateHealth()
  updateMana()
  updateStamina()

  if statsRemote then
    statsRemote.OnClientEvent:Connect(function(payload)
      if payload.Mana then
        mana = payload.Mana
      end
      if payload.MaxMana then
        maxMana = payload.MaxMana
      end
      if payload.Stamina then
        stamina = payload.Stamina
      end
      if payload.MaxStamina then
        maxStamina = payload.MaxStamina
      end
      updateMana()
      updateStamina()
    end)
  end
end

local hud = buildHud()

if player.Character then
  bindCharacter(player.Character, hud)
end

player.CharacterAdded:Connect(function(character)
  bindCharacter(character, hud)
end)
