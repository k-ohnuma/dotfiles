if not vim.o.loadplugins then
  dofile(vim.fn.stdpath("config") .. "/vanilla_init.lua")
  return
end

vim.g.mapleader = " "
vim.o.encoding = "utf-8"
vim.scriptencoding = "utf-8"

require("core.options")
require("core.autocmds")
require("core.lazy")
require("core.keymaps")
vim.cmd([[colorscheme catppuccin]])
