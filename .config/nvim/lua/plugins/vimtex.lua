return {

  -- vimtex
  "lervag/vimtex",

  init = function()
    vim.cmd("filetype plugin indent on")
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_log_ignore = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }
  end,
}
