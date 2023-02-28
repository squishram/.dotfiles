return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  ft = "norg",
  keys = {
    { "<leader>no", ":Neorg workspace notes<CR>", mode = "n", desc = "open notes index file" },
    { "<leader>nr", ":Neorg return<CR>", mode = "n", desc = "closes all open norg buffers" },
    { "<leader>ni", ":Neorg index<CR>", mode = "n", desc = "open the index for the current Neorg workspace" },
  },
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            notes = "~/documents/notes/",
          },
          default_workspace = "notes",
        },
      },
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" } },
}
