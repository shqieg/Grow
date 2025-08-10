function main()
    while true do
        wait(0)
        local w, h = getScreenResolution()
        drawRect(0, 0, w, h, 0x90000000)
        drawBorder(w/2-150, h/2-100, 300, 200, 1, 0xFFFFFFFF)
    end
end

function drawRect(x1, y1, x2, y2, color)
    imgui.ImGui.GetBackgroundDrawList():AddRectFilled(
        imgui.ImVec2(x1, y1),
        imgui.ImVec2(x2, y2),
        color
    )
end

function drawBorder(x, y, w, h, thickness, color)
    local dl = imgui.ImGui.GetBackgroundDrawList()
    -- Top
    dl:AddLine(imgui.ImVec2(x, y), imgui.ImVec2(x+w, y), color, thickness)
    -- Right
    dl:AddLine(imgui.ImVec2(x+w, y), imgui.ImVec2(x+w, y+h), color, thickness)
    -- Bottom
    dl:AddLine(imgui.ImVec2(x, y+h), imgui.ImVec2(x+w, y+h), color, thickness)
    -- Left
    dl:AddLine(imgui.ImVec2(x, y), imgui.ImVec2(x, y+h), color, thickness)
end
