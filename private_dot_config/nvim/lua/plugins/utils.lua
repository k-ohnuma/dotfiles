return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    cmd = 'Telescope',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins_config.telescope")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
  },
  {
    "FotiadisM/tabset.nvim",
    event = 'BufRead',
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
