return {
  "echasnovski/mini.files",
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 50,
    },
    options = {
      -- Whether to use for editing directories
      use_as_default_explorer = true,
    },
  },

  keys = {
    {
      "-",
      function()
        require("mini.files").open()
      end,
      silent = true,
      desc = "Open Filetree",
    },
  },
}
