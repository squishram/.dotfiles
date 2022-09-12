local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
    return
end

neorg.setup {

    -- Tell Neorg what modules to load
    load = {

        -- Load all the default modules
        ["core.defaults"] = {},

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
                    ssd_workspace = "~/neorg/",
                    hdd_workspace = "/mnt/linux_data/neorg/",
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
