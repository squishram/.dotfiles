return {
  "Wansmer/treesj",
  keys = { { "g,", "<cmd>lua require('treesj').toggle()<cr>", silent = true, desc = "toggle split/join" } },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = true,
}
