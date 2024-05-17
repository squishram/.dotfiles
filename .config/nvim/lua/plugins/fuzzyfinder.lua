return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {

      {
        "<leader>ff",
        "<cmd>lua require('fzf-lua').files()<cr>",
        silent = true,
        desc = "search files (fuzzy)",
      },

      {
        "<leader>/",
        "<cmd>lua require('fzf-lua').live_grep()<cr>",
        silent = true,
        desc = "search files (fuzzy)",
      },

      {
        "<leader>,",
        "<cmd>lua require('fzf-lua').buffers()<cr>",
        silent = true,
        desc = "search buffers (fuzzy)",
      },
    },

    opts = {
      winopts = {
        -- split instead of float?
        -- split = "belowright vnew",
        -- window height (for floating window only)
        height = 0.95,
        -- window width (for floating window only)
        width = 0.40,
        -- window row position (0=top, 1=bottom)
        row = 0.35,
        -- window col position (0=left, 1=right)
        col = 0.95,
        -- 'none', 'single', 'double', 'thicc' (+cc) or 'rounded' (default)
        border = "rounded",
        -- title
        -- title = "fzf",
        -- title position 'left|center|right'
        -- title_pos = "center",
        -- start fullscreen?
        fullscreen = false,

        preview = {
          -- wrap|nowrap
          wrap = "nowrap",
          -- hidden|nohidden
          hidden = "hidden",
          -- up|down:size
          vertical = "down:99%",
          -- right|left:size
          horizontal = "right:99%",
          -- horizontal|vertical|flex
          layout = "flex",
          -- #cols to switch to horizontal on flex
          flip_columns = 120,
          -- preview border title (file/buf)?
          title = true,
          -- left|center|right, title alignment
          title_pos = "center",
          -- `false` 'float|border'
          -- float:  in-window floating border
          -- border: in-border chars (see below)
          scrollbar = "float",
          -- float scrollbar offset from right
          scrolloff = "-2",
          -- applies only when scrollbar = 'float'
          -- scrollbar chars ({ <full>, <empty> }
          scrollchars = { "█", "" },
          -- applies only when scrollbar = 'border'
          -- delay(ms) displaying the preview
          delay = 100,
          default = "bat",
          border = "border",
          winopts = {
            number = true,
            relativenumber = false,
            cursorline = true,
            cursorlineopt = "both",
            cursorcolumn = false,
            signcolumn = "no",
            list = false,
            foldenable = false,
            foldmethod = "manual",
          },
        },
      },

      keymap = {
        builtin = {
          ["<Tab>"] = "toggle-preview",
        },
        fzf = {
          ["tab"] = "toggle-preview",
        },
      },

      previewers = {
        bat = {
          cmd = "bat",
          args = "--color=always --number --decorations=always",
          theme = "Catppuccin-frappe",
        },
      },
    },
  },

  -- {
  --
  --   "echasnovski/mini.pick",
  --   version = "*",
  --   dependencies = {
  --     "echasnovski/mini.extra",
  --     version = "*",
  --     config = true,
  --   },
  --
  --   keys = {
  --     {
  --       "<leader>ff",
  --       ":Pick files<CR>",
  --       silent = true,
  --       desc = "search files (fuzzy)",
  --     },
  --
  --     {
  --       "<leader>/",
  --       ":Pick grep_live<CR>",
  --       silent = true,
  --       desc = "live grep (fuzzy)",
  --     },
  --
  --     {
  --       "<leader>fk",
  --       ":Pick keymaps<CR>",
  --       silent = true,
  --       desc = "search keymaps (fuzzy)",
  --     },
  --
  --     {
  --       "<leader>,",
  --       ":Pick buffers<CR>",
  --       silent = true,
  --       desc = "search buffers (fuzzy)",
  --     },
  --   },
  --
  --   opts = {
  --     -- Delays (in ms; should be at least 1)
  --     delay = {
  --       -- Delay between forcing asynchronous behavior
  --       async = 10,
  --       -- Delay between computation start and visual feedback about it
  --       busy = 50,
  --     },
  --
  --     -- Keys for performing actions. See `:h MiniPick-actions`.
  --     mappings = {
  --       caret_left = "<Left>",
  --       caret_right = "<Right>",
  --
  --       choose = "<CR>",
  --       choose_in_split = "<C-s>",
  --       choose_in_tabpage = "<C-t>",
  --       choose_in_vsplit = "<C-v>",
  --       choose_marked = "<M-CR>",
  --
  --       delete_char = "<BS>",
  --       delete_char_right = "<Del>",
  --       delete_left = "<C-u>",
  --       delete_word = "<C-w>",
  --
  --       mark = "<C-x>",
  --       mark_all = "<C-a>",
  --
  --       move_down = "<C-j>",
  --       move_start = "<C-g>",
  --       move_up = "<C-k>",
  --
  --       paste = "<C-r>",
  --
  --       refine = "<C-Space>",
  --       refine_marked = "<M-Space>",
  --
  --       scroll_down = "<C-f>",
  --       scroll_left = "<C-h>",
  --       scroll_right = "<C-l>",
  --       scroll_up = "<C-b>",
  --
  --       stop = "<Esc>",
  --
  --       toggle_info = "<S-Tab>",
  --       toggle_preview = "<Tab>",
  --     },
  --
  --     -- General options
  --     options = {
  --       -- Whether to show content from bottom to top
  --       content_from_bottom = false,
  --
  --       -- Whether to cache matches (more speed and memory on repeated prompts)
  --       use_cache = false,
  --     },
  --
  --     -- Source definition. See `:h MiniPick-source`.
  --     source = {
  --       items = nil,
  --       name = nil,
  --       cwd = nil,
  --
  --       match = nil,
  --       show = nil,
  --       preview = nil,
  --
  --       choose = nil,
  --       choose_marked = nil,
  --     },
  --
  --     -- Window related options
  --     window = {
  --       -- Float window config (table or callable returning it)
  --       config = nil,
  --     },
  --   },
  -- },
}
