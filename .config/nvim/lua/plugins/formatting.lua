return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  event = { "BufWritePre" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          lsp_fallback = true,
          formatters = { "injected" },
        })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },

  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },

    format = {
      timeout_ms = 3000,
      -- DONT change these next two!
      async = false,
      quiet = false,
    },

    formatters_by_ft = {
      python = { "black", "isort" },
      markdown = { "markdownlint" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      shell = { "shfmt" },
      lua = { "stylua" },
    },
  },
}
