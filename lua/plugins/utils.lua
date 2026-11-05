return {
  -- Auto Close Pairs (), {}, [], "", ''
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
        },
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Comment Code (gcc for single line, gc in visual mode, Ctrl+/ in normal and insert)
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("Comment").setup()

      -- VS Code Ctrl+/ shortcuts for comment toggle
      local api = require("Comment.api")
      vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, { desc = "Toggle Comment" })
      vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, { desc = "Toggle Comment" })
      vim.keymap.set("i", "<C-/>", function() api.toggle.linewise.current() end, { desc = "Toggle Comment" })
      vim.keymap.set("i", "<C-_>", function() api.toggle.linewise.current() end, { desc = "Toggle Comment" })
      vim.keymap.set("v", "<C-/>", function()
        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.toggle.linewise(vim.fn.visualmode())
      end, { desc = "Toggle Comment" })
      vim.keymap.set("v", "<C-_>", function()
        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.toggle.linewise(vim.fn.visualmode())
      end, { desc = "Toggle Comment" })
    end,
  },
}
