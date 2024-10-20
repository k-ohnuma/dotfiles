require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
  term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
  no_italic = true, -- Force no italic
  no_bold = false, -- Force no bold
  dim_inactive = {
    enabled = true, -- dims the background color of inactive window
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
})

require("kanagawa").setup({
  compile = false, -- enable compiling the colorscheme
  undercurl = false, -- enable undercurls
  commentStyle = { italic = false },
  functionStyle = { italic = false },
  keywordStyle = { italic = false },
  statementStyle = { bold = false, italic = false },
  typeStyle = { italic = false },
  transparent = true, -- do not set background color
  dimInactive = true, -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
})

vim.cmd([[colorscheme catppuccin]])
