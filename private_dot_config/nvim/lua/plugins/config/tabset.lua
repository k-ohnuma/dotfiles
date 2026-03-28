require("tabset").setup({
  defaults = {
    tabwidth = 2,
    expandtab = true,
  },
  languages = {
    rust = {
      tabwidth = 4,
      expandtab = true,
    },
    python = {
      tabwidth = 4,
      expandtab = true,
    },
    {
      filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml" },
      config = {
        tabwidth = 2,
      },
    },
  },
})
