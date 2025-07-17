-- Vérifie qu'on est bien dans Blox Fruits (1er monde)
if game.PlaceId ~= 2753915549 then
    return warn("Ce script fonctionne uniquement dans Blox Fruits (1er monde).")
end

-- GUI Setup
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CustomBFGui"
gui.ResetOnSpawn = false

-- Fonction utilitaire pour créer un bouton
local function createButton(name, posY, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 20, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 80)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Text = text
    btn.Name = name
    btn.Parent = gui
    btn.MouseButton1Click:Connect(callback)
end

-- Téléportations
local function tpTo(position)
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(position)
end

-- Boutons
createButton("TPMiddle", 0.1, "📍 TP Middle Town", function()
    tpTo(Vector3.new(-655.8, 7.8, 1434.7))
end)

createButton("TPJungle", 0.2, "📍 TP Jungle", function()
    tpTo(Vector3.new(-1249.7, 11.8, 341.4))
end)

createButton("CloseGUI", 0.3, "❌ Fermer", function()
    gui:Destroy()
end)

print("✅ GUI chargé avec succès !")
