return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "go", "gomod" },
  event = { "CmdlineEnter" },
  config = function()
    require("go").setup({
      go = "go",
      goimport = "goimports",
      fillstruct = "gopls",
      gofmt = "gofumpt",
      max_line_len = 120,
      tag_transform = false,
      tag_options = "json=omitempty",
      comment_placeholder = "   ",
      icons = { breakpoint = "🧘", currentpos = "🏃" },
      verbose = false,
      lsp_cfg = false,
      lsp_gofumpt = true,
      lsp_on_attach = false,
      lsp_keymaps = false,
      lsp_codelens = true,
      lsp_inlay_hints = {
        enable = true,
        style = "inlay",
        only_current_line = false,
      },
    })

    -- Auto-format & organize imports on save
    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").goimports()
      end,
      group = format_sync_grp,
    })
  end,
}
