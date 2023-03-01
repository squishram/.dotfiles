return {
  "shortcuts/no-neck-pain.nvim",
  keys = { "<leader>np", ":NoNeckPain<CR>", mode = "n" },
  opts = {
    buffers = {
      scratchPad = {
        -- set to `false` to disable auto-saving
        enabled = true,
        -- set to `nil` to default to current working directory
        -- or a string to set a directory
        location = "./notes",
      },
      bo = {
        filetype = "norg",
      },
    },
  },
}