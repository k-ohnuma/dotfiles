local function attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "vs", api.node.open.vertical, opts("Open vertical"))
end

local function natural_cmp(a, b)
  if a.type ~= "directory" and b.type == "directory" then
    return false
  end
  if a.type == "directory" and b.type ~= "directory" then
    return true
  end

  local left = a.name:lower()
  local right = b.name:lower()
  if left == right then
    return false
  end

  for i = 1, math.max(#left, #right) do
    local l = left:sub(i)
    local r = right:sub(i)

    -- 先頭が数字同士なら、連続する数字を数値として比較
    if tonumber(l:sub(1, 1)) and tonumber(r:sub(1, 1)) then
      local ln = tonumber(l:match("^[0-9]+"))
      local rn = tonumber(r:match("^[0-9]+"))
      if ln ~= rn then
        return ln < rn
      end
    elseif l:sub(1, 1) ~= r:sub(1, 1) then
      return l < r
    end
  end
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
  sort_by = function(nodes)
    table.sort(nodes, natural_cmp)
  end,
})
