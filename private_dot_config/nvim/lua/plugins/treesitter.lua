return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("plugins_config.treesitter")
    end,
  },
  {
    "yioneko/nvim-yati",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
