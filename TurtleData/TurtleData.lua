DEFAULT_CHAT_FRAME:AddMessage("TurtleData.lua is loading...")

-- Create namespace
TurtleData = {}
TurtleData.VERSION = "0.1.0"

-- Helper function to print messages
function TurtleData:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff7fTurtleData|r: " .. tostring(msg))
end

-- Create the main search frame
function TurtleData:CreateSearchFrame()
    -- Main frame
    local frame = CreateFrame("Frame", "TurtleDataSearchFrame", UIParent)
    frame:SetWidth(400)
    frame:SetHeight(150)
    frame:SetPoint("CENTER", UIParent, "CENTER")
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function() this:StartMoving() end)
    frame:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)
    frame:Hide()
    
    -- Backdrop (background)
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.9)
    
    -- Title text
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -15)
    title:SetText("|cff00ff7fTurtle Database Search|r")
    
    -- Search label
    local searchLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    searchLabel:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -50)
    searchLabel:SetText("Search:")
    
    -- Search EditBox
    local searchBox = CreateFrame("EditBox", "TurtleDataSearchBox", frame, "InputBoxTemplate")
    searchBox:SetWidth(320)
    searchBox:SetHeight(32)
    searchBox:SetPoint("LEFT", searchLabel, "RIGHT", 10, 0)
    searchBox:SetAutoFocus(false)
    searchBox:SetMaxLetters(100)
    searchBox:SetScript("OnEnterPressed", function()
        local searchText = this:GetText()
        TurtleData:PerformSearch(searchText)
        this:ClearFocus()
    end)
    searchBox:SetScript("OnEscapePressed", function()
        this:ClearFocus()
    end)
    
    -- Search button
    local searchButton = CreateFrame("Button", "TurtleDataSearchButton", frame, "UIPanelButtonTemplate")
    searchButton:SetWidth(100)
    searchButton:SetHeight(25)
    searchButton:SetPoint("TOP", searchBox, "BOTTOM", 0, -10)
    searchButton:SetText("Search")
    searchButton:SetScript("OnClick", function()
        local searchText = getglobal("TurtleDataSearchBox"):GetText()
        TurtleData:PerformSearch(searchText)
    end)
    
    -- Close button
    local closeButton = CreateFrame("Button", "TurtleDataCloseButton", frame, "UIPanelButtonTemplate")
    closeButton:SetWidth(80)
    closeButton:SetHeight(25)
    closeButton:SetPoint("BOTTOM", frame, "BOTTOM", 0, 15)
    closeButton:SetText("Close")
    closeButton:SetScript("OnClick", function()
        frame:Hide()
    end)
    
    self.searchFrame = frame
end

-- Search functionality
function TurtleData:PerformSearch(query)
    if not query or query == "" then
        self:Print("Please enter a search term")
        return
    end
    
    self:Print("Searching for: |cffffd700" .. query .. "|r")
    -- TODO: Implement actual database search here
    self:Print("Search functionality coming soon!")
end

-- Toggle search frame
function TurtleData:ToggleSearchFrame()
    if not self.searchFrame then
        self:CreateSearchFrame()
    end
    
    if self.searchFrame:IsVisible() then
        self.searchFrame:Hide()
    else
        self.searchFrame:Show()
    end
end

-- Event handling
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function()
    TurtleData:Print("Addon loaded successfully! Version " .. TurtleData.VERSION)
    TurtleData:Print("Type |cffffd700/tdata help|r for commands")
end)

-- Slash command handler
SLASH_TURTLEDATA1 = "/tdata"
SlashCmdList["TURTLEDATA"] = function(msg)
    -- Parse command and args using string.gfind (Vanilla compatible)
    local cmd = nil
    for word in string.gfind(msg, "%S+") do
        if not cmd then
            cmd = string.lower(word)
        end
        break
    end
    
    cmd = cmd or "help"
    
    if cmd == "help" then
        TurtleData:Print("Available commands:")
        TurtleData:Print("|cffffd700/tdata help|r - Show this help")
        TurtleData:Print("|cffffd700/tdata search|r - Toggle search window")
        TurtleData:Print("|cffffd700/tdata ping|r - Test command")
        TurtleData:Print("|cffffd700/tdata ver|r - Show version")
    elseif cmd == "search" then
        TurtleData:ToggleSearchFrame()
    elseif cmd == "ping" then
        TurtleData:Print("Pong! Addon is working.")
    elseif cmd == "ver" then
        TurtleData:Print("Version: " .. TurtleData.VERSION)
    else
        TurtleData:Print("Unknown command: " .. cmd)
        TurtleData:Print("Type |cffffd700/tdata help|r for available commands")
    end
end

DEFAULT_CHAT_FRAME:AddMessage("TurtleData.lua loaded! Slash command registered.")
