if not vim.o.loadplugins then
  dofile(vim.fn.stdpath("config") .. "/vanilla_init.lua")
  return
end

vim.g.mapleader = " "
vim.o.encoding = "utf-8"
vim.scriptencoding = "utf-8"

require("config.options")
require("config.autocmds")
require("config.lazy")
require("config.keymaps")
vim.cmd([[colorscheme catppuccin]])
