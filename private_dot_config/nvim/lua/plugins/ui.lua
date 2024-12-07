return {
  {
    "romgrk/barbar.nvim",
    -- event = {'BufNewFile', 'BufRead'},
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.barbar_auto_setup = false -- disable auto-setup
      require("plugins_config.barbar")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "BufRead",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "simeji/winresizer",
    cmd = "WinResizerStartResize",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins_config.nvim-tree")
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },
  -- {
  --   "folke/zen-mode.nvim",
  -- }
}