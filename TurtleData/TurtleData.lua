-- TurtleData - All-in-one file for testing
-- This file should load and register the slash command

DEFAULT_CHAT_FRAME:AddMessage("TurtleData.lua is loading...")

-- Create namespace
TurtleData = {}
TurtleData.VERSION = "0.1.0"

-- Print function
function TurtleData:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff7fTurtleData|r: " .. tostring(msg))
end

-- Initialize
TurtleDataDB = TurtleDataDB or {}
TurtleDataCharDB = TurtleDataCharDB or {}

-- Event frame
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function()
    TurtleData:Print("Loaded v" .. TurtleData.VERSION)
    TurtleData:Print("Type /tdata help")
end)

-- Slash command
SLASH_TURTLEDATA1 = "/tdata"
SlashCmdList["TURTLEDATA"] = function(msg)
    msg = msg or ""
    msg = string.lower(msg)
    
    local firstWord = ""
    for word in string.gfind(msg, "%S+") do
        firstWord = word
        break
    end
    
    if firstWord == "" or firstWord == "help" then
        TurtleData:Print("Commands:")
        TurtleData:Print("  /tdata help - show help")
        TurtleData:Print("  /tdata ping - test")
        TurtleData:Print("  /tdata ver  - version")
    elseif firstWord == "ping" then
        TurtleData:Print("pong!")
    elseif firstWord == "ver" or firstWord == "version" then
        TurtleData:Print("Version: " .. TurtleData.VERSION)
    else
        TurtleData:Print("Unknown command. Type /tdata help")
    end
end

DEFAULT_CHAT_FRAME:AddMessage("TurtleData.lua loaded! Slash command registered.")
