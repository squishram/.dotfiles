return {
  "mfussenegger/nvim-lint",

  -- Lazy load event to trigger linters
  event = {
    "BufWritePost",
    "BufReadPost",
    "InsertLeave",
  },

  -- autocommand to activate linting
  config = function()
    local lint = require("lint")

    -- activate linter
    lint.events = {
      "BufWritePost",
    }

    -- linters by filetype
    lint.linters_by_ft = {
      python = { "ruff" },
      markdown = { "markdownlint" },
      shell = { "shellcheck" },
      -- ['*'] = { 'global linter' },
      -- ['_'] = { 'fallback linter' },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
