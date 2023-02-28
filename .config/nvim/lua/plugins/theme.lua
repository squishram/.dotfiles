-- available colorschemes - pick one!
return {

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = "kanagawa",
  },

  {
    "rafamadriz/neon",
    lazy = false,
    name = "neon",
  },

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
    "EdenEast/nightfox.nvim",
    lazy = false,
    name = "nightfox",
  },

  {
    "marko-cerovac/material.nvim",
    lazy = false,
    name = "material",
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
  },

  {
    "glepnir/zephyr-nvim",
    lazy = false,
    name = "zephyr",
  },

  {
    "theniceboy/nvim-deus",
    lazy = false,
    name = "deus",
  },

  {
    "Th3Whit3Wolf/one-nvim",
    lazy = false,
    name = "one",
  },

  {
    "andersevenrud/nordic.nvim",
    lazy = false,
    name = "nordic",
  },

  {
    "NTBBloodbath/doom-one.nvim",
    lazy = false,
    name = "doomone",
  },

  {
    "cpea2506/one_monokai.nvim",
    lazy = false,
    name = "monokai",
  },

  {
    "sam4llis/nvim-tundra",
    lazy = false,
    name = "tundra",
  },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
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
      colorscheme = "bluloco",
    },
  },
}
