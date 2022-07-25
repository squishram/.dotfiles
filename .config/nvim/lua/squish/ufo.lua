local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

vim.o.foldcolumn = '1'
-- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevel = 20
vim.o.foldlevelstart = -1
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- using treesitter as provider
ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})
