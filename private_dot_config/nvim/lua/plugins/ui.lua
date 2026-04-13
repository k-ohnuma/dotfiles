return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.barbar_auto_setup = false
      require("plugins.config.barbar")
      vim.keymap.set("n", "<C-y>", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<C-u>", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>bo", "<cmd>BufferCloseAllButCurrent<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "BufRead",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.config.lualine")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins.config.nvim-tree")
      vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "BufRead",
    config = function()
      require("plugins.config.fidget")
    end,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    event = "BufRead",
    config = function()
      require("plugins.config.no-neck-pain")
    end,
  },
  {
    "levouh/tint.nvim",
    config = function()
      require("plugins.config.tint")
    end,
  },
}
