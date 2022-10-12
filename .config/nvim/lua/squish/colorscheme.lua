-- Options:
-- kanagawa
-- catppuccin
-- everforest
-- gruvbox-material
-- onenord
-- rose-pine
-- neon

-- This will try to implement the colorscheme of your choice
-- But won't throw a hissy if it isn't available
local colorscheme = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

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

local status_ok, tundra = pcall(require, "tundra")
if not status_ok then
  return
end

tundra.setup({
  transparent_background = false,
  editor = {
    search = {},
    substitute = {},
  },
  syntax = {
    booleans = { bold = true, italic = true },
    comments = { bold = true, italic = true },
    conditionals = {},
    constants = { bold = true },
    functions = {},
    keywords = {},
    loops = {},
    numbers = { bold = true },
    operators = { bold = true },
    punctuation = {},
    strings = {},
    types = { italic = true },
  },
  diagnostics = {
    errors = {},
    warnings = {},
    information = {},
    hints = {},
  },
  plugins = {
    lsp = true,
    treesitter = true,
    cmp = true,
    context = true,
    dbui = true,
    gitsigns = true,
    telescope = true,
  },
  overwrite = {
    colors = {},
    highlights = {},
  },
})

vim.opt.background = 'dark'
vim.cmd('colorscheme tundra')
