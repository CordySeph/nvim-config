local opt = vim.opt

-- Appearance & VS Code Look
opt.termguicolors = true          -- True 24-bit RGB colors
opt.number = true                 -- Show line numbers
opt.relativenumber = false        -- Absolute line numbers like VS Code
opt.cursorline = true             -- Highlight current line
opt.signcolumn = "yes"            -- Always show sign column for git & lsp
opt.fillchars = { eob = " " }     -- Clean buffer endings (hide tildes ~)
opt.showmode = false              -- Status line already shows mode

-- Mouse & Clipboard
opt.mouse = "a"                   -- Full mouse support (click, scroll, selection)
opt.clipboard = "unnamedplus"     -- Sync with system clipboard (Ctrl+C / Ctrl+V)

-- Tabs & Indentation (Go standard: tab = 4)
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = false             -- Use actual tabs for Go standard
opt.autoindent = true
opt.smartindent = true

-- Search settings
opt.ignorecase = true             -- Case-insensitive search...
opt.smartcase = true              -- ...unless uppercase is used
opt.hlsearch = true
opt.incsearch = true

-- Window Splitting (natural VS Code split behavior)
opt.splitbelow = true
opt.splitright = true

-- Smooth scrolling & delays
opt.scrolloff = 8                 -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8
opt.updatetime = 250              -- Fast updates for LSP & git
opt.timeoutlen = 300              -- Fast which-key popup

-- File & Undo
opt.undofile = true               -- Persistent undo history across sessions
opt.swapfile = false
opt.wrap = false                  -- Do not wrap long lines by default
opt.completeopt = { "menu", "menuone", "noselect" }
