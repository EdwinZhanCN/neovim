# Neovim Configuration and Usage Notes

## Directory Structure

## New Vim User refers to [FreeCodeCamp](https://www.freecodecamp.org/news/vim-beginners-guide/)



```
~/.config/nvim/
├── init.lua        -- Main configuration file
└── lua/plugins.lua -- Plugin configuration file (loaded via require("plugins"))
```

## Basic Operation Reminders
- After modifying the configuration, you need to restart Neovim or execute `:source %` to reload
- All shortcuts are used in Normal mode (press ESC to ensure you are in Normal mode)

---

## Core Features Overview

### 1. Plugin Management (lazy.nvim)
- Automatically manages plugin installation/updates
- Includes the following plugins:
  - **UI Enhancement**: tokyonight theme, nvim-tree file explorer
  - **Code Related**: Autocompletion (nvim-cmp), LSP support, auto-pairing
  - **Tools**: Telescope fuzzy finder, DAP debugger

### 2. Theme Setting

```lua
colorscheme tokyonight-night -- Dark theme
```

(To switch themes, modify to `tokyonight-day`/`tokyonight-storm`, etc.)

---

## Shortcut Cheat Sheet

### General Operations
| Shortcut         | Description      |
| ----------- | --------- |
| `<Space>w`  | Save current file    |
| `<Space>q`  | Close current window    |
| `<Space>Q`  | Force quit all windows  |
| `<Space>e`  | Toggle file explorer |
| `<Space>n`  | Create new empty file    |
| `<esc>ggVG` | Select all lines     |
| `u`         | Undo        |

### File Search
| Shortcut        | Description                  |
|---------------|-------------------------|
| `<Space>ff`   | Global file search             |
| `<Space>fg`   | Full-text content search             |

### LSP Code Operations
| Shortcut        | Description                  |
|---------------|-------------------------|
| `gd`          | Go to definition               |
| `gi`          | Go to implementation               |
| `gr`          | Show references                 |
| `<Space>rn`   | Rename symbol               |
| `<Space>ca`   | Code actions suggestions             |
| `<Space>f`    | Format code               |

### Debugging Features (DAP)
| Shortcut        | Description                  |
|---------------|-------------------------|
| `<Space>db`   | Set/remove breakpoint            |
| `<Space>dc`   | Start/continue debugging            |
| `<Space>di`   | Step into function             |
| `<Space>do`   | Step out of function             |
| `<Space>dv`   | Step over current line           |
| `<Space>dl`   | Restart last debugging session         |

---

## Core Features Detailed

### File Explorer (nvim-tree)
- Toggle: `<Space>e`
- Basic Operations:
  - `o`: Open/close directory
  - `a`: Create new file
  - `d`: Delete file
  - `r`: Rename file
  - `/`: File filter search

### Fuzzy Finder (Telescope)
```lua
<Space>ff -- Search by filename
<Space>fg -- Full-text content search (requires ripgrep)
```
Tip: Supports fuzzy matching when typing (e.g., `mai.c` can match `main.c`)

### Code Completion System
- Trigger:
  - Automatic trigger while typing
  - Manual trigger with `<Ctrl+Space>`
- Navigation:
  - `<C-p>`/`<C-n>`: Select up/down
  - `<C-e>`: Close completion window
  - `<Enter>`: Confirm selection

### Auto Pairing Functionality
- Automatically completes parentheses/quotes
- Entering `(` will automatically complete with `)`
- Supports multiple symbols: `{}`, `[]`, `''`, `""`, etc.

---

## Recommended Environment Setup

### Tools to Install
1. **Language Servers**:
   - C/C++: clangd (`sudo apt install clangd`)
   - Python: pyright (`npm install -g pyright`)
2. Debugger:
   - C/C++: lldb (`sudo apt install lldb`)
3. Search tool:
   - ripgrep (`sudo apt install ripgrep`)

### Common Problem Troubleshooting
4. LSP Not Working:
   - Verify that the language server is installed
   - Execute `:LspInfo` to check the status
5. Autocompletion Issues:
   - Check if `nvim-cmp` dependencies are complete
   - Verify that the LSP service is running correctly

---

## Personalized Configuration Suggestions
6. Modify Theme:
```lua
-- Replace with another theme (ensure the corresponding plugin is installed)
colorscheme tokyonight-day
```
7. Adjust Indentation Settings:
```lua
-- Modify to 2-space indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
```
8. Add New Plugins:
```lua
-- Add within require("lazy").setup({})
{ "plugin repository address", config = function() ... end }
```
