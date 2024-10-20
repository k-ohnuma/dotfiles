return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins_config.telescope")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "FotiadisM/tabset.nvim",
    config = function()
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
          {
            filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml" },
            config = {
              tabwidth = 2,
            },
          },
        },
      })
    end,
  },
}
