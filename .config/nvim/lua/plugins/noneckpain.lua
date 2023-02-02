return {
  "shortcuts/no-neck-pain.nvim",
  opts = {
    buffers = {
      scratchPad = {
        -- set to `false` to disable auto-saving
        enabled = false,
        -- set to `nil` to default to current working directory
        -- or a string to set a directory
        location = nil,
      },
      bo = {
        filetype = "md",
      },
    },
  },
}
