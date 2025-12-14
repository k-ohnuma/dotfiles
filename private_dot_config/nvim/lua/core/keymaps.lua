local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- ── def settings ────────────────────────────────────────────────────
keymap("i", "jk", "<Esc>", opts)
keymap("i", "jK", "<Esc>", opts)
keymap("i", "JK", "<Esc>", opts)
keymap("i", "Jk", "<Esc>", opts)
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)
keymap("n", "<Leader>o", "o<Esc>", opts)
keymap("n", "<Leader>O", "O<Esc>", opts)
keymap("n", "<Leader>C", "v^c", opts)
keymap("n", "<Leader>S", "v^s", opts)
keymap("n", "<Leader>D", "v^d", opts)
keymap("n", "<Leader>V", "v^", opts)
keymap("t", "<Esc><Esc>", "<C-\\><C-n>")
keymap("n", "J", "10jzz", opts)
keymap("n", "K", "10kzz", opts)
keymap("v", "J", "10jzz", opts)
keymap("v", "K", "10kzz", opts)
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "ya", ":%y<CR>", opts)
keymap("v", "v", "<C-v>", opts)
keymap("n", "<Tab>", "<Nop>", opts)
keymap("n", "<C-i>", "<Nop>", opts)

-- ── nvim-tree ─────────────────────────────────────────────────
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- ── replace ───────────────────────────────────────────────────
keymap("n", "_", "<Plug>(operator-replace)", opts)

-- ── winresizer ────────────────────────────────────────────────
vim.g.winrezier_start_key = "<C-s>"
keymap("n", "<C-s>", ":WinResizerStartResize<CR>", opts)

-- ── gitsigns ──────────────────────────────────────────────────
local gs = require("gitsigns")
keymap("n", "<Leader>ph", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<Leader>nh", ":Gitsigns next_hunk<CR>", opts)
keymap("v", "<Leader>sh", function()
  gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, opts)
keymap("v", "<Leader>rh", function()
  gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, opts)

-- ── telescope ────────────────────────────────────────────────
-- keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
-- keymap("n", "<C-g>", "<cmd>Telescope live_grep<CR>", opts)

-- ── barbar ────────────────────────────────────────────────────
keymap("n", "<C-y>", ":BufferPrevious<CR>", opts)
keymap("n", "<C-u>", ":BufferNext<CR>", opts)
keymap("n", "<Leader>bo", ":BufferCloseAllButCurrent<CR>", opts)

-- ── lspsaga ──────────────────────────────────────────────────
keymap("n", "<Leader>t", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
keymap("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
keymap("n", "sagat", "<cmd>Lspsaga term_toggle<CR>", opts)
keymap("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "g[", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "g]", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

-- ── hlslens ─────────────────────────────────────────────────────────
keymap("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zz]], opts)
keymap("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zz]], opts)
keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
keymap("n", "<Esc><Esc>", "<Cmd>noh<CR>", opts)

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

-- ── comment-box ─────────────────────────────────────────────────────
keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBllbox<CR>", opts)
keymap({ "n", "v" }, "<Leader>cl", "<Cmd>CBllline<CR>", opts)

-- ── auto-pairs ──────────────────────────────────────────────────────

keymap("i", "<CR>", "v:lua.require('nvim-autopairs').autopairs_cr()", { expr = true, noremap = true })
keymap("i", "<S-CR>", "<CR>", opts)
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
  check_ts = true,
})

npairs.add_rules({
  Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(function(optsin)
    return optsin.char == ">"
  end),
})

-- ── diffview ─────────────────────────────────────────────────
keymap("n", "<Leader>dfo", "<cmd>DiffviewFileHistory<CR>", opts)
keymap("n", "<Leader>dfc", "<cmd>DiffviewClose<CR>", opts)

-- ── vim-operator-convert-case ────────────────────────────────
keymap("n", "<Leader>cu", "<Plug>(operator-convert-case-lower-camel)")
keymap("n", "<Leader>cU", "<Plug>(operator-convert-case-upper-camel)")
keymap("n", "<Leader>su", "<Plug>(operator-convert-case-lower-snake)")
keymap("n", "<Leader>sU", "<Plug>(operator-convert-case-upper-snake)")

-- ── git messenger ─────────────────────────────────────────────
vim.g.git_messenger_no_default_mappings = true
keymap("n", "<Leader>ms", "<cmd>GitMessenger<CR>", opts)

-- ── no-neck-pain ─────────────────────────────────────────────
-- keymap("n", "<Leader>np", "<cmd>NoNeckPain<CR>", opts)

