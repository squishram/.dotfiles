return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",

    keys = {
      { "<leader>hl", ":BufferLineMoveNext<CR>", mode = "n", silent = true },
      { "<leader>lh", ":BufferLineMovePrev<CR>", mode = "n", silent = true },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },

    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },

    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd("BufAdd", {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },

  -- {
  --   -- quickhop buffer menu
  --   "leath-dub/snipe.nvim",
  --   keys = {
  --     {
  --       "<leader>s",
  --       function()
  --         require("snipe").open_buffer_menu()
  --       end,
  --       desc = "Open Snipe buffer menu",
  --     },
  --   },
  --   opts = {},
  -- },
}
