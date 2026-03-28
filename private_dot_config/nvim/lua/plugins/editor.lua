return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    keys = {
      {
        "<CR>",
        'v:lua.require("nvim-autopairs").autopairs_cr()',
        mode = "i",
        expr = true,
        noremap = true,
      },
      { "<S-CR>", "<CR>", mode = "i" },
    },
    config = function()
      require("plugins.config.autopairs")
    end,
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
      require("plugins.config.nvim-surround")
    end,
  },
  {
    "kana/vim-operator-replace",
    event = "BufRead",
    dependencies = { "kana/vim-operator-user" },
    keys = {
      { "_", "<Plug>(operator-replace)", mode = "n" },
    },
  },
  {
    "mopp/vim-operator-convert-case",
    event = "BufRead",
    dependencies = { "kana/vim-operator-user" },
    keys = {
      { "<Leader>cu", "<Plug>(operator-convert-case-lower-camel)", mode = "n" },
      { "<Leader>cU", "<Plug>(operator-convert-case-upper-camel)", mode = "n" },
      { "<Leader>su", "<Plug>(operator-convert-case-lower-snake)", mode = "n" },
      { "<Leader>sU", "<Plug>(operator-convert-case-upper-snake)", mode = "n" },
    },
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n" },
    },
    config = function()
      require("plugins.config.comment")
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("plugins.config.ts-context-commentstring")
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("plugins.config.auto-save")
    end,
  },
  {
    "Wansmer/treesj",
    event = "BufRead",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("plugins.config.treesj")
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufRead",
    keys = {
      {
        "n",
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zz]],
        mode = "n",
      },
      {
        "N",
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zz]],
        mode = "n",
      },
      { "*", [[*<Cmd>lua require('hlslens').start()<CR>]], mode = "n" },
      { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], mode = "n" },
    },
    config = function()
      require("plugins.config.hlslens")
    end,
  },
  {
    "LudoPinelli/comment-box.nvim",
    keys = {
      { "<Leader>cb", "<Cmd>CBllbox<CR>", mode = { "n", "v" } },
      { "<Leader>cl", "<Cmd>CBllline<CR>", mode = { "n", "v" } },
    },
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
    "ysmb-wtsg/in-and-out.nvim",
    keys = {
      {
        "<C-CR>",
        function()
          require("in-and-out").in_and_out()
        end,
        mode = "i",
      },
      {
        "<C-CR>",
        function()
          require("in-and-out").in_and_out()
        end,
        mode = "n",
      },
    },
  },
}
