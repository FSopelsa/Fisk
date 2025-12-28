-- Fisk Addon - Configuration
-- Default settings and configuration management

local Fisk = _G.Fisk

-- Default configuration
Fisk.Config = {
    debug = false,
    enabled = true,
}

-- Initialize configuration
function Fisk:LoadConfig()
    if not FiskDB.config then
        FiskDB.config = {}
    end
    
    -- Merge with defaults
    for key, value in pairs(self.Config) do
        if FiskDB.config[key] == nil then
            FiskDB.config[key] = value
        end
    end
end

-- Get config value
function Fisk:GetConfig(key)
    return FiskDB.config[key] or self.Config[key]
end

-- Set config value
function Fisk:SetConfig(key, value)
    FiskDB.config[key] = value
end

return Fisk
