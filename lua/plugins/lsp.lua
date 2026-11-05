return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Diagnostic signs (VS Code style)
      local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Diagnostic display config
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Rounded borders for hover & signature help
      local orig_hover = vim.lsp.handlers["textDocument/hover"]
      vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
        config = vim.tbl_extend("force", config or {}, { border = "rounded" })
        return orig_hover(err, result, ctx, config)
      end

      local orig_sig = vim.lsp.handlers["textDocument/signatureHelp"]
      vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
        config = vim.tbl_extend("force", config or {}, { border = "rounded" })
        return orig_sig(err, result, ctx, config)
      end

      -- Mason setup
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "gopls" },
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Keybindings on LSP attach (VS Code style)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(args)
          local bufnr = args.buf
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc, silent = true })
          end

          map("gd", vim.lsp.buf.definition, "Go to Definition (F12)")
          map("gD", vim.lsp.buf.declaration, "Go to Declaration")
          map("gr", vim.lsp.buf.references, "Go to References")
          map("gi", vim.lsp.buf.implementation, "Go to Implementation")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")
          map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
          map("<F2>", vim.lsp.buf.rename, "Rename Symbol (F2)")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action (Ctrl+.)")
          map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format Document")
          map("<leader>d", vim.diagnostic.open_float, "Show Line Diagnostics")
          map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
        end,
      })

      -- Configure gopls
      local gopls_settings = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
              nilness = true,
              unusedwrite = true,
            },
            staticcheck = true,
            gofumpt = true,
            completeUnimported = true,
            usePlaceholders = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      }

      if vim.lsp.config then
        vim.lsp.config["gopls"] = vim.tbl_extend("force", gopls_settings, {
          root_markers = { "go.work", "go.mod", ".git" },
        })
        vim.lsp.enable("gopls")
      else
        local lspconfig = require("lspconfig")
        gopls_settings.root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git")
        lspconfig.gopls.setup(gopls_settings)
      end
    end,
  },
}
