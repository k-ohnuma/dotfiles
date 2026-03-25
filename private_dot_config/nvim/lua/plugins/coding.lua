return {
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("plugins.config.autotag")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("plugins.config.treesitter")
    end,
  },
  {
    "yioneko/nvim-yati",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "FotiadisM/tabset.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.config.tabset")
    end,
  },
}
