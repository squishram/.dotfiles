-- available colorschemes - pick one!
return {

  {
    "neanias/everforest-nvim",
    lazy = false,
    name = "everforest",
  },

  {
    "sainnhe/edge",
    lazy = false,
    name = "edge",
  },

  {
    "sainnhe/sonokai",
    lazy = false,
    name = "sonokai",
  },

  {
    "Th3Whit3Wolf/one-nvim",
    lazy = false,
    name = "one",
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
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    opts = {
      style = "dark", -- "auto" | "dark" | "light"
      transparent = false,
      italics = true,
      terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
      guicursor = true,
    },
    name = "bluloco",
  },

  -- This is where you configure the colourscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "one_monokai",
    },
  },
}
