return {
  'romgrk/barbar.nvim',
  -- event = 'BufRead',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  config = function()
    vim.g.barbar_auto_setup = false -- disable auto-setup
    require('plugins_config.barbar')
  end
}
