local plugins = {}

local function extend(module)
  vim.list_extend(plugins, require(module))
end

extend("plugins.colorscheme")
extend("plugins.coding")
extend("plugins.editor")
extend("plugins.git")
extend("plugins.lsp")
extend("plugins.navigation")
extend("plugins.ui")
extend("plugins.writing")

return plugins
