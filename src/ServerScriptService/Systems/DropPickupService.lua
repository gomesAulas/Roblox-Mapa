local DropPickupService = {}

function DropPickupService.bindPickup(container, onPickup)
  for _, part in ipairs(container:GetChildren()) do
    if part:IsA("BasePart") then
      part.Touched:Connect(function(hit)
        local character = hit:FindFirstAncestorOfClass("Model")
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health > 0 then
          if onPickup then
            onPickup(character, part)
          end
          part:Destroy()
        end
      end)
    end
  end
end

return DropPickupService
