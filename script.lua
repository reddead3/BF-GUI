-- Vérifie qu'on est bien dans Blox Fruits (1er monde)
if game.PlaceId ~= 2753915549 then
    return warn("Ce script fonctionne uniquement dans Blox Fruits (1er monde).")
end

-- GUI Setup
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "CustomBFGui"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- Fonction utilitaire pour créer un bouton
local function createButton(name, positionY, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 40)
    button.Position = UDim2.new(0, 20, 0, positionY)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 80)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Text = text
    button.Name = name
    button.Parent = gui
    button.MouseButton1Click:Connect(callback)
end

-- Fonction de TP
local function tpTo(position)
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(position)
end

-- Boutons (avec bons décalages Y)
createButton("TPMiddle", 0.2, "📍 TP Middle Town", function()
    tpTo(Vector3.new(-655.8, 7.8, 1434.7))
end)

createButton("TPJungle", 0.3, "📍 TP Jungle", function()
    tpTo(Vector3.new(-1249.7, 11.8, 341.4))
end)

createButton("Fermer", 0.4, "❌ Fermer le GUI", function()
    gui:Destroy()
end)

print("✅ GUI chargé avec succès !")
