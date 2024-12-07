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

require("tokyonight").setup({
    style = "storm",
    transparent = false,
    terminal_colors = true,
    dim_inictive = true,
    styles = {
        comments = { italic = false },
        keywords = { bold = false, italic = false },
        functions = { italic = false, bold = false },
        variables = { italic = false, bold = false },
         diagnostics = {
            underline = false,
        },
    },
})

require('nordic').setup({
    -- This callback can be used to override the colors used in the base palette.
    on_palette = function(palette) end,
    -- This callback can be used to override the colors used in the extended palette.
    after_palette = function(palette) end,
    -- This callback can be used to override highlights before they are applied.
    on_highlight = function(highlights, palette) end,
    -- Enable bold keywords.
    bold_keywords = false,
    -- Enable italic comments.
    italic_comments = false,
    -- Enable editor background transparency.
    transparent = {
        -- Enable transparent background.
        bg = false,
        -- Enable transparent background for floating windows.
        float = false,
    },
    -- Enable brighter float border.
    bright_border = false,
    -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = true,
    -- Cursorline options.  Also includes visual/selection.
    cursorline = {
        enable = false,
        -- Bold font in cursorline.
        bold = false,
        -- Bold cursorline number.
        bold_number = true,
        -- Available styles: 'dark', 'light'.
        theme = 'dark',
        -- Blending the cursorline bg with the buffer bg.
        blend = 0.85,
    },
    noice = {
        -- Available styles: `classic`, `flat`.
        style = 'classic',
    },
    telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
    },
    leap = {
        -- Dims the backdrop when using leap.
        dim_backdrop = false,
    },
    ts_context = {
        -- Enables dark background for treesitter-context window
        dark_background = true,
    }
})

vim.cmd([[colorscheme catppuccin]])
