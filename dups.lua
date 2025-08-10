local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")

-- Создаем главный GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SimpleDupeMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Функция для скругления углов
local function createRoundCorners(frame, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = frame
end

-- Круглая кнопка активации
local activateButton = Instance.new("TextButton")
activateButton.Size = UDim2.new(0, 50, 0, 50)
activateButton.Position = UDim2.new(1, -60, 0, 10)
activateButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
activateButton.Text = "G"
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.Font = Enum.Font.GothamBold
activateButton.TextSize = 20
activateButton.ZIndex = 10
createRoundCorners(activateButton, 25)
activateButton.Parent = gui

-- Основное меню (скрыто по умолчанию)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
createRoundCorners(mainFrame, 12)

-- Белая обводка
local border = Instance.new("Frame")
border.Size = UDim2.new(1, 2, 1, 2)
border.Position = UDim2.new(0, -1, 0, -1)
border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
border.BorderSizePixel = 0
border.ZIndex = -1
createRoundCorners(border, 14)
border.Parent = mainFrame

mainFrame.Parent = gui

-- Текст статуса
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 40)
statusLabel.Position = UDim2.new(0, 10, 0, 10)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Inactive"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 16
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = mainFrame

-- Переключатель дублирования
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0.5, -60, 1, -60)
toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
toggleButton.Text = "Enable Dupe"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 16
createRoundCorners(toggleButton, 8)
toggleButton.Parent = mainFrame

-- Переменные состояния
local isMenuVisible = false
local isDupeActive = false

-- Обработчик кнопки активации
activateButton.MouseButton1Click:Connect(function()
    isMenuVisible = not isMenuVisible
    mainFrame.Visible = isMenuVisible
    
    -- Анимация кнопки
    TweenService:Create(activateButton, TweenInfo.new(0.2), {
        BackgroundColor3 = isMenuVisible and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(0, 0, 0)
    }):Play()
end)

-- Обработчик переключателя дублирования
toggleButton.MouseButton1Click:Connect(function()
    isDupeActive = not isDupeActive
    
    if isDupeActive then
        toggleButton.Text = "Disable Dupe"
        statusLabel.Text = "Status: Active"
        TweenService:Create(toggleButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(80, 180, 120)
        }):Play()
    else
        toggleButton.Text = "Enable Dupe"
        statusLabel.Text = "Status: Inactive"
        TweenService:Create(toggleButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        }):Play()
    end
end)
