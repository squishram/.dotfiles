return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    -- use "build" version (stable version is too old)
    version = false,
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "diff",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "rust",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },

        modules = {},
        ignore_install = {},
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },

        -- with textobjects plugin
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["aa"] = { query = "@parameter.outer", desc = "Select parameter/ argument (inc. comma)" },
              ["ia"] = { query = "@parameter.inner", desc = "Select parameter/ argument (w/o comma)" },
              ["ai"] = { query = "@conditional.outer", desc = "Select conditional" },
              ["ii"] = { query = "@conditional.inner", desc = "Select conditional contents" },
              ["al"] = { query = "@loop.outer", desc = "Select loop" },
              ["il"] = { query = "@loop.inner", desc = "Select loop contents" },
              ["af"] = { query = "@function.outer", desc = "Select function" },
              ["if"] = { query = "@function.inner", desc = "Select function contents" },
              ["ac"] = { query = "@class.outer", desc = "Select class" },
              ["ic"] = { query = "@class.inner", desc = "Select class contents" },
            },
          },

          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },

          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
          },
        },
      })
    end,
  },

  {
    -- show function context
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "echasnovski/mini.ai" },
    event = { "BufReadPre", "BufNewFile" },
    opts = { mode = "cursor", max_lines = 3 },
  },

  {
    -- auto close HTML tags
    "windwp/nvim-ts-autotag",
    event = { "InsertEnter", "CmdlineEnter" },
    config = true,
  },

  {
    -- configuration of textobject access
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        },
      }
    end,
  },
}
