return {
  {
    "stevearc/conform.nvim",
    events = "BuffWritePre",
    keys = {
      {
        "<leader>f",
        function() require("conform").format { lsp_fallback = true } end,
        desc = "Format",
      },
    },
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
        markdown = { "inject" },
      },
      format_on_save = {
        lsp_fallback = true,
      },
    },
  },
}
