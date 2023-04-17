-- available colorschemes - pick one!
return {

  {
    "neanias/everforest-nvim",
    lazy = false,
    name = "everforest",
  },

  {
    "cpea2506/one_monokai.nvim",
    lazy = false,
    name = "monokai",
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    name = "gruvbox",
  },

  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    name = "onedarkpro",
    opts = {
      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "italic",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "italic",
        virtual_text = "NONE",
      },
    },
  },

  -- This is where you configure the colourscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "one_monokai",
      -- colorscheme = function()
      --   require("one_monokai").load()
      -- end,
    },
  },
}
