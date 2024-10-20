return {
 'cesaralvarod/tokyogogh.nvim', lazy=false, priority=1000 ,
 config = function()
   require('tokyogogh').setup {
    style = 'storm', -- storm | night
    term_colors = false,
    -- Change code styles
    code_styles = {
      strings = { italic = false, bold = false },
      comments = { italic = true, bold = false },
      functions = { italic = false, bold = false },
      variables = { italic = false, bold = false },
    },
    diagnostics = {
      undercurl = true, -- use undercurl instead of underline
      background = false,
    },
    -- Customization
    colors = {},
    highlight = {},
  }
 end
}
