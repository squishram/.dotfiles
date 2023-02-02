return {

  -- vimtex
  "lervag/vimtex",

  init = function()
    vim.cmd("filetype plugin indent on")
    vim.cmd("let g:vimtex_view_method = 'zathura'")
    vim.cmd("let g:vimtex_quickfix_mode=0")
    vim.cmd("let g:vimtex_context_pdf_viewer = 1")
    vim.cmd("let g:vimtex_context_pdf_viewer = 'okular'")
    vim.cmd(
      "let g:vimtex_log_ignore = ['Underfull', 'Overfull', 'specifier changed to', 'Token not allowed in a PDF string']"
    )
  end,
}
