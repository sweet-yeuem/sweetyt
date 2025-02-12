-- Kiểm tra xem game có phải là game với PlaceId = 2753915549 không
if game.PlaceId == 2753915549 then PlaceId == 1537690962 or game.PlaceId == 4079902982 then
    -- Initialize HttpService to get UniverseID
    local UniverseID = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..game.PlaceId.."/universe")).universeId

    -- Tạo GUI để hiển thị tên các script
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
            -- Khi nút được nhấn, thực thi script tương ứng
            loadstring(game:HttpGet(loadUrl))()
        end)
    end

    -- Tạo các nút cho mỗi script theo PlaceId của game
    if game.PlaceId == 2753915549 then
        createButton("BF BananaCat", "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-BananaCat.lua")
    end

    -- Sắp xếp các nút theo chiều dọc với một khoảng cách nhất định
    for i, button in ipairs(buttons) do
        button.Position = UDim2.new(0, 0, 0.1 + (i - 1) * (button.Size.Y.Scale + buttonSpacing.Y.Scale), 0)
    end
end
