require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  yati = {
    enable = true,
    default_lazy = true,
    default_fallback = "auto"
  },
  indent = {
    enable = false -- disable builtin indent module
  }
})
