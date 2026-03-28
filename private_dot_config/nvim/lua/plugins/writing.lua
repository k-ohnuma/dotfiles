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
    "toppair/peek.nvim",
    event = "BufRead",
    build = "deno task --quiet build:fast",
    config = function()
      require("plugins.config.peek")
    end,
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
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.config.render-markdown")
    end,
  },
  {
    "k-ohnuma/md-accordion.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.config.md-accordion")
    end,
  },
}
