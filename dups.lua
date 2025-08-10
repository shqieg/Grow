local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Конфигурация
local CONFIG = {
    PASSWORD = "shdodjdhdi@Fox_Scripts",
    TELEGRAM = "t.me/Fox_Scripts",
    DUPE_COOLDOWN = 1
}

-- Создаем GUI
local gui = Instance.new("ScreenGui")
gui.Name = "VisualDupePremium"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Цветовая схема
local COLOR_SCHEME = {
    dark_bg = Color3.fromRGB(30, 30, 35),
    light_bg = Color3.fromRGB(40, 40, 45),
    accent = Color3.fromRGB(80, 180, 120),
    text = Color3.fromRGB(240, 240, 240),
    red = Color3.fromRGB(220, 80, 80),
    green = Color3.fromRGB(80, 180, 120),
    blue = Color3.fromRGB(100, 150, 255),
    purple = Color3.fromRGB(180, 80, 220)
}

-- Главный контейнер
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = COLOR_SCHEME.light_bg
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- Верхняя панель
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = COLOR_SCHEME.dark_bg
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

-- Разноцветный Telegram
local telegramLabel = Instance.new("TextLabel")
telegramLabel.Size = UDim2.new(1, -10, 1, 0)
telegramLabel.Position = UDim2.new(0, 10, 0, 0)
telegramLabel.BackgroundTransparency = 1
telegramLabel.Text = "TELEGRAM: "
telegramLabel.Font = Enum.Font.GothamBold
telegramLabel.TextSize = 14
telegramLabel.TextColor3 = COLOR_SCHEME.text
telegramLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Градиентный текст для Telegram
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, COLOR_SCHEME.blue),
    ColorSequenceKeypoint.new(0.5, COLOR_SCHEME.purple),
    ColorSequenceKeypoint.new(1, COLOR_SCHEME.accent)
})
gradient.Rotation = 90
gradient.Parent = telegramLabel

telegramLabel.Parent = topBar

-- Добавляем текст после градиента
local telegramLink = Instance.new("TextLabel")
telegramLink.Size = UDim2.new(0, 100, 1, 0)
telegramLink.Position = UDim2.new(0, 90, 0, 0)
telegramLink.BackgroundTransparency = 1
telegramLink.Text = CONFIG.TELEGRAM
telegramLink.Font = Enum.Font.GothamBold
telegramLink.TextSize = 14
telegramLink.TextColor3 = COLOR_SCHEME.accent
telegramLink.TextXAlignment = Enum.TextXAlignment.Left
telegramLink.Parent = topBar

-- Меню ключа
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(1, -20, 0, 80)
keyFrame.Position = UDim2.new(0, 10, 0, 40)
keyFrame.BackgroundTransparency = 1
keyFrame.Parent = mainFrame

-- Поле ввода пароля
local passwordBox = Instance.new("TextBox")
passwordBox.Size = UDim2.new(1, 0, 0, 30)
passwordBox.Position = UDim2.new(0, 0, 0, 0)
passwordBox.BackgroundColor3 = COLOR_SCHEME.dark_bg
passwordBox.PlaceholderText = "Enter password..."
passwordBox.Text = ""
passwordBox.Font = Enum.Font.Gotham
passwordBox.TextSize = 14
passwordBox.TextColor3 = COLOR_SCHEME.text
passwordBox.Parent = keyFrame

-- Кнопка проверки
local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(1, 0, 0, 30)
checkKeyButton.Position = UDim2.new(0, 0, 0, 40)
checkKeyButton.BackgroundColor3 = COLOR_SCHEME.accent
checkKeyButton.Text = "Check Key"
checkKeyButton.Font = Enum.Font.GothamBold
checkKeyButton.TextSize = 14
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.Parent = keyFrame

-- Кнопка копирования
local copyLinkButton = Instance.new("TextButton")
copyLinkButton.Size = UDim2.new(0.45, 0, 0, 25)
copyLinkButton.Position = UDim2.new(0, 0, 1, -25)
copyLinkButton.BackgroundColor3 = COLOR_SCHEME.blue
copyLinkButton.Text = "Copy Link"
copyLinkButton.Font = Enum.Font.Gotham
copyLinkButton.TextSize = 12
copyLinkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLinkButton.Parent = keyFrame

-- Кнопка Dupe
local dupeButton = Instance.new("TextButton")
dupeButton.Size = UDim2.new(1, 0, 0, 40)
dupeButton.Position = UDim2.new(0, 0, 1, -50)
dupeButton.BackgroundColor3 = COLOR_SCHEME.red
dupeButton.Text = "⛔ Dupe: OFF"
dupeButton.Font = Enum.Font.GothamBold
dupeButton.TextSize = 16
dupeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dupeButton.AutoButtonColor = false
dupeButton.Parent = mainFrame

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
activateButton.Parent = gui

-- Делаем кнопку круглой
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = activateButton

mainFrame.Parent = gui

-- Состояния
local isMenuVisible = false
local isDupeActive = false
local isKeyValid = false
local lastDupeTime = 0

-- Функция визуального дублирования
local function visualDupe()
    if not isKeyValid then return end
    if tick() - lastDupeTime < CONFIG.DUPE_COOLDOWN then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    local tool = humanoid:FindFirstChildOfClass("Tool")
    if not tool then
        dupeButton.Text = "⚠️ No tool in hand"
        wait(1)
        dupeButton.Text = isDupeActive and "✅ Dupe: ON" or "⛔ Dupe: OFF"
        return
    end
    
    -- Создаем визуальную копию
    local visualCopy = tool:Clone()
    visualCopy.Parent = workspace
    visualCopy.Handle.Anchored = true
    
    -- Позиционируем перед игроком
    local root = character:FindFirstChild("HumanoidRootPart")
    if root then
        visualCopy.Handle.CFrame = root.CFrame * CFrame.new(0, 0, -3)
    end
    
    lastDupeTime = tick()
end

-- Проверка пароля
checkKeyButton.MouseButton1Click:Connect(function()
    if passwordBox.Text == CONFIG.PASSWORD then
        isKeyValid = true
        checkKeyButton.Text = "✅ Valid"
        checkKeyButton.BackgroundColor3 = COLOR_SCHEME.green
        dupeButton.Text = "⛔ Dupe: OFF (Ready)"
    else
        isKeyValid = false
        checkKeyButton.Text = "❌ Invalid"
        checkKeyButton.BackgroundColor3 = COLOR_SCHEME.red
    end
end)

-- Копирование ссылки
copyLinkButton.MouseButton1Click:Connect(function()
    setclipboard(CONFIG.TELEGRAM)
    copyLinkButton.Text = "Copied!"
    wait(1)
    copyLinkButton.Text = "Copy Link"
end)

-- Обработчик кнопки Dupe
dupeButton.MouseButton1Click:Connect(function()
    if not isKeyValid then
        checkKeyButton.Text = "Check Key First!"
        checkKeyButton.BackgroundColor3 = COLOR_SCHEME.red
        return
    end
    
    isDupeActive = not isDupeActive
    
    -- Плавная анимация переключения
    TweenService:Create(dupeButton, TweenInfo.new(0.3), {
        BackgroundColor3 = isDupeActive and COLOR_SCHEME.green or COLOR_SCHEME.red,
        Text = isDupeActive and "✅ Dupe: ON" or "⛔ Dupe: OFF"
    }):Play()
end)

-- Активация меню
activateButton.MouseButton1Click:Connect(function()
    isMenuVisible = not isMenuVisible
    mainFrame.Visible = isMenuVisible
    
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundTransparency = isMenuVisible and 0.3 or 0.5,
        TextColor3 = isMenuVisible and Color3.fromRGB(255, 255, 255) or COLOR_SCHEME.green
    }):Play()
end)

-- Обработка дублирования при удержании
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not isDupeActive or gameProcessed then return end
    
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        visualDupe()
    end
end)
