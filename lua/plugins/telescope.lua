return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Quick Open File" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Search Text in Project (Grep)" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Open Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "LSP Document Symbols" },
  },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_ignore_patterns = { "node_modules", ".git/", "vendor/" },
    },
  },
}
