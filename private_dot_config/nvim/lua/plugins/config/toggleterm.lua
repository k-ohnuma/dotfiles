local M = {}

local lazygit

function M.setup()
  require("toggleterm").setup({
    open_mapping = [[<c-t>]],
  })
end

function M.lazygit()
  if not lazygit then
    local Terminal = require("toggleterm.terminal").Terminal

    lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      on_close = function()
        vim.cmd("startinsert!")
      end,
    })
  end

  lazygit:toggle()
end

return M
