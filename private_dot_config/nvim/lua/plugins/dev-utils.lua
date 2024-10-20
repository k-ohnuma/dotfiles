return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
    },
    cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatExplain", "CopilotChatFix", "CopilotChatReview" },
    config = function()
      require("plugins_config.copilot")
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        copilot_node_command = "node",
      })
    end,
  },
  {
    "voldikss/vim-translator",
    cmd = { "Translate", "TranslateH", "TranslateL", "TranslateR", "TranslateW", "TranslateX" },
    config = function()
      require("plugins_config.translator")
    end,
  },
  -- {
  --   "simrat39/rust-tools.nvim",
  -- },
  -- {
  --   "rust-lang/rust.vim",
  -- },
}
