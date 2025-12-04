local function attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "vs", api.node.open.vertical, opts("Open vertical"))
end

require("nvim-tree").setup({
  filters = {
    custom = {
      "^\\.git$",
      "^node_modules$",
      "^cdk\\.out$",
      "^\\.storage$",
    },
  },
  git = {
    ignore = false,
  },
  view = { adaptive_size = true },
  on_attach = attach,
})
