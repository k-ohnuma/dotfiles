return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    lazy = false,
    config = function()
      require("plugins.config.colorscheme")
    end,
  },
}
