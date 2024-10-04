return {
  "williamboman/mason.nvim",
  config = function()
    require('mason').setup({
      ensure_installed = {
        "rust-analyzer"
      }
    })
  end
}
