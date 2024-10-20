vim.o.shell = "/usr/bin/fish"
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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.list = true
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
