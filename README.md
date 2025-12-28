# Fisk - Turtle WoW Addon

A template addon framework for Turtle WoW.

## Installation

1. Copy the `fisk` folder to your Turtle WoW Addons directory
2. Restart the game or reload the UI (`/console reloadui`)
3. The addon will load automatically

## Usage

Basic slash commands:
- `/fisk help` - Show available commands
- `/fisk version` - Display addon version
- `/fisk debug` - Toggle debug mode

## Project Structure

```
fisk/
├── fisk.toc          - Addon manifest file
├── README.md         - This file
├── .gitignore        - Git ignore rules
├── src/
│   ├── Core.lua      - Core addon functionality
│   ├── Config.lua    - Configuration management
│   ├── Utilities.lua - Helper functions
│   └── Main.lua      - Main logic and events
└── locale/
    └── enUS.lua      - English localization
```

## Development

### Adding Features

1. Create new files in the `src/` directory
2. Add them to the load order in `fisk.toc`
3. Use the `Fisk` namespace for all code

### Example Feature

```lua
local ADDON_NAME, Fisk = ...

function Fisk:MyFeature()
    Fisk:Print("Feature loaded!")
end
```

## API Reference

### Fisk:Print(message)
Print a colored message to chat

### Fisk:Debug(message)
Print debug message (only if debug mode enabled)

### Fisk:GetConfig(key)
Get configuration value

### Fisk:SetConfig(key, value)
Set configuration value

### Fisk:InCombat()
Check if player is in combat

### Fisk:GetPlayerName()
Get player character name

### Fisk:GetPlayerClass()
Get player class

### Fisk:GetPlayerLevel()
Get player level

### Fisk:HasTarget()
Check if player has a target

### Fisk:After(delay, callback)
Execute callback after delay (in seconds)

## License

Free to use and modify for Turtle WoW

## Support

For issues or questions, modify the addon as needed for your use case.
