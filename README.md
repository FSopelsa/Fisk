# Fisk - Turtle WoW Addon

A template addon framework for Turtle WoW.

## Installation

1) Download the latest release ZIP (Fisk-*.zip) or clone the repo
2) Ensure the folder name is `Fisk` and contains `Fisk.toc` inside it
3) Place the `Fisk` folder into your Turtle WoW AddOns directory
4) Reload the UI (`/console reloadui`)

## Usage

Basic slash commands:
- `/fisk help` - Show available commands
- `/fisk version` - Display addon version
- `/fisk debug` - Toggle debug mode

## Project Structure

```
repo root
├── README.md         - This file
├── .gitignore        - Git ignore rules
└── Fisk/             - Addon folder (name must match Fisk.toc)
    ├── Fisk.toc      - Addon manifest file
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

1. Create new files in `Fisk/src/`
2. Add them to the load order in `Fisk/Fisk.toc`
3. Use the global `Fisk` namespace for all code

### Example Feature

```lua
local Fisk = _G.Fisk

function Fisk:MyFeature()
    Fisk:Print("Feature loaded!")
end
```

## Packaging for launchers

- Keep the addon inside a single folder named `Fisk`
- The manifest must be `Fisk/Fisk.toc`
- Release ZIPs should contain the `Fisk/` folder as the top-level entry

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
