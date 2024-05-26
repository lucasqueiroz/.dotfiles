return {
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          relativenumber = false,
          spell = false,
          whichwrap = "<,>,[,],h,l",
        },
        o = {
          mouse = "nvi",
        },
      },
      autocmds = {
        autoopentree = {
          {
            event = "VimEnter",
            group = "autoopentree",
            callback = function()
              -- vim.cmd("Neotree toggle")
              vim.cmd.aunmenu([[PopUp.How-to\ disable\ mouse]])
              vim.cmd.aunmenu([[PopUp.-1-]])
            end
          }
        }
      },
    },
  },
}
