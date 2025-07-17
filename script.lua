--[[
✅ Script fait pour KRNL, Hydrogen, Arceus X, Delta (mobile compatible)
🎮 Blox Fruits | Simple Auto Farm UI
--]]

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ToggleFarm = Instance.new("TextButton")

-- UI Setup
ScreenGui.Parent = game.CoreGui
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

ToggleFarm.Size = UDim2.new(0, 180, 0, 40)
ToggleFarm.Position = UDim2.new(0, 10, 0, 30)
ToggleFarm.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
ToggleFarm.TextColor3 = Color3.new(1, 1, 1)
ToggleFarm.Text = "Activer Auto-Farm"
ToggleFarm.Parent = Frame

-- Logic
local farming = false

ToggleFarm.MouseButton1Click:Connect(function()
    farming = not farming
    ToggleFarm.Text = farming and "Stop Auto-Farm" or "Activer Auto-Farm"

    while farming do
        pcall(function()
            local plr = game.Players.LocalPlayer
            local mob = game:GetService("Workspace").Enemies:FindFirstChildWhichIsA("Model")
            if mob then
                repeat
                    plr.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    wait(0.5)
                until mob.Humanoid.Health <= 0 or not farming
            end
        end)
        wait(0.5)
    end
end)
