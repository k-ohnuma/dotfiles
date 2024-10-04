return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    toggle_key = '<c-f>', -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    toggle_key_flip_floatwin_setting = true,
  },
  config = function(_, opts) require'lsp_signature'.setup(opts) end
}
