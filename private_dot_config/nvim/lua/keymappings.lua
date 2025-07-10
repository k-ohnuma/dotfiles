-- ── def settings ────────────────────────────────────────────────────
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
vim.api.nvim_set_keymap("n", "ya", ":%y<CR>", opts)
vim.keymap.set("v", "v", "<C-v>", { noremap = true })

-- ── nvim-tree ───────────────────────────────────────────────────────
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- ── none-ls ─────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>;", function()
  vim.lsp.buf.format({ async = true })
end)

-- ── trouble ─────────────────────────────────────────────────────────
vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>Trouble diagnostics toggle<cr>", { noremap = true, silent = true })

-- ── replace ─────────────────────────────────────────────────────────
vim.api.nvim_set_keymap("n", "_", "<Plug>(operator-replace)", {})

-- ── winresizer ──────────────────────────────────────────────────────
vim.g.winrezier_start_key = "<C-s>"
vim.api.nvim_set_keymap("n", "<C-s>", ":WinResizerStartResize<CR>", opts)

-- ── gitsigns ────────────────────────────────────────────────────────
local keymap = vim.keymap.set
vim.api.nvim_set_keymap("n", "<Leader>ph", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>nh", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
local gitsigns = require("gitsigns")
keymap("v", "<leader>sh", function()
  gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
keymap("v", "<leader>rh", function()
  gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)

-- ── telescope ───────────────────────────────────────────────────────
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

-- ── barbar ──────────────────────────────────────────────────────────
vim.api.nvim_set_keymap("n", "<C-y>", ":BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-u>", ":BufferNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>bw", ":BufferClose<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>bo", ":BufferCloseAllButCurrent<CR>", opts)

-- ── lspsaga ─────────────────────────────────────────────────────────
vim.keymap.set("n", "<Leader>t", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
vim.keymap.set("n", "sagat", "<cmd>Lspsaga term_toggle<CR>")
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_prev<CR>")

-- ── hlslens ─────────────────────────────────────────────────────────
vim.api.nvim_set_keymap(
  "n",
  "n",
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zz]],
  opts
)
vim.api.nvim_set_keymap(
  "n",
  "N",
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zz]],
  opts
)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<Esc><Esc>", "<Cmd>noh<CR>", opts)

-- ── toggleterm(lazygit) ─────────────────────────────────────────────
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
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
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})
function _lazygit_toggle()
  lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

local floatterm = Terminal:new({
  cmd = "fish",
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})
function _floatterm_toggle()
  floatterm:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>lua _floatterm_toggle()<CR>", { noremap = true, silent = true })

-- ── copilot chat ────────────────────────────────────────────────────
function CopilotChatBuffer()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end
function ShowCopilotChatActionPrompt()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end
vim.api.nvim_set_keymap("n", "<leader>ccq", "<cmd>lua CopilotChatBuffer()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>ccp",
  "<cmd>lua ShowCopilotChatActionPrompt()<cr>",
  { noremap = true, silent = true }
)

-- ── comment-box ─────────────────────────────────────────────────────
local keymap = vim.keymap.set
keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBllbox<CR>", opts)
keymap({ "n", "v" }, "<Leader>cl", "<Cmd>CBllline<CR>", opts)

-- ── auto-pairs ──────────────────────────────────────────────────────

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.require('nvim-autopairs').autopairs_cr()", { expr = true, noremap = true })
vim.api.nvim_set_keymap("i", "<S-CR>", "<CR>", { noremap = true, silent = true })
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
  check_ts = true,
})

npairs.add_rules({
  Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(function(opts)
    return opts.char == ">"
  end),
})

-- ── diffview ────────────────────────────────────────────────────────
vim.api.nvim_set_keymap("n", "<Leader>dfo", "<cmd>DiffviewFileHistory<cr>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dfc", "<cmd>DiffviewClose<cr>", opts)

-- ── vim-operator-convet-case ────────────────────────────────────────
vim.api.nvim_set_keymap("n", "<Leader>cu", "<Plug>(operator-convert-case-lower-camel)", opts)
vim.api.nvim_set_keymap("n", "<Leader>cU", "<Plug>(operator-convert-case-upper-camel)", opts)
vim.api.nvim_set_keymap("n", "<Leader>su", "<Plug>(operator-convert-case-lower-snake)", opts)
vim.api.nvim_set_keymap("n", "<Leader>sU", "<Plug>(operator-convert-case-upper-snake)", opts)

-- ── git messenger ───────────────────────────────────────────────────
vim.api.nvim_set_keymap("n", "<Leader>ms", "<cmd>GitMessenger<cr>", opts)
vim.g.git_messenger_no_default_mappings = true
