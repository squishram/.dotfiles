return {
  {
    -- for development of quarto notebooks (qmd filetype)
    "quarto-dev/quarto-nvim",
    dev = false,
    -- lazy-load on quarto files
    ft = { "quarto" },
    dependencies = {
      "jmbuhr/otter.nvim",
      -- TODO: get this working in image.lua
      -- "3rd/image.nvim",
    },

    opts = {
      debug = false,
      closePreviewOnExit = true,

      lspFeatures = {
        enabled = true,
        languages = { "r", "python", "julia", "bash" },
        -- 'curly' or 'all'
        chunks = "curly",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },

      -- TODO: set the coderunner when molten/magma has been integrated
      codeRunner = {
        enabled = false,
        -- 'molten' or 'slime'
        default_method = "molten",
        -- takes precedence over `default_method`, e.g. { python = "molten" }
        ft_runners = {},
        -- filetypes which are never sent to a code runner
        never_run = { "yaml" },
      },

      keymap = {
        hover = "K",
        definition = "gd",
        rename = "<leader>rn",
        references = "gr",
      },
    },
  },

  {
    -- for LSP etc. in quarto code blocks
    "jmbuhr/otter.nvim",
    -- lazy-load on quarto files
    ft = { "quarto" },
    opts = {
      buffers = {
        set_filetype = true,
      },
    },

    -- init = function()
    --   require("otter").activate(
    --     -- table of embedded languages to look for (no default)
    --     { "python", "lua" },
    --     -- enable completion (default = true)
    --     true,
    --     -- enable diagnostics (default = true)
    --     true,
    --     -- treesitter query to look for embedded languages (uses injections if nil)
    --     nil
    --   )
    -- end,
  },
}
