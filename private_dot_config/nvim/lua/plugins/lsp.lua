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
        PATH = "append"
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
    'jose-elias-alvarez/null-ls.nvim',
    event = "BufRead",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      'jay-babu/mason-null-ls.nvim',
    },
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
    cmd = "Trouble",
    config = function()
      require("plugins_config.trouble")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("plugins_config.lspsaga")
    end,
  },
}
