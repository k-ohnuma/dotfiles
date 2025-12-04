require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  ignore_install = { "ipkg" },
  highlight = {
    enable = true,
  },
  yati = {
    enable = true,
    default_lazy = true,
    default_fallback = "cindent",
  },
  indent = {
    enable = false,
  },
})
