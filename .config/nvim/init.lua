-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local colorscheme = "everforest"

-- set it boi
vim.cmd.colorscheme(colorscheme)
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
