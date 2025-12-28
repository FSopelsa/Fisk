-- Fisk Addon - Utilities
-- Helper functions and utilities

local Fisk = _G.Fisk

-- Check if player is in combat
function Fisk:InCombat()
    return UnitAffectingCombat("player")
end

-- Get player name
function Fisk:GetPlayerName()
    return UnitName("player")
end

-- Get player class
function Fisk:GetPlayerClass()
    local _, class = UnitClass("player")
    return class
end

-- Get player level
function Fisk:GetPlayerLevel()
    return UnitLevel("player")
end

-- Check if target exists
function Fisk:HasTarget()
    return UnitExists("target")
end

-- Delay function execution
function Fisk:After(delay, callback)
    local timer = CreateFrame("Frame")
    timer.elapsed = 0
    timer:SetScript("OnUpdate", function(self, elapsed)
        self.elapsed = self.elapsed + elapsed
        if self.elapsed >= delay then
            callback()
            self:SetScript("OnUpdate", nil)
        end
    end)
end

-- Print table contents (for debugging)
function Fisk:PrintTable(tbl, indent)
    indent = indent or 0
    local prefix = string.rep("  ", indent)
    
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print(prefix .. key .. ": {")
            self:PrintTable(value, indent + 1)
            print(prefix .. "}")
        else
            print(prefix .. key .. ": " .. tostring(value))
        end
    end
end

return Fisk
