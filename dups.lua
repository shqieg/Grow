return function()
    -- Настройки интерфейса
    local settings = {
        button = {
            radius = 30,
            position = {x = 40, y = 40},
            color = 0xFF000000,
            textColor = 0xFFFFFFFF,
            text = "G"
        },
        menu = {
            color = 0xCC000000,
            borderColor = 0xFFFFFFFF,
            borderThickness = 1
        }
    }

    -- Состояние скрипта
    local state = {
        active = false,
        menuVisible = false,
        mousePressed = false
    }

    -- Основная функция рисования
    local function Draw()
        -- Рисуем кнопку
        DrawCircle(
            settings.button.position.x, 
            settings.button.position.y, 
            settings.button.radius, 
            settings.button.color
        )
        
        -- Рисуем текст на кнопке
        DrawText(
            settings.button.text,
            settings.button.position.x - 5, 
            settings.button.position.y - 10,
            settings.button.textColor,
            1.0
        )

        -- Рисуем меню если активно
        if state.menuVisible then
            local screenX, screenY = GetScreenResolution()
            DrawRect(0, 0, screenX, screenY, settings.menu.color)
        end
    end

    -- Функция обработки ввода
    local function HandleInput()
        if IsMouseClicked() and not state.mousePressed then
            state.mousePressed = true
            
            local mouseX, mouseY = GetMousePos()
            local dx = mouseX - settings.button.position.x
            local dy = mouseY - settings.button.position.y
            
            if dx*dx + dy*dy <= settings.button.radius*settings.button.radius then
                state.menuVisible = not state.menuVisible
                state.active = not state.active
            end
        elseif not IsMouseClicked() then
            state.mousePressed = false
        end
    end

    -- Основной цикл
    local function MainLoop()
        while true do
            Wait(0)
            HandleInput()
            Draw()
        end
    end

    -- Запуск
    MainLoop()
end
