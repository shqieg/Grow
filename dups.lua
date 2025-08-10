local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local KEY = "shdodjdhdi@Fox_Scripts"
local KEY_VALID = false
local TELEGRAM = "Fox_Scripts"
local TELEGRAM_LINK = "t.me/Fox_Scripts"

local gui = Instance.new("ScreenGui")
gui.Name = "RealGardenDupeGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local function createRoundCorners(frame, cornerRadius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius)
    corner.Parent = frame
end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 280)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
createRoundCorners(mainFrame, 12)

local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundTransparency = 1
shadow.Parent = mainFrame
shadow.ZIndex = -1

mainFrame.Parent = gui

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
titleBar.BorderSizePixel = 0
createRoundCorners(titleBar, 12)
titleBar.ZIndex = 2
titleBar.Parent = mainFrame

local gradient = Instance.new("UIGradient")
gradient.Rotation = 90
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 150, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 100, 60))
})
gradient.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🌿 GROW A GARDEN V1 🌿"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(240, 240, 240)
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextStrokeTransparency = 0.7
title.ZIndex = 3
title.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closeButton.Text = "×"
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 20
closeButton.AutoButtonColor = false
createRoundCorners(closeButton, 15)
closeButton.ZIndex = 3
closeButton.Parent = titleBar

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 80, 80)}):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 60, 60)}):Play()
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -90)
contentFrame.Position = UDim2.new(0, 10, 0, 50)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Key System Frame
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(1, 0, 0, 80)
keyFrame.BackgroundTransparency = 1
keyFrame.Parent = contentFrame

-- Key Input
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, 0, 0, 30)
keyBox.Position = UDim2.new(0, 0, 0, 0)
keyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
keyBox.PlaceholderText = "Enter key..."
keyBox.Text = ""
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.TextColor3 = Color3.fromRGB(220, 220, 220)
keyBox.Parent = keyFrame
createRoundCorners(keyBox, 8)

-- Check Key Button
local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Size = UDim2.new(1, 0, 0, 30)
checkKeyButton.Position = UDim2.new(0, 0, 0, 40)
checkKeyButton.BackgroundColor3 = Color3.fromRGB(80, 180, 120)
checkKeyButton.Text = "Check Key"
checkKeyButton.Font = Enum.Font.GothamBold
checkKeyButton.TextSize = 14
checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyButton.Parent = keyFrame
createRoundCorners(checkKeyButton, 8)

-- Copy Link Button
local copyLinkButton = Instance.new("TextButton")
copyLinkButton.Size = UDim2.new(0.45, 0, 0, 25)
copyLinkButton.Position = UDim2.new(0.55, 0, 1, -25)
copyLinkButton.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
copyLinkButton.Text = "Copy Link"
copyLinkButton.Font = Enum.Font.Gotham
copyLinkButton.TextSize = 12
copyLinkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLinkButton.Parent = keyFrame
createRoundCorners(copyLinkButton, 6)

local dupeToggleFrame = Instance.new("Frame")
dupeToggleFrame.Size = UDim2.new(1, 0, 0, 50)
dupeToggleFrame.Position = UDim2.new(0, 0, 0, 90)
dupeToggleFrame.BackgroundTransparency = 1
dupeToggleFrame.Parent = contentFrame

local toggleLabel = Instance.new("TextLabel")
toggleLabel.Size = UDim2.new(0, 200, 1, 0)
toggleLabel.Position = UDim2.new(0, 0, 0, 0)
toggleLabel.BackgroundTransparency = 1
toggleLabel.Text = "Enable Real Dupe:"
toggleLabel.Font = Enum.Font.Gotham
toggleLabel.TextSize = 16
toggleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
toggleLabel.Parent = dupeToggleFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 60, 0, 30)
toggleButton.Position = UDim2.new(1, -60, 0.5, -15)
toggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
toggleButton.Text = ""
toggleButton.AutoButtonColor = false
createRoundCorners(toggleButton, 15)
toggleButton.Parent = dupeToggleFrame

local toggleCircle = Instance.new("Frame")
toggleCircle.Size = UDim2.new(0, 26, 0, 26)
toggleCircle.Position = UDim2.new(0, 2, 0.5, -13)
toggleCircle.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
createRoundCorners(toggleCircle, 13)
toggleCircle.Parent = toggleButton

local statusFrame = Instance.new("Frame")
statusFrame.Size = UDim2.new(1, 0, 0, 80)
statusFrame.Position = UDim2.new(0, 0, 0, 150)
statusFrame.BackgroundTransparency = 1
statusFrame.Parent = contentFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "🟠 Status: Inactive"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = statusFrame

local statsLabel = Instance.new("TextLabel")
statsLabel.Size = UDim2.new(1, 0, 0, 60)
statsLabel.Position = UDim2.new(0, 0, 0, 25)
statsLabel.BackgroundTransparency = 1
statsLabel.Text = "🔁 Dupe cycles: 0\n✨ Items created: 0\n📦 Last item: None"
statsLabel.Font = Enum.Font.Gotham
statsLabel.TextSize = 14
statsLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
statsLabel.TextXAlignment = Enum.TextXAlignment.Left
statsLabel.TextYAlignment = Enum.TextYAlignment.Top
statsLabel.Parent = statusFrame

local telegramLabel = Instance.new("TextLabel")
telegramLabel.Size = UDim2.new(1, -10, 0, 20)
telegramLabel.Position = UDim2.new(0, 5, 1, -25)
telegramLabel.BackgroundTransparency = 1
telegramLabel.Text = "TELEGRAM: @"..TELEGRAM
telegramLabel.Font = Enum.Font.GothamBold
telegramLabel.TextSize = 14
telegramLabel.TextColor3 = Color3.fromRGB(150, 150, 255)
telegramLabel.TextXAlignment = Enum.TextXAlignment.Right
telegramLabel.Parent = mainFrame

local EXCLUDED_ITEMS = {
    ["Shovel [Destroy Plants]"] = true,
    ["Broken Ladder"] = true,
    ["Jetpack"] = true,
    ["Fertilizer"] = true,
    ["Watering Can"] = true
}

local isDupeActive = false
local dupeCount = 0
local itemsCreated = 0
local lastItem = "None"
local dupeLoopActive = false

local function realDuplication()
    local character = player.Character
    if not character then
        statusLabel.Text = "🔴 Status: Character not found!"
        return 0
    end
    
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then 
        statusLabel.Text = "🔴 Status: Backpack not found!"
        return 0
    end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        statusLabel.Text = "🔴 Status: Humanoid not found!"
        return 0
    end
    
    local duplicated = 0
    local tools = {}
    
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") and not EXCLUDED_ITEMS[item.Name] then
            table.insert(tools, item)
        end
    end
    
    for _, item in ipairs(tools) do
        if #backpack:GetChildren() < 100 then
            local clone = item:Clone()
            task.wait(0.05)
            clone.Parent = backpack
            duplicated = duplicated + 1
            itemsCreated = itemsCreated + 1
            lastItem = item.Name
            task.wait(0.1)
        else
            statusLabel.Text = "⚠️ Status: Backpack full!"
            break
        end
    end
    
    if duplicated > 0 then
        dupeCount = dupeCount + 1
        statusLabel.Text = "🟢 Status: Active ("..duplicated.." duped)"
        statsLabel.Text = string.format("🔁 Dupe cycles: %d\n✨ Items created: %d\n📦 Last item: %s", 
            dupeCount, itemsCreated, lastItem)
        
        if SoundService then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://170765130"
            sound.Volume = 0.3
            sound.Parent = mainFrame
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 2)
        end
    elseif #tools == 0 then
        statusLabel.Text = "🟠 Status: No items to dupe"
    end
    
    return duplicated
end

local function startDupeLoop()
    if dupeLoopActive then return end
    
    dupeLoopActive = true
    task.spawn(function()
        while dupeLoopActive do
            local success, err = pcall(realDuplication)
            if not success then
                statusLabel.Text = "🔴 Error: "..tostring(err):sub(1, 30).."..."
            end
            wait(isDupeActive and 3 or 5)
        end
    end)
end

local function toggleDupe()
    if not KEY_VALID then
        statusLabel.Text = "🔴 Status: Need Valid Key"
        return
    end
    
    isDupeActive = not isDupeActive
    
    if isDupeActive then
        TweenService:Create(toggleButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(80, 180, 120)
        }):Play()
        
        TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
            Position = UDim2.new(1, -28, 0.5, -13),
            BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        }):Play()
        
        startDupeLoop()
    else
        TweenService:Create(toggleButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(70, 70, 80)
        }):Play()
        
        TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
            Position = UDim2.new(0, 2, 0.5, -13),
            BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        }):Play()
        
        dupeLoopActive = false
        statusLabel.Text = "🟠 Status: Inactive"
    end
end

toggleButton.MouseButton1Click:Connect(toggleDupe)

toggleButton.MouseEnter:Connect(function()
    TweenService:Create(toggleButton, TweenInfo.new(0.2), {
        BackgroundColor3 = isDupeActive and Color3.fromRGB(100, 200, 140) or Color3.fromRGB(90, 90, 100)
    }):Play()
end)

toggleButton.MouseLeave:Connect(function()
    TweenService:Create(toggleButton, TweenInfo.new(0.2), {
        BackgroundColor3 = isDupeActive and Color3.fromRGB(80, 180, 120) or Color3.fromRGB(70, 70, 80)
    }):Play()
end)

checkKeyButton.MouseButton1Click:Connect(function()
    if keyBox.Text == KEY then
        KEY_VALID = true
        checkKeyButton.Text = "✓ Valid Key"
        checkKeyButton.BackgroundColor3 = Color3.fromRGB(80, 180, 120)
        statusLabel.Text = "🟢 Status: Key Activated"
    else
        KEY_VALID = false
        checkKeyButton.Text = "✗ Invalid Key"
        checkKeyButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        statusLabel.Text = "🔴 Status: Invalid Key"
    end
end)

copyLinkButton.MouseButton1Click:Connect(function()
    setclipboard(TELEGRAM_LINK)
    copyLinkButton.Text = "Copied!"
    task.wait(1)
    copyLinkButton.Text = "Copy Link"
end)
