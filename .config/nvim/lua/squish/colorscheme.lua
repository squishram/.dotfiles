-- transparent background(Default: false)
vim.g.transparent_background = false
-- italic comments(Default: true)
vim.g.italic_comments = true
-- italic keywords(Default: true)
vim.g.italic_keywords = true
-- italic functions(Default: false)
vim.g.italic_functions = true
-- italic variables(Default: false)
vim.g.italic_variables = true

-- This will try to implement the colorscheme of your choice
-- But won't throw a hissy if it isn't available
-- everforest
-- tundra
-- material
-- catppuccin
-- zephyr
-- gruvbox
-- rose-pine
local colorscheme = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    vim.cmd "colorscheme default"
    return
end
