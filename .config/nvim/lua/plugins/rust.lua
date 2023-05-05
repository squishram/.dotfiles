return {

  {
    -- rust tools
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",

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
  },

  {
    -- rust crates plugin
    "Saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      require("crates").setup(opts)
      require("crates").show()
    end,
  },
}
