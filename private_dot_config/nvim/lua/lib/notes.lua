local M = {}

function M.pick_notes()
  local nb = require("lib.nb")
  local Snacks = require("snacks")
  local items = nb.list_items()

  if not items or #items == 0 then
    vim.notify("No notes found", vim.log.levels.WARN)
    return
  end

  Snacks.picker({
    title = "nb Notes",
    items = items,
    format = function(item)
      return { { item.text } }
    end,
    preview = function(ctx)
      local item = ctx.item
      if not item.file then
        item.file = nb.get_note_path(item.note_id)
      end
      return Snacks.picker.preview.file(ctx)
    end,
    confirm = function(picker, item)
      picker:close()
      if item then
        vim.cmd.edit(nb.get_note_path(item.note_id))
      end
    end,
  })
end

function M.grep_notes()
  local Snacks = require("snacks")
  Snacks.picker.grep({
    dirs = { "~/.nb/" },
  })
end

return M
