-- Fisk Addon - Main
-- Main addon logic and event handling

local ADDON_NAME = "Fisk"
local Fisk = _G.Fisk

-- Create frame for event handling
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

-- Event handler
function frame:OnEvent(event, ...)
    if event == "ADDON_LOADED" then
        local addonName = ...
        if addonName == ADDON_NAME then
            Fisk:LoadConfig()
            Fisk:Initialize()
        end
    elseif event == "PLAYER_LOGIN" then
        Fisk:OnPlayerLogin()
    end
end

frame:SetScript("OnEvent", frame.OnEvent)

-- Called when player logs in
function Fisk:OnPlayerLogin()
    Fisk:Debug("Player login detected")
    -- Add your startup logic here
end

-- Slash command
SLASH_FISK1 = "/fisk"
SlashCmdList["FISK"] = function(msg)
    msg = msg or ""
    local cmd = string.lower(msg)
    
    -- Split first word for command
    local firstWord = cmd:match("^(%S+)")
    if not firstWord then
        firstWord = ""
    end
    
    if firstWord == "debug" then
        Fisk:SetConfig("debug", not Fisk:GetConfig("debug"))
        Fisk:Print("Debug mode: " .. tostring(Fisk:GetConfig("debug")))
    elseif firstWord == "version" then
        Fisk:Print("Version: " .. Fisk.VERSION)
    elseif firstWord == "help" or firstWord == "" then
        Fisk:Print("Available commands:")
        Fisk:Print("  /fisk help - Show this message")
        Fisk:Print("  /fisk version - Show addon version")
        Fisk:Print("  /fisk debug - Toggle debug mode")
    else
        Fisk:Print("Unknown command. Use /fisk help for available commands")
    end
end

return Fisk
