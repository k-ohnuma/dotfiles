require("mason-null-ls").setup({
  ensure_installed = { "prettier", "stylua" },
  handlers = {},
})

local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

null_ls.setup({
  sources = {
    -- null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
  },
  debug = false,
})
