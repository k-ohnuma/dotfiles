require("lspsaga").setup({
  border_style = "single",
  symbol_in_winbar = {
    enable = true,
  },
  lightbulb = {
    enable = false,
  },
  code_action_lightbulb = {
    enable = true,
  },
  show_outline = {
    win_width = 50,
    auto_preview = false,
  },
  definition = {
    width = 0.6,
    height = 0.5,
    keys = {
      edit = "o",
      vsplit = "v",
      quit = "q",
    },
  },
})
