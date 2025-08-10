local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")

-- Создаем GUI
local gui = Instance.new("ScreenGui")
gui.Name = "GardenDupeProGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Цветовая схема
local COLOR_SCHEME = {
    dark_bg = Color3.fromRGB(30, 30, 35),
    light_bg = Color3.fromRGB(40, 40, 45),
    accent = Color3.fromRGB(80, 180, 120),
    text = Color3.fromRGB(240, 240, 240),
    red = Color3.fromRGB(220, 80, 80),
    green = Color3.fromRGB(80, 180, 120)
}

-- Главный контейнер
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 220)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -110)
mainFrame.BackgroundColor3 = COLOR_SCHEME.light_bg
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- Верхняя серая панель
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = COLOR_SCHEME.dark_bg
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

-- Заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "GROW A GARDEN V1"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = COLOR_SCHEME.text
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

-- Основное содержимое
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -60)
content.Position = UDim2.new(0, 10, 0, 50)
content.BackgroundTransparency = 1
content.Parent = mainFrame

-- Статус с иконкой
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "✅ Status: Ready"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = COLOR_SCHEME.text
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = content

-- Статистика
local statsLabel = Instance.new("TextLabel")
statsLabel.Size = UDim2.new(1, 0, 0, 60)
statsLabel.Position = UDim2.new(0, 0, 0, 25)
statsLabel.BackgroundTransparency = 1
statsLabel.Text = "🔁 Dupe cycles: 0\n✨ Items created: 0\n📦 Last item: None"
statsLabel.Font = Enum.Font.Gotham
statsLabel.TextSize = 14
statsLabel.TextColor3 = COLOR_SCHEME.text
statsLabel.TextXAlignment = Enum.TextXAlignment.Left
statsLabel.TextYAlignment = Enum.TextYAlignment.Top
statsLabel.Parent = content

-- Кнопка Dupe
local dupeButton = Instance.new("TextButton")
dupeButton.Size = UDim2.new(1, 0, 0, 40)
dupeButton.Position = UDim2.new(0, 0, 1, -50)
dupeButton.BackgroundColor3 = COLOR_SCHEME.red
dupeButton.Text = "⛔ Dupe: OFF"
dupeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dupeButton.Font = Enum.Font.GothamBold
dupeButton.TextSize = 16
dupeButton.Parent = content

-- Telegram
local telegramLabel = Instance.new("TextLabel")
telegramLabel.Size = UDim2.new(1, -10, 0, 20)
telegramLabel.Position = UDim2.new(0, 0, 1, -25)
telegramLabel.BackgroundTransparency = 1
telegramLabel.Text = "TELEGRAM: @RogsScript"
telegramLabel.Font = Enum.Font.GothamBold
telegramLabel.TextSize = 14
telegramLabel.TextColor3 = Color3.fromRGB(150, 150, 255)
telegramLabel.TextXAlignment = Enum.TextXAlignment.Right
telegramLabel.Parent = content

-- Кнопка активации (G)
local activateButton = Instance.new("TextButton")
activateButton.Size = UDim2.new(0, 50, 0, 50)
activateButton.Position = UDim2.new(1, -60, 0, 10)
activateButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
activateButton.BackgroundTransparency = 0.5
activateButton.Text = "G"
activateButton.TextColor3 = COLOR_SCHEME.green
activateButton.Font = Enum.Font.GothamBold
activateButton.TextSize = 24
activateButton.ZIndex = 10
activateButton.AutoButtonColor = false

-- Делаем кнопку круглой
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = activateButton

activateButton.Parent = gui
mainFrame.Parent = gui

-- Состояния
local isMenuVisible = false
local isDupeActive = false

-- Анимация кнопки G
activateButton.MouseButton1Click:Connect(function()
    isMenuVisible = not isMenuVisible
    mainFrame.Visible = isMenuVisible
    
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = isMenuVisible and 0.3 or 0.5,
        TextColor3 = isMenuVisible and Color3.fromRGB(255, 255, 255) or COLOR_SCHEME.green
    }):Play()
end)

-- Анимация при наведении на G
activateButton.MouseEnter:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.3
    }):Play()
end)

activateButton.MouseLeave:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = isMenuVisible and 0.3 or 0.5
    }):Play()
end)

-- Обработчик кнопки Dupe
dupeButton.MouseButton1Click:Connect(function()
    isDupeActive = not isDupeActive
    
    -- Плавная анимация переключения
    TweenService:Create(dupeButton, TweenInfo.new(0.3), {
        BackgroundColor3 = isDupeActive and COLOR_SCHEME.green or COLOR_SCHEME.red,
        Text = isDupeActive and "✅ Dupe: ON" or "⛔ Dupe: OFF"
    }):Play()
    
    -- Обновляем статус
    statusLabel.Text = isDupeActive and "✅ Status: Active" or "✅ Status: Ready"
end)

-- Эффекты при наведении на Dupe кнопку
dupeButton.MouseEnter:Connect(function()
    TweenService:Create(dupeButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.1
    }):Play()
end)

dupeButton.MouseLeave:Connect(function()
    TweenService:Create(dupeButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0
    }):Play()
end)
