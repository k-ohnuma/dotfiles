return {
  {
    "dinhhuy258/git.nvim",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "APZelos/blamer.nvim",
    config = function()
      require("plugins_config.blamer")
    end,
  },
}
