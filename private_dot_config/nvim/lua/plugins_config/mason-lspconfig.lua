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

require('mason-null-ls').setup({
    ensure_installed = { 'rustfmt' },
    handlers = {},
})

local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.rustfmt,
    },
    debug = false,
})

