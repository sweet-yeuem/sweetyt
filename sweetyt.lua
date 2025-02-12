-- Initialize HttpService to get UniverseID
local UniverseID = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..game.PlaceId.."/universe")).universeId

-- Create a GUI to show script names
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Select Script to Run"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSans
titleLabel.TextSize = 20
titleLabel.Parent = frame

local buttonSize = UDim2.new(1, 0, 0, 30)
local buttonSpacing = UDim2.new(0, 0, 0, 5)
local buttons = {}

-- Function to create a button for each script
local function createButton(scriptName, loadUrl)
    local button = Instance.new("TextButton")
    button.Size = buttonSize
    button.Text = scriptName
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    button.Parent = frame
    table.insert(buttons, button)

    button.MouseButton1Click:Connect(function()
        -- When the button is clicked, execute the corresponding script
        loadstring(game:HttpGet(loadUrl))()
    end)
end

-- Create buttons for each script based on the game PlaceId
if game.PlaceId == 1537690962 or game.PlaceId == 4079902982 then
    createButton("BSS Rewrite", "https://raw.githubusercontent.com/hlamx/huhu/master/bssrewrite-obfuscated.lua")
    createButton("BSS BananaCat", "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BSS-BananaCat.lua")
elseif game.PlaceId == 10260193230 then
    createButton("Seahuhu BananaCat", "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/Seahuhu-BananaCat.lua")
elseif game.PlaceId == 7449423635 or game.PlaceId == 2753915549 or game.PlaceId == 4442272183 then
    createButton("BF BananaCat", "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-BananaCat.lua")
elseif game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 15759515082 or game.PlaceId == 5931540094 then
    createButton("KL BananaCat", "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/KL-BananaCat.lua")
elseif game.PlaceId == 18901165922 or game.PlaceId == 19006211286 then
    createButton("PetsGo", "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/PetsGo.lua")
elseif game.PlaceId == 16732694052 then
    createButton("Fisch", "https://raw.githubusercontent.com/AhmadV99/Banana-Cat-Hub/main/Fisch.lua")
elseif UniverseID == 5844593548 then
    createButton("Anime Reborn", "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AnimeReborn.lua")
else
    createButton("AV BananaCat", "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AV-BananaCat.lua")
end

-- Arrange buttons vertically with some spacing
for i, button in ipairs(buttons) do
    button.Position = UDim2.new(0, 0, 0.1 + (i - 1) * (button.Size.Y.Scale + buttonSpacing.Y.Scale), 0)
end
