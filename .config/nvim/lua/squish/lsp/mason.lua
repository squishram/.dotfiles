local servers = {
        -- "cssls",
        -- "cssmodules_ls",
        -- "emmet_ls",
        "html",
        -- "jdtls",
        -- "jsonls",
        -- "solc",
        "sumneko_lua",
        -- "tflint",
        -- "tsserver",
        "pyright",
        "yamlls",
        "bashls",
        -- "clangd",
        "rust_analyzer",
        "texlab",
        -- "taplo",
    }

local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

mason.setup({
    ui = {
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },

        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
    },

    log_level = vim.log.levels.INFO,
})

require("mason-lspconfig").setup {
    ensure_installed = servers ,
    automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("squish.lsp.handlers").on_attach,
        capabilities = require("squish.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    if server == "jsonls" then
        local jsonls_opts = require "squish.lsp.settings.jsonls"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "yamlls" then
        local yamlls_opts = require "squish.lsp.settings.yamlls"
        opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
    end

    if server == "sumneko_lua" then
        local l_status_ok, lua_dev = pcall(require, "neodev")
        if not l_status_ok then
            return
        end
        -- local sumneko_opts = require "squish.lsp.settings.sumneko_lua"
        -- opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        -- opts = vim.tbl_deep_extend("force", require("neodev").setup(), opts)
        local luadev = lua_dev.setup {
            --   -- add any options here, or leave empty to use the default settings
            -- lspconfig = opts,
            lspconfig = {
                on_attach = opts.on_attach,
                capabilities = opts.capabilities,
                -- settings = opts.settings,
            },
        }
        lspconfig.sumneko_lua.setup(luadev)
        goto continue
    end

    if server == "tsserver" then
        local tsserver_opts = require "squish.lsp.settings.tsserver"
        opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require "squish.lsp.settings.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "solc" then
        local solc_opts = require "squish.lsp.settings.solc"
        opts = vim.tbl_deep_extend("force", solc_opts, opts)
    end

    if server == "emmet_ls" then
        local emmet_ls_opts = require "squish.lsp.settings.emmet_ls"
        opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
    end

    if server == "zk" then
        local zk_opts = require "squish.lsp.settings.zk"
        opts = vim.tbl_deep_extend("force", zk_opts, opts)
    end

    if server == "jdtls" then
        goto continue
    end

    if server == "rust_analyzer" then
        local rust_opts = require "squish.lsp.settings.rust"
        -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
        local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
        if not rust_tools_status_ok then
            return
        end

        rust_tools.setup(rust_opts)
        goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
end
