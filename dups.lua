-- Версия для мобильных устройств
local screenWidth, screenHeight = guiGetScreenSize()
local buttonSize = 50
local buttonX, buttonY = screenWidth - buttonSize - 20, 20
local menuVisible = false
local touchStartTime = 0

function drawButton()
    -- Рисуем круглую кнопку
    dxDrawCircle(buttonX, buttonY, buttonSize, 0xFF000000)
    dxDrawText("G", buttonX, buttonY, buttonX + buttonSize, buttonY + buttonSize, 
              0xFFFFFFFF, 1.0, "default", "center", "center")
end

function drawMenu()
    if not menuVisible then return end
    
    -- Полупрозрачное черное меню
    dxDrawRectangle(0, 0, screenWidth, screenHeight, 0x90000000)
    
    -- Белая рамка
    local border = 2
    dxDrawRectangle(0, 0, screenWidth, border, 0xFFFFFFFF) -- верх
    dxDrawRectangle(0, 0, border, screenHeight, 0xFFFFFFFF) -- лево
    dxDrawRectangle(screenWidth - border, 0, border, screenHeight, 0xFFFFFFFF) -- право
    dxDrawRectangle(0, screenHeight - border, screenWidth, border, 0xFFFFFFFF) -- низ
end

function handleTouches()
    local touches = getActiveTouches()
    for _, touch in ipairs(touches) do
        if touch.justPressed then
            -- Проверяем попадание в кнопку
            local dx = touch.x - (buttonX + buttonSize/2)
            local dy = touch.y - (buttonY + buttonSize/2)
            if dx*dx + dy*dy <= (buttonSize/2)*(buttonSize/2) then
                menuVisible = not menuVisible
            end
        end
    end
end

addEventHandler("onClientRender", root, function()
    drawButton()
    drawMenu()
    handleTouches()
end)
