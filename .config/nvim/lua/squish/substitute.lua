local status_ok, substitute = pcall(require, "substitute")
if not status_ok then
  return
end

substitute.setup({
  yank_substitued_text = true
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- substitute keymaps
keymap("n", "m", "<cmd>lua require('substitute').operator()<cr>", opts)
keymap("n", "mm", "<cmd>lua require('substitute').line()<cr>", opts)
keymap("n", "M", "<cmd>lua require('substitute').eol()<cr>", opts)
keymap("x", "m", "<cmd>lua require('substitute').visual()<cr>", opts)
