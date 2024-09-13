return {
  -- helps to remember keymaps by bringing up a cheatsheet
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").add({
      { "<leader><tab>", group = "tabs" },
      { "<leader>c", group = "code" },
      { "<leader>f", group = "file/find" },
      { "<leader>g", group = "git" },
      { "<leader>gh", group = "hunks" },
      { "<leader>n", group = "notifications" },
      { "<leader>o", group = "markdown" },
      { "<leader>q", group = "quit/session" },
      { "<leader>r", group = "REPL" },
      { "<leader>u", group = "ui" },
      { "<leader>w", group = "windows" },
      { "<leader>x", group = "diagnostics/quickfix" },
      { "<localLeader>l", group = "vimtex" },
      { "[", group = "prev" },
      { "]", group = "next" },
      { "g", group = "goto" },
      { "gs", group = "surround" },
    })
  end,
}
