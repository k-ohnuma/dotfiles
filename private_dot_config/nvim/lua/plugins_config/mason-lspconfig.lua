require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer", "ts_ls" },
  automatic_enable = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = { cargo = { features = "all" } },
  },
  on_attach = function(_, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
})

vim.lsp.config("ts_ls", {
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  settings = {
    diagnostics = { ignoredCodes = { 6133 } },
    completions = { completeFunctionCalls = true },
  },
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      },
    }
  },
})
