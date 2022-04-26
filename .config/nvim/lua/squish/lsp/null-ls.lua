local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    -- formatters
    ---- python
    formatting.black.with { extra_args = { "--fast" } },
    -- formatting.yapf.with { extra_args = { "--fast" } },
    ---- lua
    formatting.stylua,
    -- linters
    ---- python
    diagnostics.flake8,
  },
})

-- keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- run formatter from null-ls
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- keymap("n", "<leader>lf", "Format<CR>", opts)
