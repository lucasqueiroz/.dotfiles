return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    opts = {
      -- Shows relative path of file being created
      window = {
        mappings = {
          ["a"] = {
            "add",
            config = {
              show_path = "relative",
            },
          },
        },
      },
      filesystem = {
        filtered_items = {
          -- Shows hidden files by default
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      event_handlers = {
        {
          -- Open file when creating
          event = "file_added",
          handler = function(arg)
            vim.cmd("edit " .. arg)
            vim.cmd "start"
          end,
        },
        {
          event = "neo_tree_buffer_enter",
          handler = function(_)
            vim.cmd.amenu [[PopUp.New\ File a]]
            vim.cmd.amenu [[PopUp.Rename r]]
            vim.cmd.amenu [[PopUp.Delete d]]
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function(_)
            vim.cmd.aunmenu [[PopUp.New\ File]]
            vim.cmd.aunmenu [[PopUp.Rename]]
            vim.cmd.aunmenu [[PopUp.Delete]]
          end,
        },
      },
    },
  },
}
