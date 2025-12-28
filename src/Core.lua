-- Fisk Addon - Core
-- Core addon initialization and framework

local ADDON_NAME = ...

-- Create addon namespace (global)
_G.Fisk = _G.Fisk or {}
local Fisk = _G.Fisk

-- Version info
Fisk.VERSION = "1.0.0"
Fisk.NAME = ADDON_NAME

-- Initialize saved variables
function Fisk:Initialize()
    FiskDB = FiskDB or {}
    FiskCharDB = FiskCharDB or {}
    
    self:Print("Loaded version " .. self.VERSION)
end

-- Utility function for colored print
function Fisk:Print(message)
    local prefix = "|cff1eff00" .. self.NAME .. "|r"
    print(prefix .. ": " .. message)
end

-- Utility function for debug printing
function Fisk:Debug(message)
    if FiskDB.debug then
        self:Print("|cffff9900[DEBUG]|r " .. message)
    end
end

return Fisk
