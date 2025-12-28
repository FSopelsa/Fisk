-- Fisk Addon - English Localization

local ADDON_NAME = ...

if GetLocale() ~= "enUS" then
    return
end

-- Localization strings
local L = {
    ADDON_NAME = "Fisk",
    ADDON_LOADED = "loaded successfully",
    DEBUG_MODE_ENABLED = "Debug mode enabled",
    DEBUG_MODE_DISABLED = "Debug mode disabled",
}

-- Export localization
_G[ADDON_NAME .. "_LOCALE"] = L
