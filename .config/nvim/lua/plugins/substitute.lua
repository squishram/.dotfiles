return {
  -- substitute with yanked objects
  {
    "gbprod/substitute.nvim",
    keys = {
      { "m", "<cmd>lua require('substitute').operator()<cr>", mode = "n" },
      { "mm", "<cmd>lua require('substitute').line()<cr>", mode = "n" },
      { "M", "<cmd>lua require('substitute').eol()<cr>", mode = "n" },
      { "m", "<cmd>lua require('substitute').visual()<cr>", mode = "x" },
    },
  },
}
