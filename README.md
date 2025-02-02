# Neovim (Universal)
Simple neovim setup for C, C++, python


# Usage:

## Download LLDB

### macOS
```bash
xcode-select --install  # Installs LLDB with Xcode Command Line Tools
```
### Linux
```bash
# Debian/Ubuntu
sudo apt-get install lldb
```

### Windows
- Download pre-built LLVM/LLDB binaries:  
   [LLVM GitHub Releases](https://github.com/llvm/llvm-project/releases)  
   Look for `LLVM-*-win64.exe` or `.zip`.
   Add LLDB to your `PATH` after installation.
----------------------------
1. download Neovim from 
[official repo](https://github.com/neovim/neovim/blob/master/INSTALL.md)
2. clone or download my repo
3. download dependencies: [clangd](https://github.com/clangd/clangd),[pyright](https://github.com/microsoft/pyright)
5. put my `nvim directory` under:
**Windows**
`%USERPROFILE%\.config\`
**Mac**
`~/.config/`
**Linux**
`~/.config/`
6. Start your terminal or powershell, type `nvim` , enter.

