return {
  -- Auto save files
  {
    "Pocco81/auto-save.nvim",
    opts = {
      trigger_events = {"InsertLeave", "TextChanged"},
      debounce_delay = 100
    },
    event = "User AstroFile"
  }
}
