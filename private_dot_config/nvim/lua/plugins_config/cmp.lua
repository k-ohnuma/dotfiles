local cmp = require("cmp")
cmp.setup({
  preselect = true,
    completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },      -- from language server
    -- { name = "copilot" }, --copilotを補完ソースに追加する
    { name = 'vsnip' },         -- nvim-cmp source for vim-vsnip 
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'calc'},   
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'path' },                              -- file paths
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.confirm { select = true },
  }),
  -- experimental = {
  --   ghost_text = true,
  -- },
})

