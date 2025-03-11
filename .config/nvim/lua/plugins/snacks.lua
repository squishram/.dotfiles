return {
  "folke/snacks.nvim",
  dependencies = {
    "folke/persistence.nvim",
  },
  priority = 1000,
  lazy = false,

  opts = {
    -- whichkey tells you if toggle is on or off
    toggle = { enabled = true },
    -- smooth scrolling
    scroll = { enabled = true },
    -- indent guides and scopes
    indent = { enabled = true },
    scope = { enabled = true },
    -- makes the notification system nicer, config here
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    -- opens files faster by optimising plugin load
    quickfile = { enabled = true },
    -- helps to process large files
    bigfile = { enabled = true },
    -- lazygit in neovim
    lazygit = { enabled = false },
    -- pretty configurable status column
    statuscolumn = { enabled = true },
    -- LSP reference navigator
    words = { enabled = true },
    -- aesthetic configuration
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },

    -- brilliant dashboard!
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },

  keys = {

    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },

    {
      "<C-w>",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
      nowait = true,
    },

    {
      "<leader>cR",
      function()
        Snacks.rename()
      end,
      desc = "Rename File",
    },

    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },

    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },

    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },

  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
      end,
    })
  end,
}
