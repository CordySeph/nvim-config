return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vscode").setup({
      style = "dark", -- VS Code Dark+ Modern
      transparent = false,
      italic_comments = true,
      underline_links = true,
      cursorline = true,
      color_overrides = {},
      group_overrides = {},
    })
    require("vscode").load()
  end,
}
