-- This is necessary for VimTeX to load properly. The "indent" is optional.
-- Note that most plugin managers will do this automatically.
vim.cmd "filetype plugin indent on"

-- Ignore mappings
-- vim.cmd "let g:vimtex_mappings_enabled = 0"

-- Viewer options
-- either specify a built-in viewer method:
vim.cmd "let g:vimtex_view_method = 'zathura'"
vim.cmd "let g:vimtex_quickfix_mode=0"
-- or a generic interface:
-- vim.cmd "let g:vimtex_view_general_viewer = 'okular'"

-- context viewer is ocular
vim.cmd "let g:vimtex_context_pdf_viewer = 1"
vim.cmd "let g:vimtex_context_pdf_viewer = 'okular'"

-- VimTeX uses latexmk as the default compiler backend. If you use it, which is
-- strongly recommended, you probably don't need to configure anything. If you
-- want another compiler backend, you can change it as follows. The list of
-- supported backends and further explanation is provided in the documentation,
-- see ":help vimtex-compiler".
-- vim.cmd "let g:vimtex_compiler_method = 'latexrun'"

-- ignore these silly boi errors
vim.cmd "let g:vimtex_log_ignore = ['Underfull', 'Overfull', 'specifier changed to', 'Token not allowed in a PDF string']"
