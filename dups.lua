local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")

-- Создаем GUI
local gui = Instance.new("ScreenGui")
gui.Name = "GardenDupeGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Стиль из изображения
local COLOR_SCHEME = {
    background = Color3.fromRGB(40, 40, 45),
    accent = Color3.fromRGB(80, 180, 120),
    text = Color3.fromRGB(240, 240, 240),
    status = Color3.fromRGB(220, 220, 220)
}

-- Круглая кнопка активации (G)
local activateButton = Instance.new("TextButton")
activateButton.Size = UDim2.new(0, 50, 0, 50)
activateButton.Position = UDim2.new(1, -60, 0, 10)
activateButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
activateButton.BackgroundTransparency = 0.5  -- Полупрозрачный фон
activateButton.Text = "G"
activateButton.TextColor3 = COLOR_SCHEME.accent  -- Зеленый текст как в "GROW A GARDEN"
activateButton.Font = Enum.Font.GothamBold
activateButton.TextSize = 24
activateButton.ZIndex = 10
activateButton.AutoButtonColor = false

-- Скругление кнопки
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)  -- Полностью круглый
corner.Parent = activateButton

activateButton.Parent = gui

-- Основное меню
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = COLOR_SCHEME.background
mainFrame.BackgroundTransparency = 0.1  -- Полупрозрачность
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- Обводка как на изображении
local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(255, 255, 255)
border.Thickness = 1
border.Parent = mainFrame

-- Контент меню
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -20)
content.Position = UDim2.new(0, 10, 0, 10)
content.BackgroundTransparency = 1
content.Parent = mainFrame

-- Текст статуса (как на изображении)
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Backpack full!"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = COLOR_SCHEME.status
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = content

-- Статистика (как на изображении)
local statsLabel = Instance.new("TextLabel")
statsLabel.Size = UDim2.new(1, 0, 0, 60)
statsLabel.Position = UDim2.new(0, 0, 0, 25)
statsLabel.BackgroundTransparency = 1
statsLabel.Text = "Dupe cycles: 10\nItems created: 99\nLast Item: Carrot Seed [X]"
statsLabel.Font = Enum.Font.Gotham
statsLabel.TextSize = 14
statsLabel.TextColor3 = COLOR_SCHEME.text
statsLabel.TextXAlignment = Enum.TextXAlignment.Left
statsLabel.TextYAlignment = Enum.TextYAlignment.Top
statsLabel.Parent = content

-- Кнопка дублирования
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, 0, 0, 40)
toggleButton.Position = UDim2.new(0, 0, 1, -50)
toggleButton.BackgroundColor3 = COLOR_SCHEME.accent
toggleButton.Text = "Enable Real Dupe"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 16
toggleButton.Parent = content

-- Telegram (как на изображении)
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

mainFrame.Parent = gui

-- Анимация кнопки G
local isMenuVisible = false
activateButton.MouseButton1Click:Connect(function()
    isMenuVisible = not isMenuVisible
    mainFrame.Visible = isMenuVisible
    
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = isMenuVisible and 0.7 or 0.5,
        TextColor3 = isMenuVisible and Color3.fromRGB(255, 255, 255) or COLOR_SCHEME.accent
    }):Play()
end)

-- Эффекты при наведении
activateButton.MouseEnter:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.3
    }):Play()
end)

activateButton.MouseLeave:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = isMenuVisible and 0.7 or 0.5
    }):Play()
end)local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")

-- Создаем GUI
local gui = Instance.new("ScreenGui")
gui.Name = "GardenDupeGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Стиль из изображения
local COLOR_SCHEME = {
    background = Color3.fromRGB(40, 40, 45),
    accent = Color3.fromRGB(80, 180, 120),
    text = Color3.fromRGB(240, 240, 240),
    status = Color3.fromRGB(220, 220, 220)
}

-- Круглая кнопка активации (G)
local activateButton = Instance.new("TextButton")
activateButton.Size = UDim2.new(0, 50, 0, 50)
activateButton.Position = UDim2.new(1, -60, 0, 10)
activateButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
activateButton.BackgroundTransparency = 0.5  -- Полупрозрачный фон
activateButton.Text = "G"
activateButton.TextColor3 = COLOR_SCHEME.accent  -- Зеленый текст как в "GROW A GARDEN"
activateButton.Font = Enum.Font.GothamBold
activateButton.TextSize = 24
activateButton.ZIndex = 10
activateButton.AutoButtonColor = false

-- Скругление кнопки
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)  -- Полностью круглый
corner.Parent = activateButton

activateButton.Parent = gui

-- Основное меню
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = COLOR_SCHEME.background
mainFrame.BackgroundTransparency = 0.1  -- Полупрозрачность
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- Обводка как на изображении
local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(255, 255, 255)
border.Thickness = 1
border.Parent = mainFrame

-- Контент меню
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -20)
content.Position = UDim2.new(0, 10, 0, 10)
content.BackgroundTransparency = 1
content.Parent = mainFrame

-- Текст статуса (как на изображении)
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Backpack full!"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = COLOR_SCHEME.status
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = content

-- Статистика (как на изображении)
local statsLabel = Instance.new("TextLabel")
statsLabel.Size = UDim2.new(1, 0, 0, 60)
statsLabel.Position = UDim2.new(0, 0, 0, 25)
statsLabel.BackgroundTransparency = 1
statsLabel.Text = "Dupe cycles: 10\nItems created: 99\nLast Item: Carrot Seed [X]"
statsLabel.Font = Enum.Font.Gotham
statsLabel.TextSize = 14
statsLabel.TextColor3 = COLOR_SCHEME.text
statsLabel.TextXAlignment = Enum.TextXAlignment.Left
statsLabel.TextYAlignment = Enum.TextYAlignment.Top
statsLabel.Parent = content

-- Кнопка дублирования
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, 0, 0, 40)
toggleButton.Position = UDim2.new(0, 0, 1, -50)
toggleButton.BackgroundColor3 = COLOR_SCHEME.accent
toggleButton.Text = "Enable Real Dupe"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 16
toggleButton.Parent = content

-- Telegram (как на изображении)
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

mainFrame.Parent = gui

-- Анимация кнопки G
local isMenuVisible = false
activateButton.MouseButton1Click:Connect(function()
    isMenuVisible = not isMenuVisible
    mainFrame.Visible = isMenuVisible
    
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = isMenuVisible and 0.7 or 0.5,
        TextColor3 = isMenuVisible and Color3.fromRGB(255, 255, 255) or COLOR_SCHEME.accent
    }):Play()
end)

-- Эффекты при наведении
activateButton.MouseEnter:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.3
    }):Play()
end)

activateButton.MouseLeave:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = isMenuVisible and 0.7 or 0.5
    }):Play()
end)
