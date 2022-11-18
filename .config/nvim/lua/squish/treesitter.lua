local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end


-- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
--
-- parser_configs.norg = {
--     install_info = {
--         url = "https://github.com/nvim-neorg/tree-sitter-norg",
--         files = { "src/parser.c", "src/scanner.cc" },
--         branch = "main"
--     },
-- }
--
-- parser_configs.norg_meta = {
--     install_info = {
--         url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
--         files = { "src/parser.c" },
--         branch = "main"
--     },
-- }
--
-- parser_configs.norg_table = {
--     install_info = {
--         url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
--         files = { "src/parser.c" },
--         branch = "main"
--     },
--
-- }

configs.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "all",
    -- ensure_installed = {"all", "norg", "norg_meta", "norg_table"},

    -- install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing
    ignore_install = { "" },
    -- autopairs
    autopairs = {
        enable = true,
    },

    highlight = {
        -- false will disable the whole extension
        enable = true,
        -- list of language that will be disabled
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },

    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },

    rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        -- disable = { "jsx", "cpp" },
        -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        extended_mode = true,
        -- Do not enable for files with more than n lines, int
        max_file_lines = nil,
        -- Table of hex strings
        -- colors = {},
        -- table of colour name strings
        -- termcolors = {}
    },

    autotag = {
        enable = true,
    },

    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = true,
        },

        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },

        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = { query = "@class.outer", desc = "Next class start" },
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },
}
