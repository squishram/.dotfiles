-- these plugins are either not working or benched
if true then
  return {}
end

return {

  -- -- easier focus
  -- {
  --   "Pocco81/true-zen.nvim",
  --   -- keys = { "<leader>we", "<cmd>lua require('true-zen').ataraxis", mode = "n" },
  --   keys = { "<leader>we", "<cmd>lua require('true-zen').ataraxis", mode = "n" },
  --   config = true,
  -- },

  -- -- required for bettter folding
  -- { "kevinhwang91/promise-async" },

  -- -- better folding
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   keys = {
  --     { "zO", "<cmd>lua require('ufo').openAllFolds<cr>", mode = "n" },
  --     { "zM", "<cmd>lua require('ufo').closeAllFolds<cr>", mode = "n" },
  --     { "zo", "<cmd>lua require('ufo').openFoldsExceptKinds<cr>", mode = "n" },
  --     { "zm", "<cmd>lua require('ufo').closeFoldsWith<cr>", mode = "n" },
  --   },
  --   opts = {
  --     provider_selector = function(bufnr, filetype, buftype)
  --       return { "treesitter", "indent" }
  --     end,
  --   },
  -- },
}
