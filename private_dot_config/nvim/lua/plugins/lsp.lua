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
      require("plugins_config.cmp")
    end,
  },
  {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason").setup({
        ensure_installed = {
          "rust-analyzer",
        },
        PATH = "append",
      })
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
      require("plugins_config.mason-lspconfig")
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
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "BufRead",
    config = function()
      require("plugins_config.fidget")
    end,
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
    config = function()
      require("plugins_config.lspsaga")
    end,
  },
}
