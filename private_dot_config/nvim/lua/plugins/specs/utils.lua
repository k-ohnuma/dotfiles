local function pick_notes()
  local nb = require("plugins.config.utils.nb")
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

local function grep_notes()
  local Snacks = require("snacks")
  Snacks.picker.grep({
    dirs = { "~/.nb/" },
  })
end

return {
  {
    "voldikss/vim-translator",
    cmd = { "Translate", "TranslateH", "TranslateL", "TranslateR", "TranslateW", "TranslateX" },
    init = function()
      vim.g.translator_target_lang = "ja"
      vim.g.translator_default_engines = { "google" }
    end,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    event = "BufRead",
    config = function()
      require("plugins.config.utils.no-neck-pain")
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },
  {
    "toppair/peek.nvim",
    event = "BufRead",
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      image = {
        enabled = true,
        doc = {
          enabled = true,
          inline = true,
        },
      },
      picker = {
        enabled = true,
      },
    },
    keys = {
      {
        "<C-p>",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files (Snacks)",
      },
      {
        "<C-g>",
        function()
          Snacks.picker.grep()
        end,
        desc = "Live Grep (Snacks)",
      },
      {
        "<C-@>",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers (Snacks)",
      },
      { "<leader>np", pick_notes, desc = "nb picker" },
      { "<leader>ng", grep_notes, desc = "nb grep" },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        -- 保存先をカレントディレクトリに
        dir_path = function()
          return vim.fn.getcwd()
        end, -- "." でもOK
        extension = "png",
        file_name = "%Y-%m-%d-%H-%M-%S",
        prompt_for_file_name = false,

        -- 何も挿入しない
        template = "",
        use_cursor_in_template = false,
        insert_template_after_cursor = false,
        insert_mode_after_paste = false,

        -- URLダウンロード等は不要なら切る
        download_images = false,
      },
    },
    keys = {
      { "<leader>z", "<cmd>PasteImage<cr>", desc = "Save clipboard image to cwd" },
    },
  },
}
