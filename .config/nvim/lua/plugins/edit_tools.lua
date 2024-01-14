return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },


    -- for some reason this needs a table-of-tables to work
    -- despite having only one entry(?)
    keys = {
      {
        "g,",
        "<cmd>lua require('treesj').toggle()<cr>",
        silent = true,
        desc = "toggle split/join",
      }
    },
  },

  {
    -- peek lines when using :<line_number> before pressing enter
    {
      "nacro90/numb.nvim",
      config = true,
    },
  },
}
