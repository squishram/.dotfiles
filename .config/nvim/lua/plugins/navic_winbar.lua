-- NOTE: Switch to dropbar when we get neovim 0.10

return {
  "Bekaboo/dropbar.nvim",
  name = "dropbar",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    "<leader>e",
    "<cmd>require('dropbar.api').pick()<cr>",
    silent = true,
    desc = "open dropbar",
  },
  config = true,
}
