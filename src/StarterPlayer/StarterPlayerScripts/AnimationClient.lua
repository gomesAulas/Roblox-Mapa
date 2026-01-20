local Players = game:GetService("Players")

local Animations = require(game.ReplicatedStorage.Config.Animations)

local player = Players.LocalPlayer

local function loadAnimation(animator, animationId)
  local animation = Instance.new("Animation")
  animation.AnimationId = animationId
  return animator:LoadAnimation(animation)
end

local function applyAnimations(character)
  local humanoid = character:WaitForChild("Humanoid")
  local animator = humanoid:WaitForChild("Animator")

  local base = Animations.Base
  local idleTrack = base and base.Idle and loadAnimation(animator, base.Idle)
  local runTrack = base and base.Run and loadAnimation(animator, base.Run)

  if idleTrack then
    idleTrack.Priority = Enum.AnimationPriority.Idle
    idleTrack:Play()
  end

  humanoid.Running:Connect(function(speed)
    if not runTrack then
      return
    end
    if speed > 0.1 then
      if not runTrack.IsPlaying then
        runTrack.Priority = Enum.AnimationPriority.Movement
        runTrack:Play()
      end
    else
      if runTrack.IsPlaying then
        runTrack:Stop()
      end
    end
  end)
end

if player.Character then
  applyAnimations(player.Character)
end

player.CharacterAdded:Connect(function(character)
  applyAnimations(character)
end)
