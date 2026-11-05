# Neovim Configuration

Personal Neovim configuration built with Lua and [lazy.nvim](https://github.com/folke/lazy.nvim).

## 🚀 One-Line Installation on macOS (MacBook)

Run this command directly in your Terminal on macOS:

```bash
curl -fsSL https://raw.githubusercontent.com/CordySeph/nvim-config/main/install.sh | bash
```

Or clone and run the script manually:

```bash
git clone git@github.com:CordySeph/nvim-config.git ~/.config/nvim
cd ~/.config/nvim
./install.sh
```

## 📦 What the installer sets up
- **Xcode Command Line Tools** (C compiler for Treesitter)
- **Homebrew** (Package manager)
- **Neovim**, `ripgrep`, `fd`, `make`
- **JetBrains Mono Nerd Font** (for file icons and glyphs)
- Clones config to `~/.config/nvim` (with automatic backup if you already have one)
- Automatically syncs all plugins via `lazy.nvim`
