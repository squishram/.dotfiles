local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
  return
end

neoclip.setup({
  history = 1000,
  -- enable_persistant_history = false,
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
  -- filter = nil,
  preview = true,
  default_register = {'"', '*', '+'},
  default_register_macros = 'q',
  enable_macro_history = true,
  content_spec_column = false,
  on_paste = {
    set_reg = true,
  },
  on_replay = {
    set_reg = false,
  },
  keys = {
    telescope = {
      i = {
        select = '<CR>',
        paste = '<c-p>',
        paste_behind = '<c-P>',
        replay = '<c-q>',
        custom = {},
      },
      n = {
        select = '<cr>',
        paste = 'p',
        paste_behind = 'P',
        replay = 'q',
        custom = {},
      },
    },
  },
})
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- open neoclip " register
keymap("n", '""', "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", opts)
keymap("n", "<leader>q", "<cmd>lua require('telescope').extensions.macroscope.default()<cr>", opts)
