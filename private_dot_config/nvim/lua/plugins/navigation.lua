local notes = require("lib.notes")

return {
  {
    "simeji/winresizer",
    cmd = "WinResizerStartResize",
    init = function()
      vim.g.winrezier_start_key = "<C-s>"
    end,
    keys = {
      { "<C-s>", "<cmd>WinResizerStartResize<CR>", mode = "n" },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    keys = {
      { "<leader>g", function() require("plugins.config.toggleterm").lazygit() end, mode = "n", desc = "Lazygit" },
    },
    config = function()
      require("plugins.config.toggleterm").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.config.telescope")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
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
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = require("plugins.config.snacks"),
    keys = {
      {
        "<C-p>",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files (Snacks)",
      },
      {
        "<C-g>",
        function()
          Snacks.picker.grep()
        end,
        desc = "Live Grep (Snacks)",
      },
      {
        "<C-@>",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers (Snacks)",
      },
      { "<leader>np", notes.pick_notes, desc = "nb picker" },
      { "<leader>ng", notes.grep_notes, desc = "nb grep" },
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
      require("plugins.config.window-swap")
    end,
  },
}
