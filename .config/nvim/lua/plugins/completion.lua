return {
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'Note: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
        or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  {
    "saghen/blink.cmp",
    lazy = false,
    version = "v0.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },

<<<<<<< HEAD
    config = true,
=======
>>>>>>> main
    opts = {
      -- default | super-tab | enter
      keymap = { preset = "super-tab" },

<<<<<<< HEAD
      -- experimental signature help support
      signature = { enabled = true },

      -- mini.icons inclusion!
      completion = {
        -- show documentation after a delay
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        menu = {
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end,
                -- Optionally, you may also use the highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end,
              }
            }
          }
        }
      },

      -- luasnip support
      snippets = { preset = 'luasnip' }
=======
      appearance = {
        -- take fallback highlight groups from nvim-cmp (will be removed eventually)
        use_nvim_cmp_as_default = true,
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        nerd_font_variant = "mono",
      },

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } },
      -- experimental signature help support
      trigger = { signature_help = { enabled = true } },

      -- where's it getting completions from?
      sources = {
        default = { "lsp", "path", "luasnip", "buffer" },
      },

      -- luasnip support
      snippets = {
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require("luasnip").jumpable(filter.direction)
          end
          return require("luasnip").in_snippet()
        end,
        jump = function(direction)
          require("luasnip").jump(direction)
        end,
      },
>>>>>>> main
    },
  },
}
