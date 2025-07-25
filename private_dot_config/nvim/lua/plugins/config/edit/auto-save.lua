require("auto-save").setup({
  enabled = true,
  execution_message = {
    message = function()
      return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
    end,
    dim = 0.18,
    cleaning_interval = 1000, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
  },
  trigger_events = { "InsertLeave" },
  condition = function(buf)
    local fn = vim.fn
    local utils = require("auto-save.utils.data")

    if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
      return true
    end
    return false
  end,
  write_all_buffers = false,
  debounce_delay = 135,
  callbacks = {
    enabling = nil,
    disabling = nil,
    before_asserting_save = nil,
    before_saving = nil,
    after_saving = nil,
  },
})
