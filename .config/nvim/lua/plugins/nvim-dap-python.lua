return {
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local debugpyPythonPath = require("mason-registry").get_package("debugpy"):get_install_path()
        .. "/venv/bin/python3"
      require("dap-python").setup(debugpyPythonPath, {})
    end,
  },
}
