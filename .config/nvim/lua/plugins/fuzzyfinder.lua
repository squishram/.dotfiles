return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
    },
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
}
