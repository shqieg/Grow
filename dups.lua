local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

-- Конфигурация
local CONFIG = {
    KEY = "shdodjdhdi@Fox_Scripts",
    TELEGRAM = "@Fox_Scripts",
    API_URL = "http://your-api.com/checkkey" -- Замените на ваш API
}

-- Создаем GUI
local gui = Instance.new("ScreenGui")
gui.Name = "GardenDupePremium"
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
    blue = Color3.fromRGB(100, 150, 255)
}

-- Главный контейнер
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 250)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
mainFrame.BackgroundColor3 = COLOR_SCHEME.light_bg
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- Верхняя панель
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

-- Ключевая система
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(1, 0, 0, 80)
keyFrame.BackgroundTransparency = 1
keyFrame.Parent = content

local copyKeyButton = Instance.new("TextButton")
copyKeyButton.Size = UDim2.new(1, 0, 0, 30)
copyKeyButton.Position = UDim2.new(0, 0, 0, 0)
copyKeyButton.BackgroundColor3 = COLOR_SCHEME.blue
copyKeyButton.Text = "Copy Link & Key"
copyKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyKeyButton.Font = Enum.Font.GothamBold
copyKeyButton.TextSize = 14
copyKeyButton.Parent = keyFrame

local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(1, 0, 0, 30)
checkKeyButton.Position = UDim2.new(0, 0, 0, 40)
checkKeyButton.BackgroundColor3 = COLOR_SCHEME.accent
checkKeyButton.Text = "Key Check"
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.Font = Enum.Font.GothamBold
checkKeyButton.TextSize = 14
checkKeyButton.Visible = false
checkKeyButton.Parent = keyFrame

local keyStatus = Instance.new("TextLabel")
keyStatus.Size = UDim2.new(1, 0, 0, 20)
keyStatus.Position = UDim2.new(0, 0, 0, 75)
keyStatus.BackgroundTransparency = 1
keyStatus.Text = "Status: Key not checked"
keyStatus.Font = Enum.Font.Gotham
keyStatus.TextSize = 14
keyStatus.TextColor3 = COLOR_SCHEME.text
keyStatus.TextXAlignment = Enum.TextXAlignment.Left
keyStatus.Parent = keyFrame

-- Статус
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 90)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "✅ Status: Ready"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = COLOR_SCHEME.text
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = content

-- Кнопка Dupe
local dupeButton = Instance.new("TextButton")
dupeButton.Size = UDim2.new(1, 0, 0, 40)
dupeButton.Position = UDim2.new(0, 0, 1, -50)
dupeButton.BackgroundColor3 = COLOR_SCHEME.red
dupeButton.Text = "⛔ Dupe: OFF"
dupeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dupeButton.Font = Enum.Font.GothamBold
dupeButton.TextSize = 16
dupeButton.AutoButtonColor = false
dupeButton.Parent = content

-- Telegram
local telegramLabel = Instance.new("TextLabel")
telegramLabel.Size = UDim2.new(1, -10, 0, 20)
telegramLabel.Position = UDim2.new(0, 0, 1, -25)
telegramLabel.BackgroundTransparency = 1
telegramLabel.Text = "TELEGRAM: " .. CONFIG.TELEGRAM
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

-- Функция проверки ключа
local function checkKey()
    local success, response = pcall(function()
        return HttpService:GetAsync(CONFIG.API_URL .. "?key=" .. CONFIG.KEY)
    end)
    
    if success then
        local data = HttpService:JSONDecode(response)
        if data.valid then
            keyStatus.Text = "✅ Status: Key valid"
            checkKeyButton.Visible = false
            isKeyValid = true
            return true
        end
    end
    
    keyStatus.Text = "❌ Status: Invalid key"
    return false
end

-- Копирование ключа
copyKeyButton.MouseButton1Click:Connect(function()
    setclipboard("Key: " .. CONFIG.KEY .. "\nTelegram: " .. CONFIG.TELEGRAM)
    copyKeyButton.Text = "Copied!"
    wait(1)
    copyKeyButton.Text = "Copy Link & Key"
    checkKeyButton.Visible = true
end)

-- Проверка ключа
checkKeyButton.MouseButton1Click:Connect(function()
    checkKey()
end)

-- Обработчик кнопки Dupe
dupeButton.MouseButton1Click:Connect(function()
    if not isKeyValid then
        keyStatus.Text = "⚠️ Check key first!"
        return
    end
    
    isDupeActive = not isDupeActive
    
    -- Плавная анимация переключения
    TweenService:Create(dupeButton, TweenInfo.new(0.3), {
        BackgroundColor3 = isDupeActive and COLOR_SCHEME.green or COLOR_SCHEME.red,
        Text = isDupeActive and "✅ Dupe: ON" or "⛔ Dupe: OFF"
    }):Play()
    
    -- Обновляем статус
    statusLabel.Text = isDupeActive and "🔄 Status: Active" or "✅ Status: Ready"
    
    if isDupeActive then
        -- Здесь добавить логику дублирования
    else
        -- Остановка дублирования
   end
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

-- Автопроверка ключа при запуске
spawn(function()
    wait(2) -- Даем время GUI загрузитьс
    checkKey()
end)
