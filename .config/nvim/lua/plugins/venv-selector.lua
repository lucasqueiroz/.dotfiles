return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    config = function() require("venv-selector").setup() end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      dap_enabled = true,
    },
    lazy = false,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
}
