-- Basic Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

{
    -- directory where plugins will be installed
    root = vim.fn.stdpath("data") .. "/lazy",
    defaults = {
        -- should plugins be lazy-loaded?
        lazy = false,
        -- version = "*", -- enable this to try installing the latest stable versions of plugins
        version = nil,
    },
     -- lockfile generated after running update.
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",

    concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
    git = {
        -- defaults for the `Lazy log` command
        -- log = { "-10" }, -- show the last 10 commits
        log = { "--since=3 days ago" }, -- show commits from the last 3 days
        timeout = 120, -- kill processes that take more than 2 minutes
        url_format = "https://github.com/%s.git",
    },
    dev = {
        -- directory where you store your local plugin projects
        path = "~/projects",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "habamax" },
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",
        icons = {
            loaded = "●",
            not_loaded = "○",
            cmd = " ",
            config = "",
            event = "",
            ft = " ",
            init = " ",
            keys = " ",
            plugin = " ",
            runtime = " ",
            source = " ",
            start = "",
            task = "✔ ",
            lazy = "鈴 ",
            list = {
                "●",
                "➜",
                "★",
                "‒",
            },
        },
        -- leave nil, to automatically select a browser depending on your OS.
        -- If you want to use a specific browser, you can define it here
        browser = nil, ---@type string?
        throttle = 20, -- how frequently should the ui process render events
        custom_keys = {
            -- you can define custom key maps here.
            -- To disable one of the defaults, set it to false

            -- open lazygit log
            ["<localleader>l"] = function(plugin)
                require("lazy.util").open_cmd({ "lazygit", "log" }, {
                    cwd = plugin.dir,
                    terminal = true,
                    close_on_exit = true,
                    enter = true,
                })
            end,

            -- open a terminal for the plugin dir
            ["<localleader>t"] = function(plugin)
                require("lazy.util").open_cmd({ vim.go.shell }, {
                    cwd = plugin.dir,
                    terminal = true,
                    close_on_exit = true,
                    enter = true,
                })
            end,
        },
    },
    diff = {
        -- diff command <d> can be one of:
        -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
        --   so you can have a different command for diff <d>
        -- * git: will run git diff and open a buffer with filetype git
        -- * terminal_git: will open a pseudo terminal with git diff
        -- * diffview.nvim: will open Diffview to show the diff
        cmd = "git",
    },
    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = true, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = true, -- get a notification when changes are found
    },
    performance = {
        cache = {
            enabled = true,
            path = vim.fn.stdpath("cache") .. "/lazy/cache",
            -- Once one of the following events triggers, caching will be disabled.
            -- To cache all modules, set this to `{}`, but that is not recommended.
            -- The default is to disable on:
            --  * VimEnter: not useful to cache anything else beyond startup
            --  * BufReadPre: this will be triggered early when opening a file from the command line directly
            disable_events = { "VimEnter", "BufReadPre" },
            ttl = 3600 * 24 * 5, -- keep unused modules for up to 5 days
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
            ---@type string[]
            paths = {}, -- add any custom paths here that you want to indluce in the rtp
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                -- "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                -- "tarPlugin",
                -- "tohtml",
                -- "tutor",
                -- "zipPlugin",
            },
        },
    },
    -- lazy can generate helptags from the headings in markdown readme files,
    -- so :help works even for plugins that don't have vim docs.
    -- when the readme opens with :help it will be correctly displayed as markdown
    readme = {
        root = vim.fn.stdpath("state") .. "/lazy/readme",
        files = { "README.md", "lua/**/README.md" },
        -- only generate markdown helptags for plugins that dont have docs
        skip_if_doc_exists = true,
    },
}

return {
    -- the colorscheme should be available when starting Neovim
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- I have a separate config.mappings file where I require which-key.
    -- With lazy the plugin will be automatically loaded when it is required somewhere
    { "folke/which-key.nvim", lazy = true },

    {
        "nvim-neorg/neorg",
        -- lazy-load on filetype
        ft = "norg",
        -- custom config that will be executed when loading the plugin
        config = function()
            require("neorg").setup()
        end,
    },

    -- the above could also be written as:
    {
        "nvim-neorg/neorg",
        ft = "norg",
        config = true, -- run require("neorg").setup()
    },

    -- or set a custom config:
    {
        "nvim-neorg/neorg",
        ft = "norg",
        config = { foo = "bar" }, -- run require("neorg").setup({foo = "bar"})
    },

    {
        "dstein64/vim-startuptime",
        -- lazy-load on a command
        cmd = "StartupTime",
    },

    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        },
        config = function()
            -- ...
        end,
    },

    -- you can use the VeryLazy event for things that can
    -- load later and are not important for the initial UI
    { "stevearc/dressing.nvim", event = "VeryLazy" },

    {
        "cshuaimin/ssr.nvim",
        -- init is always executed during startup, but doesn't load the plugin yet.
        init = function()
            vim.keymap.set({ "n", "x" }, "<leader>cR", function()
                -- this require will automatically load the plugin
                require("ssr").open()
            end, { desc = "Structural Replace" })
        end,
    },

    {
        "monaqa/dial.nvim",
        -- lazy-load on keys
        -- mode is `n` by default. For more advanced options, check the section on key mappings
        keys = { "<C-a>", { "<C-x>", mode = "n" } },
    },

    -- local plugins need to be explicitly configured with dir
    { dir = "~/projects/secret.nvim" },

    -- you can use a custom url to fetch a plugin
    { url = "git@github.com:folke/noice.nvim.git" },

    -- local plugins can also be configure with the dev option.
    -- This will use {config.dev.path}/noice.nvim/ instead of fetching it from Github
    -- With the dev option, you can easily switch between the local and installed version of a plugin
    { "folke/noice.nvim", dev = true },
}

    return packer.startup(function(use)
    -------------
    -- bedrock --
    -------------
    -- makes neovim load faster (might be merged into main eventually)
    use({ "lewis6991/impatient.nvim" })
    -- Have packer manage itself
    use({ "wbthomason/packer.nvim" })
    -- Useful lua functions used by lots of plugins
    use({ "nvim-lua/plenary.nvim" })
    use({ "nvim-lua/popup.nvim" })
    -- icon support
    use({ "kyazdani42/nvim-web-devicons" })

    -- complete ui overhaul (cmdline, notifications, etc)
    -- use({
    -- 	"folke/noice.nvim",
    -- 	event = "VimEnter",
    -- 	requires = {
    -- 		"MunifTanjim/nui.nvim",
    -- 		"rcarriga/nvim-notify",
    -- 	},
    -- })

    -- NOTE: REMOVED
    -- This is needed to fix lsp doc highlight
    -- use("antoinemadec/FixCursorHold.nvim")
    -- use {"stevearc/dressing.nvim"}
    -- document navigation sidebar
    -- use("stevearc/aerial.nvim")
    -- generate comments intelligently with treesitter
    -- use("danymat/neogen")
    -- underline words
    -- use("yamatsum/nvim-cursorline")
    -- toggle commas and semicolons at the end of the line
    -- use("saifulapm/chartoggle.nvim")

    ---------
    -- LSP --
    ---------
    -- The LSP plugin itself
    use("neovim/nvim-lspconfig")
    -- bootstrap client for installing language servers
    use({ "williamboman/mason.nvim" })
    use("williamboman/mason-lspconfig.nvim")
    -- linter & formatter client
    use({ "jose-elias-alvarez/null-ls.nvim" })
    -- variable renamer plugin
    use({ "filipdutescu/renamer.nvim", branch = "master" })
    -- function explainer popup
    use({ "ray-x/lsp_signature.nvim" })
    -- inlay hints for lsp
    use({ "lvimuser/lsp-inlayhints.nvim" })

    --------------------
    -- autocompletion --
    --------------------
    -- The completion plugin
    use("christianchiarulli/nvim-cmp")
    -- use {"hrsh7th/nvim-cmp"}
    -- buffer completions
    use("hrsh7th/cmp-buffer")
    -- path completions
    use({ "hrsh7th/cmp-path" })
    -- cmdline completions
    use("hrsh7th/cmp-cmdline")
    -- LSP autocompletion
    use({ "hrsh7th/cmp-nvim-lsp" })
    -- lua autocompletion
    use("hrsh7th/cmp-nvim-lua")
    -- snippet completions
    use({ "saadparwaiz1/cmp_luasnip" })
    -- snippet engine
    use("L3MON4D3/LuaSnip")
    -- a bunch of snippets to use
    use({ "rafamadriz/friendly-snippets" })

    -------------------
    -- lang-specific --
    -------------------
    -- lua development plugin
    -- use("folke/neodev.nvim")

    ---------------
    -- INTERFACE --
    ---------------
    -- startup dashboard interface for vim
    use({ "goolord/alpha-nvim" })
    -- speedy status bar
    use("nvim-lualine/lualine.nvim")
    -- speedy buffer bar
    use({ "akinsho/bufferline.nvim", tag = "*" })
    -- function to delete buffers easily
    use("famiu/bufdelete.nvim")
    -- bring up a terminal
    use({ "akinsho/toggleterm.nvim", tag = "*" })
    -- block out distractions
    use("Pocco81/true-zen.nvim")
    -- git functionality in nvim
    -- use("lewis6991/gitsigns.nvim")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    -- file navigator vmade for neovim
    use("kyazdani42/nvim-tree.lua")
    -- telescope based file browser
    use({ "nvim-telescope/telescope-file-browser.nvim" })

    -- peek lines when using :<line_number> before pressing enter
    use("nacro90/numb.nvim")
    -- spot unique characters on your current line more easily
    -- use("jinh0/eyeliner.nvim")
    -- f repeat with f instead of ;
    -- use("rhysd/clever-f.vim")
    -- quick on-screen navigation
    -- use({ "ggandor/leap.nvim", commit = "e06b231" })
    use({ "ggandor/leap.nvim"})
    -- yank and cut from afar
    use({ "ggandor/leap-spooky.nvim" })
    -- multi-line f/t/F/T movements
    use("ggandor/flit.nvim")
    -- quickfix list
    use({ "folke/trouble.nvim" })
    -- escape with kj or jk without typing delays
    use("max397574/better-escape.nvim")

    -- subtitute with yanked word
    use("gbprod/substitute.nvim")
    -- surrounding with brackets
    use("kylechui/nvim-surround")
    -- autopairing brackets etc
    use("windwp/nvim-autopairs")
    -- autopairing tags for html
    use("windwp/nvim-ts-autotag")
    -- commenting!
    use("numToStr/Comment.nvim")
    -- advanced number incrementing
    use("monaqa/dial.nvim")

    -- syntax parsing functionalities
    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- rainbow brackets with treesitter
    use("p00f/nvim-ts-rainbow")
    -- keeps function and loop context displayed when off-screen with treesitter
    use("romgrk/nvim-treesitter-context")
    -- makes syntax objects manageable with vim motions
    use("nvim-treesitter/nvim-treesitter-textobjects")
    -- indent guides
    use("lukas-reineke/indent-blankline.nvim")
    -- better folding
    use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
    -- todo comments highlighted
    use("folke/todo-comments.nvim")

    -- Neorg - organising & note-taking nvim feature
    use({ "nvim-neorg/neorg", run = ":Neorg sync-parsers" })

    -- vimtex for editing latex documents
    use("lervag/vimtex")

    -- hex colouriser in text for colours
    use("norcalli/nvim-colorizer.lua")
    -- different colour scheme for each filetype
    use("folke/styler.nvim")

    -- colourschemes:
    use("meliora-theme/neovim")
    use("rebelot/kanagawa.nvim")
    use("rmehri01/onenord.nvim")
    use("rafamadriz/neon")
    use("sainnhe/everforest")
    use("sainnhe/edge")
    use("sainnhe/sonokai")
    use("EdenEast/nightfox.nvim")
    use("marko-cerovac/material.nvim")
    use("folke/tokyonight.nvim")
    use("glepnir/zephyr-nvim")
    use("theniceboy/nvim-deus")
    use("Th3Whit3Wolf/one-nvim")
    use("andersevenrud/nordic.nvim")
    use("NTBBloodbath/doom-one.nvim")
    use("cpea2506/one_monokai.nvim")
    use("sam4llis/nvim-tundra")
    use("catppuccin/nvim")
    use("ellisonleao/gruvbox.nvim")
    use({ "rose-pine/neovim", as = "rose-pine" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
end
end)
