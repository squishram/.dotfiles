return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdownlint", "marksman" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  {
    "OXY2DEV/markview.nvim",
    -- don't lazy-load this guy!
    lazy = false,

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      require("markview").setup({
        -- Buffer types to ignore
        buf_ignore = { "nofile" },
        -- Delay, in miliseconds
        -- to wait before a redraw occurs (after an event is triggered)
        debounce = 50,
        -- Filetypes where the plugin is enabled
        filetypes = { "markdown", "quarto", "rmd" },
        -- Highlight groups to use
        -- "dynamic" | "light" | "dark"
        highlight_groups = "dynamic",
        -- Modes where hybrid mode is enabled
        hybrid_modes = nil,
        -- Tree-sitter query injections
        injections = {},
        -- Initial plugin state: true = show preview; false = don't
        initial_state = true,
        -- Max file size that is rendered entirely
        max_file_length = 1000,
        -- Modes where preview is shown
        -- modes = { "n", "no", "c" },
        modes = { "n", "c" },
        -- Lines from the cursor to draw when the
        -- file is too big
        render_distance = 100,
        -- Window configuration for split view
        split_conf = {},
        options = {
          on_enable = {
            conceallevel = 2,
            concealcursor = "",
          },
          on_disable = {
            conceallevel = 0,
            concealcursor = "",
          },
        },

        -- Rendering configuration
        -- nerd, legacy
        checkboxes = require("markview.presets").checkboxes.nerd,
        -- glow, glow_center, slanted, arrow, simple, marker
        headings = require("markview.presets").headings.marker,
        -- thin, thick, double, dashed, dotted, solid, arrowed
        horizontal_rules = require("markview.presets").horizontal_rules.thin,
        -- block_quotes = {},
        -- callbacks = {},
        -- code_blocks = {},
        -- escaped = {},
        -- footnotes = {},
        -- html = {},
        -- inline_codes = {},
        -- latex = {},
        -- links = {},
        -- list_items = {},
        -- tables = {},
      })
    end,
  },

  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   ft = { "markdown", "norg", "rmd", "org" },
  --   opts = {
  --     file_types = { "markdown", "norg", "rmd", "org" },
  --     render_modes = { "n", "i", "c" },
  --   },
  -- },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters = {
        markdownlint = {
          args = {
            { "--disable", "MD013", "--" },
            { "--disable", "MD014", "--" },
            { "--disable", "MD029", "--" },
          },
        },
      }
    end,
  },
}
