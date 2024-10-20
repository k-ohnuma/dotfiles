return {
  'vim-scripts/vim-auto-save',
  config = function()
    require('plugins_config.auto_save')
  end,
  event = 'BufRead'
}
