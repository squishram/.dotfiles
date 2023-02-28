return {
  "simrat39/rust-tools.nvim",
  ft = { ".rs", "rust" },

  keys = {
    {
      "<leader>rh",
      "<cmd> lua require('rust-tools').hover_actions.hover_actions<cr>",
      mode = "n",
      desc = "rust hover",
    },
    {
      "<leader>ra",
      "<cmd> lua require('rust-tools').code_action_group.code_action_group<cr>",
      mode = "n",
      desc = "rust code actions",
    },
  },
}
