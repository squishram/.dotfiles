return {
  {
    -- disable illuminate
    "RRethy/vim-illuminate",
    enabled = false,
  },

  {
    -- enable local-highlight (it's faster)
    "tzachar/local-highlight.nvim",
    lazy = false,
    config = function()
      require("local-highlight").setup({
        file_types = {
          "python",
          "lua",
          "tex",
          "norg",
          "markdown",
          "rust",
        },
      })
    end,
  },
}
