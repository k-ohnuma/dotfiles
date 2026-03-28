return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/vim-vsnip",
    },
    event = "InsertEnter",
    config = function()
      require("plugins.config.cmp")
    end,
  },
  {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.config.mason")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("plugins.config.lsp-config")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    opts = {
      toggle_key = "<c-f>",
      toggle_key_flip_floatwin_setting = true,
    },
    config = require("plugins.config.lsp-signature"),
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "BufRead" },
    opts = {},
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    keys = {
      { "<Leader>t", "<cmd>Lspsaga hover_doc<CR>", mode = "n" },
      { "gf", "<cmd>Lspsaga lsp_finder<CR>", mode = "n" },
      { "gd", "<cmd>Lspsaga peek_definition<CR>", mode = "n" },
      { "gt", "<cmd>Lspsaga peek_type_definition<CR>", mode = "n" },
      { "ga", "<cmd>Lspsaga code_action<CR>", mode = "n" },
      { "gr", "<cmd>Lspsaga rename<CR>", mode = "n" },
      { "sagat", "<cmd>Lspsaga term_toggle<CR>", mode = "n" },
      { "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", mode = "n" },
      { "g[", "<cmd>Lspsaga diagnostic_jump_next<CR>", mode = "n" },
      { "g]", "<cmd>Lspsaga diagnostic_jump_prev<CR>", mode = "n" },
    },
    config = function()
      require("plugins.config.lsp-saga")
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.config.conform")
    end,
  },
}
