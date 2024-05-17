return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      {
        "folke/neodev.nvim",
        opts = {
          library = {
            plugins = { "nvim-dap-ui" },
            types = true,
          },
        },
      },
      -- "echasnovski/mini.pick",
      "ibhagwan/fzf-lua",
    },

    config = function()
      -- keymaps that only activate when LSP attaches to current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          local key = vim.keymap
          local keyopts = { buffer = 0, noremap = true, silent = true }
          keyopts.desc = "Show documentation (hover)"
          key.set("n", "K", vim.lsp.buf.hover, keyopts)
          keyopts.desc = "See available code actions"
          key.set("n", "ga", vim.lsp.buf.code_action, keyopts)
          keyopts.desc = "Go to function declaration"
          key.set("n", "gD", vim.lsp.buf.declaration, keyopts)
          keyopts.desc = "Show line diagnostics"
          key.set("n", "gl", vim.diagnostic.open_float, keyopts)
          keyopts.desc = "Next diagnostic"
          key.set("n", "]d", vim.diagnostic.goto_next, keyopts)
          keyopts.desc = "Previous diagnostic"
          key.set("n", "[d", vim.diagnostic.goto_prev, keyopts)
          keyopts.desc = "Search LSP references (fuzzy)"
          key.set("n", "gr", "<cmd>lua require('fzf-lua').lsp_references()<cr>", keyopts)
          keyopts.desc = "Search LSP definitions (fuzzy)"
          key.set("n", "gr", "<cmd>lua require('fzf-lua').lsp_definitions()<cr>", keyopts)
          keyopts.desc = "Search LSP implementations (fuzzy)"
          key.set("n", "gi", "<cmd>lua require('fzf-lua').lsp_implementations()<cr>", keyopts)
          -- keyopts.desc = "Search LSP references (fuzzy)"
          -- key.set("n", "gr", "<cmd>Pick lsp scope='references'<cr>", keyopts)
          -- keyopts.desc = "Search LSP definitions (fuzzy)"
          -- key.set("n", "gd", "<cmd>Pick lsp scope='definition'<cr>", keyopts)
          -- keyopts.desc = "Search LSP implementations (fuzzy)"
          -- key.set("n", "gi", "<cmd>Pick lsp scope='implementation'<cr>", keyopts)
        end,
      })

      -- Diagnostic Symbols
      local signs = {
        Error = " ",
        Warn = " ",
        Hint = "󰠠 ",
        Info = " ",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- This sets up servers automatically
      -- see :h mason-lspconfig.setup_handlers() for more info
      require("mason-lspconfig").setup_handlers({
        -- default handler
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end,

    vim.diagnostic.config({
      underline = true,
      update_in_insert = false,
      virtual_text = false,
      severity_sort = true,
    }),
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "jsonls",
        "julials",
        "lua_ls",
        "marksman",
        "pyright",
        "ruff_lsp",
        "rust_analyzer",
        "taplo",
        "texlab",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>ma", "<cmd>Mason<cr>", desc = "Mason" },
    },
    build = ":MasonUpdate",
    config = true,
  },
}
