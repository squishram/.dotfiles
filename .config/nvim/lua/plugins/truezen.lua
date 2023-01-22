-- zen mode for easier reading of code and text
return {
  {
    "Pocco81/true-zen.nvim",
    keys = {
      { "<leader>v", "<cmd>lua require('true-zen.ataraxis').toggle()<cr>", mode = "n" },
    },
  },
}
