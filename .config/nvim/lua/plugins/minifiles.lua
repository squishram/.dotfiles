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
      -- Disabled by default in LazyVim because neo-tree is used for that
      use_as_default_explorer = false,
    },
  },

  keys = {
    {
      "-",
      function()
        require("mini.files").open()
      end,
      desc = "Open Filetree",
    },
  },
}
