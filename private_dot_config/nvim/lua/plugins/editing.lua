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
      multi_windows = true,
    },
    keys = {
      { "<leader>w", "<cmd>HopWord<CR>", mode = "n", desc = "Hop Word" },
      { "<leader>l", "<cmd>HopLine<CR>", mode = "n", desc = "Hop Line" },
      {
        "f",
        "<cmd>HopChar1CurrentLineAC<CR>",
        mode = { "n", "v", "o" },
        desc = "Hop Char in Line (After Cursor)",
      },
      {
        "F",
        "<cmd>HopChar1CurrentLineBC<CR>",
        mode = { "n", "v", "o" },
        desc = "Hop Char in Line (Before Cursor)",
      },
      {
        "t",
        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>",
        mode = { "n", "v", "o" },
        desc = "Hop Before Char in Line (After Cursor)",
      },
      {
        "T",
        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>",
        mode = { "n", "v", "o" },
        desc = "Hop After Char in Line (Before Cursor)",
      },
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
    "tpope/vim-commentary",
    event = "BufRead",
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("plugins_config.auto_save")
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
    "djoshea/vim-autoread"
  }
}
