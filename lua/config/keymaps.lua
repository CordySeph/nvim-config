local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ====================================================================
-- VS Code-Style Shortcuts
-- ====================================================================

-- Save file (Ctrl+S) in Normal, Insert, Visual mode
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)
keymap("v", "<C-s>", "<Esc>:w<CR>gv", opts)

-- File Explorer (Ctrl+B or <leader>e)
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer", silent = true })
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Focus File Explorer", silent = true })

-- Search Files (Ctrl+P like VS Code)
keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Quick Open File (Ctrl+P)", silent = true })

-- Tabs / Buffers Navigation (Tab / Shift-Tab)
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Tab", silent = true })
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Tab", silent = true })
keymap("n", "<leader>w", "<cmd>bdelete<CR>", { desc = "Close Current Tab", silent = true })

-- Terminal Toggle (Ctrl+\ or <leader>t like VS Code Ctrl+`)
keymap("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Integrated Terminal", silent = true })
keymap("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Integrated Terminal", silent = true })
keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle Integrated Terminal", silent = true })

-- Window Navigation (Ctrl + h/j/k/l)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window Splits
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically", silent = true })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally", silent = true })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make Splits Equal Size", silent = true })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Split Window", silent = true })

-- Move selected lines up/down (Alt+j / Alt+k like VS Code Alt+Up/Down)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Stay in indent mode when indenting with < or >
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Clear search highlight on Esc
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- ====================================================================
-- Go Language Shortcuts (ray-x/go.nvim)
-- ====================================================================
keymap("n", "<leader>gr", "<cmd>GoRun<CR>", { desc = "Go Run (main.go / package)", silent = true })
keymap("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test", silent = true })
keymap("n", "<leader>gtf", "<cmd>GoTestFunc<CR>", { desc = "Go Test Current Function", silent = true })
keymap("n", "<leader>gat", "<cmd>GoAddTag json<CR>", { desc = "Go Add JSON Tags", silent = true })
keymap("n", "<leader>grt", "<cmd>GoRmTag<CR>", { desc = "Go Remove Struct Tags", silent = true })
keymap("n", "<leader>gfs", "<cmd>GoFillStruct<CR>", { desc = "Go Auto Fill Struct", silent = true })
keymap("n", "<leader>gc", "<cmd>GoCoverage<CR>", { desc = "Go Toggle Test Coverage", silent = true })
keymap("n", "<leader>gdoc", "<cmd>GoDoc<CR>", { desc = "Go View Documentation", silent = true })
keymap("n", "<leader>gif", "<cmd>GoIfErr<CR>", { desc = "Go Generate if err != nil", silent = true })
