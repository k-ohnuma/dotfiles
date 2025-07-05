-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true })

require("mason-lspconfig").setup_handlers({
  function(server)
    local opt = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
    require("lspconfig")[server].setup(opt)
  end,
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
  function(server)
    local opt = {
      capabilities = capabilities,
    }
    require("lspconfig")[server].setup({ opt })
  end,
})

lspconfig.rust_analyzer.setup({
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true)
  end,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        features = "all",
      },
    },
  },
})

require("mason-null-ls").setup({
  ensure_installed = { "rustfmt" },
  handlers = {},
})

local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.rustfmt,
  },
  debug = false,
})

local ts_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
end

lspconfig.ts_ls.setup({
  on_init = function(client, initialization_result)
    if client.server_capabilities then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.semanticTokensProvider = false -- turn off semantic tokens
    end
  end,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  settings = {
    diagnostics = { ignoredCodes = { 6133 } },
    completions = {
      completeFunctionCalls = true,
    },
  },
  on_attach = ts_attach,
})
