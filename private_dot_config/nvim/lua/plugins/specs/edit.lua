return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "smoka7/hop.nvim",
    event = "BufRead",
    version = "*",
    opts = {
      multi_windows = false,
    },
    keys = {
      { "<leader>w", "<cmd>HopWord<CR>", mode = "n", desc = "Hop Word" },
      { "<leader>l", "<cmd>HopLine<CR>", mode = "n", desc = "Hop Line" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "BufRead",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "kana/vim-operator-replace",
    event = "BufRead",
    dependencies = { "kana/vim-operator-user" },
  },
  {
    "mopp/vim-operator-convert-case",
    event = "BufRead",
    dependencies = { "kana/vim-operator-user" },
  },
  {
    "tpope/vim-commentary",
    event = "BufRead",
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("plugins.config.edit.auto-save")
    end,
    event = "BufRead",
  },
  {
    "Wansmer/treesj",
    event = "BufRead",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup()
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufRead",
    config = function()
      require("hlslens").setup()
    end,
  },
  {
    "LudoPinelli/comment-box.nvim",
  },
  {
    "djoshea/vim-autoread",
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = {
      keymaps = {
        useDefaults = true,
      },
    },
  },
  {
    "k-ohnuma/window-swap.nvim",
    dependencies = {
      "s1n7ax/nvim-window-picker",
    },
    keys = {
      { "<leader>ps", "<cmd>WinSwap<CR>", desc = "Window swap" },
    },
    config = function()
      require("winswap").setup()
    end,
  },
  {
    "FotiadisM/tabset.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.config.edit.tabset")
    end,
  },
}
