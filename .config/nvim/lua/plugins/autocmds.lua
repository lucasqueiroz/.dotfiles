-- # local resession = require "resession"

return {
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        remove_menu_entries = {
          {
            event = "VimEnter",
            group = "remove_menu_entries",
            nested = true,
            callback = function()
              vim.cmd.aunmenu [[PopUp.How-to\ disable\ mouse]]
              vim.cmd.aunmenu [[PopUp.-1-]]
            end,
          },
        },
        alpha_autostart = false,
        restore_session = {
          {
            event = "VimEnter",
            desc = "Restore previous directory",
            nested = true,
            callback = function()
              vim.notify "Testing"
              local resession = require "resession"
              if vim.fn.argc(-1) == 0 then
                resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
                vim.cmd "Neotree filesystem show"
              end
            end,
          },
        },
      },
    },
  },
}
