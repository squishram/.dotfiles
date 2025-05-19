return {
  "echasnovski/mini.move",
  version = "*",

  -- lazy-load on use
  keys = {
    { "<M-h>" },
    { "<M-l>" },
    { "<M-j>" },
    { "<M-k>" },
  },

  opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Visual mode
      left = "<M-h>",
      right = "<M-l>",
      down = "<M-j>",
      up = "<M-k>",

      -- Normal mode
      line_left = "<M-h>",
      line_right = "<M-l>",
      line_down = "<M-j>",
      line_up = "<M-k>",
    },
  },
}
