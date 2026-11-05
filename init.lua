-- Ensure Go, Mason, and local binaries are always in PATH inside Neovim
local home = vim.fn.expand("$HOME")
local extra_paths = {
  home .. "/.local/bin",
  home .. "/.local/go/bin",
  home .. "/go/bin",
}
local path_str = table.concat(extra_paths, ":")
if not string.find(vim.env.PATH, home .. "/.local/go/bin", 1, true) then
  vim.env.PATH = path_str .. ":" .. vim.env.PATH
end

-- Set leader key to Space (must be set before loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core configurations
require("config.options")
require("config.lazy")
require("config.keymaps")
