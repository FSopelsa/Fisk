-- TurtleData - Main
-- Event handling and slash commands

local TD = _G.TurtleData
local ADDON_NAME = "TurtleData"

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

function frame:OnEvent(event, ...)
    if event == "ADDON_LOADED" then
        local name = ...
        if name == ADDON_NAME then
            TD:Initialize()
        end
    elseif event == "PLAYER_LOGIN" then
        TD:Print("Hello Turtle WoW! Use /tdata help")
    end
end

frame:SetScript("OnEvent", frame.OnEvent)

-- Slash commands
SLASH_TURTLEDATA1 = "/tdata"
SlashCmdList["TURTLEDATA"] = function(msg)
    msg = (msg or ""):lower()
    local cmd = msg:match("^(%S+)") or ""

    if cmd == "help" or cmd == "" then
        TD:Print("Commands:")
        TD:Print("  /tdata help   - show help")
        TD:Print("  /tdata ping   - test output")
        TD:Print("  /tdata ver    - show version")
    elseif cmd == "ping" then
        TD:Print("pong")
    elseif cmd == "ver" or cmd == "version" then
        TD:Print("version " .. TD.VERSION)
    else
        TD:Print("unknown command; try /tdata help")
    end
end

return TD
