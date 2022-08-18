local status_ok, eyeliner = pcall(require, "eyeliner")
if not status_ok then
    return
end

eyeliner.setup {
    highlight_on_key = false
}

vim.api.nvim_create_autocmd(
    'ColorScheme', {
        pattern = '*',
        callback = function()
            vim.api.nvim_set_hl(1, 'EyelinerPrimary', { bold = true, underline = true })
        end,
    }
)
