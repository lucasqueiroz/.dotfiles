return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local lspCapabilities = vim.lsp.protocol.make_client_capabilities()
      lspCapabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Add pyright completion
      require("lspconfig").pylsp.setup {
        settings = {
          pylsp = {
            plugins = {
              black = { enabled = true },
              isort = { enabled = true, profile = "black" },
              mypy = { enabled = true },
              pycodestyle = { enabled = false },
            },
          },
        },
      }

      -- Add toml completion
      require("lspconfig").taplo.setup {
        capabilities = lspCapabilities,
      }

      -- Configure ruff-lsp
      require("lspconfig").ruff_lsp.setup {
        settings = {
          organizeImports = false,
        },
        on_attach = function(client) client.server_capabilities.hoverProvider = false end,
      }
    end,
  },
}
