local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
    return
end

neorg.setup {

    -- Tell Neorg what modules to load
    load = {

        -- Load all the default modules
        ["core.defaults"] = {},

        -- load the treesitter module
        ["core.integrations.treesitter"] = {
            config = {
                -- Configuration here (nothing I want in it yet)
            }
        },

        -- load the journal module
        ["core.norg.journal"] = {
            config = {
                -- Configuration here (nothing I want in it yet)
            }
        },

        -- Configure core.keybinds
        ["core.keybinds"] = {
            config = {
                -- Generate the default keybinds
                default_keybinds = true,
                -- This is the default if unspecified
                neorg_leader = "<Leader>o"
            }
        },

        -- Allows for use of icons
        ["core.norg.concealer"] = {},

        -- Manage your directories with Neorg
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    neorg = "~/neorg/",
                }
            }
        },

        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        }
    },
}

local api = vim.api
api.nvim_set_keymap("n", "<leader>nj", ":Neorg journal today<CR>", {})