require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  yati = {
    enable = false,
    default_lazy = true,
    default_fallback = "cindent",
  },
  indent = {
    enable = false, -- disable builtin indent module
  },
})
