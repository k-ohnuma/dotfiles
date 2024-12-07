
return {
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
