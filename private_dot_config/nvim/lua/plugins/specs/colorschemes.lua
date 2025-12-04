return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    lazy = false,
    config = function()
      require("plugins.config.colorschemes")
    end,
  },
  {
    "levouh/tint.nvim",
    config = function()
      require("tint").setup({
        tint = -50,
        saturation = 0.5,
        tint_background_colors = false,
      })
    end,
  },
}
