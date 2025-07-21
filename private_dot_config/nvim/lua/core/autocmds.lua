vim.cmd("syntax on")
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]])

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.api.nvim_command([[%s/\r//ge]])
  end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    if vim.api.nvim_buf_get_option(0, "modifiable") then
      vim.api.nvim_command([[%s/\%V\r//ge]])
    end
  end,
})
