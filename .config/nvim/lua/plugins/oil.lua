return {
  -- file manager plugin for nvim
  "stevearc/oil.nvim",
  opts = {},
  keys = { { "<leader>o", "<cmd>lua require('oil').open()<cr>", desc = "toggle split/join" } },

  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
