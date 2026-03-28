require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome" },
    typescript = { "biome" },
    javascriptreact = { "biome" },
    typescriptreact = { "biome" },
    json = { "biome" },
    yaml = { "yamlfmt" },
    markdown = { "prettier" },
    toml = { "taplo" },
  },
})

vim.keymap.set("n", "<leader>;", function()
  require("conform").format({
    timeout_ms = 3000,
    lsp_fallback = true,
  })
end)
