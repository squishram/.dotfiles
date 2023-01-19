local status_ok, truezen = pcall(require, "true-zen")
if not status_ok then
    return
end

truezen.setup{
    -- configurations per mode
    modes = {
        ataraxis = {
            -- if 'dark' then dim the padding windows, otherwise if it's `light` it'll brighten said windows
            shade = "dark",
            -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
            backdrop = 0,
            -- minimum size of main window
            minimum_writing_area = {
                width = 70,
                height = 44,
            },
            -- type :q or :qa to quit Ataraxis mode
            quit_untoggles = true,
            -- padding windows
            padding = {
                left = 52,
                right = 52,
                top = 0,
                bottom = 0,
            },
            -- run functions when opening/closing Ataraxis mode
            callbacks = {
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        },
        minimalist = {
            -- save current options from any window except ones displaying these kinds of buffers
            ignored_buf_types = { "nofile" },
            -- options to be disabled when entering Minimalist mode
            options = {
                number = false,
                relativenumber = false,
                showtabline = 0,
                signcolumn = "no",
                statusline = "",
                cmdheight = 1,
                laststatus = 0,
                showcmd = false,
                showmode = false,
                ruler = false,
                numberwidth = 1
            },
            -- run functions when opening/closing Minimalist mode
            callbacks = {
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        },
        narrow = {
            --- change the style of the fold lines. Set it to:
            --- `informative`: to get nice pre-baked folds
            --- `invisible`: hide them
            --- function() end: pass a custom func with your fold lines. See :h foldtext
            folds_style = "informative",
            -- display narrowed text in a Ataraxis session
            run_ataraxis = true,
            -- run functions when opening/closing Narrow mode
            callbacks = {
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        },
        focus = {
            -- run functions when opening/closing Focus mode
            callbacks = {
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        }
    },
    integrations = {
        -- hide tmux status bar in (minimalist, ataraxis)
        tmux = false,
        -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
        kitty = {
            enabled = false,
            font = "+1"
        },
        -- enable twilight (ataraxis)
        twilight = false,
        -- hide nvim-lualine (ataraxis)
        lualine = false
    },
}

local api = vim.api

api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})
