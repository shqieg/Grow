-- Mobile Friendly UI with G Button
local ScreenWidth, ScreenHeight = guiGetScreenSize()
local ButtonSize = 60
local ButtonPosX, ButtonPosY = ScreenWidth - ButtonSize - 30, 30
local MenuVisible = false
local ButtonActive = false

function DrawCircle(x, y, radius, color, segments)
    segments = segments or 32
    local points = {}
    for i = 0, segments do
        local angle = math.rad(i * 360 / segments)
        table.insert(points, x + math.cos(angle) * radius)
        table.insert(points, y + math.sin(angle) * radius)
    end
    dxDrawPolygon(points, color)
end

function ToggleMenu()
    MenuVisible = not MenuVisible
    ButtonActive = not ButtonActive
    playSoundFrontEnd(ButtonActive and 1 or 2)
end

function CheckTouch()
    local touches = getTouchEvents()
    for _, touch in ipairs(touches) do
        if touch.state == "down" then
            local dx = touch.x - (ButtonPosX + ButtonSize/2)
            local dy = touch.y - (ButtonPosY + ButtonSize/2)
            if dx*dx + dy*dy <= (ButtonSize/2)*(ButtonSize/2) then
                ToggleMenu()
                return true
            end
        end
    end
    return false
end

addEventHandler("onClientRender", root, function()
    -- Draw G Button
    DrawCircle(ButtonPosX + ButtonSize/2, ButtonPosY + ButtonSize/2, ButtonSize/2, MenuVisible and 0xFF333333 or 0xFF000000)
    dxDrawText("G", ButtonPosX, ButtonPosY, ButtonPosX + ButtonSize, ButtonPosY + ButtonSize, 
             0xFFFFFFFF, 1.5, "default-bold", "center", "center")
    
    -- Draw Menu Background
    if MenuVisible then
        dxDrawRectangle(0, 0, ScreenWidth, ScreenHeight, 0xAA000000)
        dxDrawRectangle(0, 0, ScreenWidth, 2, 0xFFFFFFFF) -- Top border
        dxDrawRectangle(0, ScreenHeight-2, ScreenWidth, 2, 0xFFFFFFFF) -- Bottom border
        dxDrawRectangle(0, 0, 2, ScreenHeight, 0xFFFFFFFF) -- Left border
        dxDrawRectangle(ScreenWidth-2, 0, 2, ScreenHeight, 0xFFFFFFFF) -- Right border
    end
end)

addEventHandler("onClientTouch", root, function()
    CheckTouch()
end)

-- For debugging on PC
bindKey("mouse1", "down", function()
    local cursorX, cursorY = getCursorPosition()
    if cursorX and cursorY then
        CheckTouch({x = cursorX*ScreenWidth, y = cursorY*ScreenHeight, state = "down"})
    end
end)
