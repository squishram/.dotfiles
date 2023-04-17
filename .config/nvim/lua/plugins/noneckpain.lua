return {
  "shortcuts/no-neck-pain.nvim",
  keys = { { "<leader>np", "<cmd>NoNeckPain<cr>", desc = "Centre the buffer" } },
  opts = {
    buffers = {
      scratchPad = {
        -- set to `false` to disable auto-saving
        enabled = true,
        -- set to `nil` for cwd, or a string to set a directory
        location = "./scratchpad",
      },
      bo = {
        -- filetype of scratchpad notes
        filetype = "norg",
      },
    },
  },
}
