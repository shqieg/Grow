local scriptActive = false
local menuVisible = false
local buttonRadius = 30
local buttonPosX, buttonPosY = 50, 50

function main()
    while true do
        wait(0)
        
        -- Рисуем круглую кнопку активации
        drawCircle(buttonPosX, buttonPosY, buttonRadius, 0xFF000000) -- Черный круг
        drawText("G", buttonPosX - 5, buttonPosY - 10, 0xFFFFFFFF, 1.0) -- Белая буква G
        
        -- Если меню видимо - рисуем черный фон
        if menuVisible then
            local screenX, screenY = getScreenResolution()
            drawRect(0, 0, screenX, screenY, 0x90000000) -- Полупрозрачный черный фон
        end
        
        -- Проверка клика по кнопке
        if isMouseClicked() then
            local mouseX, mouseY = getMousePos()
            if (mouseX - buttonPosX)^2 + (mouseY - buttonPosY)^2 <= buttonRadius^2 then
                menuVisible = not menuVisible
                scriptActive = not scriptActive
            end
        end
    end
end

-- Вспомогательные функции
function drawCircle(x, y, radius, color)
    for angle = 0, 360, 1 do
        local rad = math.rad(angle)
        local px = x + math.cos(rad) * radius
        local py = y + math.sin(rad) * radius
        drawRect(px, py, px + 1, py + 1, color)
    end
end

function drawRect(x1, y1, x2, y2, color)
    -- Реализация рисования прямоугольника
end

function drawText(text, x, y, color, scale)
    -- Реализация рисования текста
end

function isMouseClicked()
    -- Проверка клика мыши
end

function getMousePos()
    -- Получение позиции мыши
end
