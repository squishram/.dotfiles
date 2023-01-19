return {
  -- peek lines when using :<line_number> before pressing enter
  {
    "nacro90/numb.nvim",
    config = true,
  },

  -- neorg
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    config = true,
  },

  -- vimtex
  {
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
  },

  -- substitute with yanked objects
  {
    "gbprod/substitute.nvim",
    keys = {
      { "m", "<cmd>lua require('substitute').operator()<cr>", mode = "n" },
      { "mm", "<cmd>lua require('substitute').line()<cr>", mode = "n" },
      { "M", "<cmd>lua require('substitute').eol()<cr>", mode = "n" },
      { "m", "<cmd>lua require('substitute').visual()<cr>", mode = "x" },
    },
  },

  -- better <C-a> (for dates, true/false, etc), init on <C-a>
  {
    "monaqa/dial.nvim",
    keys = { "<C-a>", { "<C-x>", mode = "n" } },
  },

  -- -- easier focus
  -- {
  --   "Pocco81/true-zen.nvim",
  --   -- keys = { "<leader>we", "<cmd>lua require('true-zen').ataraxis", mode = "n" },
  --   keys = { "<leader>we", "<cmd>lua require('true-zen').ataraxis", mode = "n" },
  --   config = true,
  -- },

  -- -- required for bettter folding
  -- { "kevinhwang91/promise-async" },

  -- -- better folding
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   keys = {
  --     { "zO", "<cmd>lua require('ufo').openAllFolds<cr>", mode = "n" },
  --     { "zM", "<cmd>lua require('ufo').closeAllFolds<cr>", mode = "n" },
  --     { "zo", "<cmd>lua require('ufo').openFoldsExceptKinds<cr>", mode = "n" },
  --     { "zm", "<cmd>lua require('ufo').closeFoldsWith<cr>", mode = "n" },
  --   },
  --   opts = {
  --     provider_selector = function(bufnr, filetype, buftype)
  --       return { "treesitter", "indent" }
  --     end,
  --   },
  -- },
}
