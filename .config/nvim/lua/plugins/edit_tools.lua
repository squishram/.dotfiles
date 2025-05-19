return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },

    keys = {
      {
        "g,",
        "<cmd>lua require('treesj').toggle()<cr>",
        silent = true,
        desc = "toggle split/join",
      },
    },
  },

  {
    -- peek lines when using :<line_number> before pressing enter
    {
      "nacro90/numb.nvim",
      config = true,
    },
  },

  -- introduces a bunch of new operators:
  -- "gr" replace operator is like substitute
  -- try it now: these brackets need to contian the word "poop" [pee]
  -- "gx" swap operator lets you switch things
  -- try it now: this sentence is in the order wrong
  -- "gm" multiplier operator duplicates object
  -- try it now: "there's only one of me"
  -- "g=" evaluates a selection
  -- try it now: (1 + 12)
  {
    "echasnovski/mini.operators",
    version = false,
    config = true,
  },
}
