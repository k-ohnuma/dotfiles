require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
  term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
  no_italic = true, -- Force no italic
  no_bold = false, -- Force no bold
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_underline = true, -- Force no underline
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

require("tint").setup({
  tint = -50,
  saturation = 0.5,
  tint_background_colors = false,
})

vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme cyberdream]])
