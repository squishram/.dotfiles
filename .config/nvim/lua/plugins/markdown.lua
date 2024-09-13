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
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org" },
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
      render_modes = { "n", "i", "c" },
    },
  },

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
