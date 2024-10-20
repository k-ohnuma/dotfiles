return {
  'kevinhwang91/nvim-hlslens',
  event = 'BufRead',
  config = function()
    require('hlslens').setup()
  end
}
