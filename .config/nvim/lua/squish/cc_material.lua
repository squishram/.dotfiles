local status_ok, material_colourscheme = pcall(require, "material")
if not status_ok then
    return
end

-- vim.g.material_style = "darker"
-- vim.g.material_style = "lighter"
vim.g.material_style = "oceanic"
-- vim.g.material_style = "palenight"
-- vim.g.material_style = "deep ocean"

material_colourscheme.setup({
    contrast = {
        terminal = false,
        sidebars = false,
        cursor_line = false,
        floating_windows = false,
        non_current_windows = false,
        filetypes = {}
    },
    styles = {
        comments = {},
        strings = {},
        keywords = {},
        functions = {},
        variables = {},
        operators = {},
        types = {},
    },
    plugins = {},
    disable = {
        colored_cursor = false,
        borders = false,
        background = false,
        term_colors = false,
        eob_lines = false
    },
    high_visibility = {
        lighter = false,
        darker = false,
    },
    lualine_style = "default",
    custom_colors = nil,
    custom_highlights = {},
    async_loading = true,
})


