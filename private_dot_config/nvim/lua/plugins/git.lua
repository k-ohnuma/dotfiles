return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "APZelos/blamer.nvim",
    event = "BufRead",
    config = function()
      require("plugins_config.blamer")
    end,
  },
  {
    "rhysd/git-messenger.vim",
    event = "BufRead"
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead"
  }
}
