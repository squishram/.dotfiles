return {
  {
    "R-nvim/R.nvim",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "markdown", "markdown_inline", "r", "rnoweb" },
      })
    end,
  },

  {
    "R-nvim/cmp-r",
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup({ sources = { { name = "cmp_r" } } })
      require("cmp_r").setup({})
    end,
  },
}
