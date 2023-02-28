return {
  "abeleinin/papyrus",
  ft = "md",
  keys = {
    { "<leader>pc", ":PapyrusCompile<CR>", mode = "n" },
    { "<leader>pa", ":PapyrusAutoCompile<CR>", mode = "n" },
    { "<leader>pv", ":PapyrusView<CR>", mode = "n" },
    { "<leader>ps", ":PapyrusStart<CR>", mode = "n" },
  },
  init = function()
    vim.cmd("let g:papyrus_latex_engine = 'pdflatex'")
    vim.cmd("let g:papyrus_viewer = 'zathura'")
  end,
}
