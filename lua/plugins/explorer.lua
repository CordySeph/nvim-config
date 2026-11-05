return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeCollapse" },
  keys = {
    { "<C-b>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
    { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Focus File Explorer" },
  },
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      width = 32,
      side = "left",
      number = false,
      relativenumber = false,
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = true,
      highlight_opened_files = "all",
      root_folder_label = ":~:s?$?/..?",
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = { ".git", "node_modules", ".cache" },
    },
    git = {
      enable = true,
      ignore = false,
    },
  },
}
