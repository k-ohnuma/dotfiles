require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  show_end_of_buffer = true,
  term_colors = true,
  no_italic = true,
  no_bold = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_underline = true,
  integrations = {
    cmp = true,
    barbar = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
  custom_highlights = function(colors)
    return {
      Operator = { fg = colors.mauve },
    }
  end,
})
