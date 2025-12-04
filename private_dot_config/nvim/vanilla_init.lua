vim.g.mapleader = " "
vim.o.encoding = "utf-8"
vim.scriptencoding = "utf-8"

-- base.lua
vim.opt.autoread = true
vim.wo.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.swapfile = false
vim.bo.shiftwidth = 2
vim.o.tabstop = 2
vim.bo.expandtab = true
vim.bo.textwidth = 0
vim.bo.autoindent = true
vim.o.hlsearch = true
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.wo.cursorline = true
vim.o.wildmenu = true
vim.o.title = true
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.opt.list = true
vim.o.pumheight = 15
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.listchars = {
  trail = "-",
  space = "･",
  tab = "»-",
}
if vim.fn.has("persistent_undo") == 1 then
  local undo_path = vim.fn.expand("~/.vim/undo")
  vim.o.undodir = undo_path
  vim.o.undofile = true
end

-- keymapping
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)
vim.api.nvim_set_keymap("i", "jK", "<ESC>", opts)
vim.api.nvim_set_keymap("i", "JK", "<ESC>", opts)
vim.api.nvim_set_keymap("i", "Jk", "<ESC>", opts)
vim.api.nvim_set_keymap("n", "H", "^", opts)
vim.api.nvim_set_keymap("n", "L", "$", opts)
vim.api.nvim_set_keymap("v", "H", "^", opts)
vim.api.nvim_set_keymap("v", "L", "$", opts)
vim.api.nvim_set_keymap("n", "<Leader>o", "o<Esc>", opts)
vim.api.nvim_set_keymap("n", "<Leader>O", "O<Esc>", opts)
vim.api.nvim_set_keymap("n", "<Leader>C", "v^c", opts)
vim.api.nvim_set_keymap("n", "<Leader>S", "v^s", opts)
vim.api.nvim_set_keymap("n", "<Leader>D", "v^d", opts)
vim.api.nvim_set_keymap("n", "<Leader>V", "v^", opts)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.api.nvim_set_keymap("n", "J", "10jzz", opts)
vim.api.nvim_set_keymap("n", "K", "10kzz", opts)
vim.api.nvim_set_keymap("v", "J", "10jzz", opts)
vim.api.nvim_set_keymap("v", "K", "10kzz", opts)
vim.api.nvim_set_keymap("n", "j", "gj", opts)
vim.api.nvim_set_keymap("n", "k", "gk", opts)
vim.api.nvim_set_keymap("n", "<c-x>", "<c-v>", opts)
vim.api.nvim_set_keymap("n", "ya", ":%y<CR>", opts)
vim.keymap.set("v", "v", "<C-v>", { noremap = true })

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

-- vim.g.clipboard = {
--   name = "OSC 52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--   },
--   paste = {
--     ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--   },
-- }
