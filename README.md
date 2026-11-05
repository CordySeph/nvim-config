# 🚀 CordySeph's Neovim Configuration

A clean, modern, and high-performance Neovim configuration built with Lua, featuring VS Code-like keybindings, blazing-fast fuzzy finding, and full Go development support. Powered by [lazy.nvim](https://github.com/folke/lazy.nvim).

---

## ✨ Features

- **Package Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast, concurrent plugin management.
- **Fuzzy Finder**: [Telescope](https://github.com/nvim-telescope/telescope.nvim) for files, live grep, buffers, and git.
- **Syntax Highlighting**: [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for rich code parsing.
- **LSP & Autocomplete**: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [mason.nvim](https://github.com/williamboman/mason.nvim), and [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- **Go Support**: Pre-configured Go LSP, formatting, testing, and struct tag tools via [go.nvim](https://github.com/ray-x/go.nvim).
- **File Explorer**: [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) with file icons.
- **Terminal Integration**: [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) toggled with `Ctrl+\`.
- **Git Integration**: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for visual inline git diffs.
- **Key Guide**: [which-key.nvim](https://github.com/folke/which-key.nvim) for interactive key popup guides.

---

## ⚡️ Quick Installation on macOS (MacBook)

### Option 1: One-Line Automated Install (Recommended)

Run the following command directly in your macOS Terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/CordySeph/nvim-config/main/install.sh | bash
```

The script will automatically:
1. Verify / prompt Xcode Command Line Tools.
2. Install [Homebrew](https://brew.sh) (if not already installed).
3. Install dependencies (`neovim`, `ripgrep`, `fd`, `make`).
4. Install **JetBrains Mono Nerd Font** for glyphs and icons.
5. Clone the configuration into `~/.config/nvim` (with automatic backup if an existing config is found).
6. Pre-sync and download all plugins with `lazy.nvim`.

---

### Option 2: Manual Installation (macOS)

If you prefer to run each step manually:

1. **Install dependencies via Homebrew:**
   ```bash
   brew install neovim git ripgrep fd make
   brew install --cask font-jetbrains-mono-nerd-font
   xcode-select --install
   ```

2. **Clone the repository:**
   ```bash
   git clone https://github.com/CordySeph/nvim-config.git ~/.config/nvim
   ```

3. **Launch Neovim:**
   ```bash
   nvim
   ```
   *`lazy.nvim` will automatically bootstrap and install all plugins on first launch.*

---

## 🐧 Installation on Linux (Ubuntu / Debian / WSL)

```bash
# 1. Install dependencies
sudo apt update && sudo apt install -y git neovim ripgrep fd-find build-essential

# 2. Clone configuration
git clone https://github.com/CordySeph/nvim-config.git ~/.config/nvim

# 3. Launch Neovim
nvim
```

---

## ⌨️ Common Keybindings

The leader key is set to **`<Space>`**.

### Navigation & Files
| Keybinding | Action |
|---|---|
| `<C-p>` | Open file finder (Telescope) |
| `<C-b>` | Toggle file explorer (NvimTree) |
| `<leader>e` | Focus file explorer |
| `<Tab>` / `<S-Tab>` | Cycle next / previous open buffer (tab) |
| `<leader>w` | Close current buffer (tab) |
| `<C-s>` | Save file (in Normal, Insert, or Visual mode) |
| `<C-\>` | Toggle floating terminal |

### Window Splits
| Keybinding | Action |
|---|---|
| `<leader>sv` | Split window vertically |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Equalize split sizes |
| `<leader>sx` | Close current split |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Navigate between split windows |

### Go Development Shortcuts
| Keybinding | Action |
|---|---|
| `<leader>gr` | Run Go main / package (`:GoRun`) |
| `<leader>gt` | Run Go tests (`:GoTest`) |
| `<leader>gtf` | Run current test function (`:GoTestFunc`) |
| `<leader>gat` | Add JSON tags to struct (`:GoAddTag json`) |
| `<leader>grt` | Remove struct tags (`:GoRmTag`) |
| `<leader>gfs` | Fill struct with default values (`:GoFillStruct`) |
| `<leader>gif` | Generate `if err != nil` boilerplate |
| `<leader>gc` | Toggle test coverage highlight (`:GoCoverage`) |

---

## 🔄 Updating Configuration & Plugins

To pull the latest changes:
```bash
cd ~/.config/nvim
git pull
```

To update all installed plugins inside Neovim:
```vim
:Lazy update
```
