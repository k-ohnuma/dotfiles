return {
  'akinsho/toggleterm.nvim', version = "*", 
  config = function()
    require('toggleterm').setup({
        open_mapping = [[<c-t>]],
        -- on_open = function(term)
        --   vim.cmd("startinsert!")
        --   vim.api.nvim_set_keymap("t", "<C-M>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})
        -- end,
    })
  end
}
