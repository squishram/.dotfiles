-- available colorschemes - pick one!
return {

  {
    "ribru17/bamboo.nvim",
    lazy = false,
    name = "bamboo",
  },

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
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
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

  -- This is where you enable the colourscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
