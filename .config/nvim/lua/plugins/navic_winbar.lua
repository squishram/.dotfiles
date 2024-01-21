return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
}

-- return {
--   "SmiteshP/nvim-navic",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--     "neovim/nvim-lspconfig",
--   },
--   opts = {
--     lsp = {
--       auto_attach = true,
--     },
--     highlight = true,
--     icon = "  ",
--     click = true,
--   },
-- }
