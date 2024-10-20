local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  -- custom mappings
  vim.keymap.set("n", "vs", api.node.open.vertical, opts("Open vertical"))
end

require("nvim-tree").setup({
  filters = {
    enable = false,
  },
  view = { adaptive_size = true },
  on_attach = my_on_attach,
})
