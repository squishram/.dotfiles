local fn = vim.fn

-- Automatically install packer & keep it updated
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window with rounded borders because it's nicer
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- makes neovim load faster
    -- will be made redundant in future nvim release
    use {"lewis6991/impatient.nvim"}

    -- Have packer manage itself
    use {"wbthomason/packer.nvim"}
    -- Useful lua functions used by lots of plugins
    use {"nvim-lua/plenary.nvim"}
    use {"nvim-lua/popup.nvim"}
    -- icon support
    use {"kyazdani42/nvim-web-devicons"}
    -- better notifications display
    use {"rcarriga/nvim-notify"}
    -- ui component library
    -- use("MunifTanjim/nui.nvim")
    -- complete ui overhaul (cmdline, notifications, etc)
    -- use("folke/noice.nvim")
    -- This is needed to fix lsp doc highlight
    use("antoinemadec/FixCursorHold.nvim")
    use {"stevearc/dressing.nvim"}

    -- LSP
    -- The LSP plugin itself
    use("neovim/nvim-lspconfig")
    -- bootstrap client for installing language servers
    use {"williamboman/mason.nvim"}
    use("williamboman/mason-lspconfig.nvim")
    -- linter & formatter client
    use {"jose-elias-alvarez/null-ls.nvim"}
    -- variable renamer plugin
    use({"filipdutescu/renamer.nvim", branch = "master"})
    -- function explainer popup
    use{"ray-x/lsp_signature.nvim"}
    -- inlay hints for lsp
    use{"lvimuser/lsp-inlayhints.nvim"}
    -- nvim-lsp progress monitor
    use {"j-hui/fidget.nvim"}

    -- Autocompletion
    -- The completion plugin
    use("christianchiarulli/nvim-cmp")
    -- use {"hrsh7th/nvim-cmp"}
    -- buffer completions
    use("hrsh7th/cmp-buffer")
    -- path completions
    use {"hrsh7th/cmp-path"}
    -- cmdline completions
    use("hrsh7th/cmp-cmdline")
    -- LSP autocompletion
    use {"hrsh7th/cmp-nvim-lsp"}
    -- lua autocompletion
    use("hrsh7th/cmp-nvim-lua")
    -- snippet completions
    use {"saadparwaiz1/cmp_luasnip"}
    -- snippet engine
    use("L3MON4D3/LuaSnip")
    -- a bunch of snippets to use
    use {"rafamadriz/friendly-snippets"}

    -- lang-specific
    -- lua development plugin
    use("folke/neodev.nvim")

    -- startup dashboard interface for vim
    use {"goolord/alpha-nvim"}
    -- speedy status bar
    use("nvim-lualine/lualine.nvim")
    -- speedy buffer bar
    use({ "akinsho/bufferline.nvim", tag = "*" })
    -- function to delete buffers easily
    use("famiu/bufdelete.nvim")
    -- bring up a terminal
    use({ "akinsho/toggleterm.nvim", tag = "*" })

    -- git functionality in nvim
    use("lewis6991/gitsigns.nvim")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    -- file navigator vmade for neovim
    use("kyazdani42/nvim-tree.lua")
    -- document navigation sidebar
    use("stevearc/aerial.nvim")
    -- telescope based file browser
    use{"nvim-telescope/telescope-file-browser.nvim"}

    -- peek lines when using :<line_number> before pressing enter
    use("nacro90/numb.nvim")
    -- spot unique characters on your current line more easily
    use("jinh0/eyeliner.nvim")
    -- f repeat with f instead of ;
    use("rhysd/clever-f.vim")
    -- quick on-screen navigation
    use({"ggandor/leap.nvim", commit = "e06b231"})
    -- smooth scrolling
    use("karb94/neoscroll.nvim")
    -- underline words
    use("yamatsum/nvim-cursorline")
    -- remove trailing whitespace on save
    use("mcauley-penney/tidy.nvim")
    -- quickfix list
    use{"folke/trouble.nvim"}
    -- escape with kj or jk without typing delays
    use("max397574/better-escape.nvim")

    -- subtitute with yanked word
    use("gbprod/substitute.nvim")
    -- pullup a yank register with ""
    use({ "AckslD/nvim-neoclip.lua" })
    -- surrounding with brackets
    use("kylechui/nvim-surround")
    -- autopairing brackets etc
    use("windwp/nvim-autopairs")
    -- autopairing tags for html
    use("windwp/nvim-ts-autotag")
    -- commenting!
    use("numToStr/Comment.nvim")
    -- toggle commas and semicolons at the end of the line
    use("saifulapm/chartoggle.nvim")
    -- advanced number incrementing
    use("monaqa/dial.nvim")

    -- syntax parsing functionalities
    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
    -- generate comments intelligently with treesitter
    use("danymat/neogen")
    -- rainbow brackets with treesitter
    use("p00f/nvim-ts-rainbow")
    -- keeps function and loop context displayed when off-screen with treesitter
    use("romgrk/nvim-treesitter-context")
    -- indent guides
    use("lukas-reineke/indent-blankline.nvim")
    -- better folding
    use {"kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async"}
    -- todo comments highlighted
    use("folke/todo-comments.nvim")

    -- Neorg - organising & note-taking nvim feature
    use("nvim-neorg/neorg")
    -- vimtex for editing latex documents
    use("lervag/vimtex")

    -- hex colouriser in text for colours
    use("norcalli/nvim-colorizer.lua")
    -- for looking at colourschemes in real time
    use("rktjmp/lush.nvim")

    -- colourschemes:
    use("meliora-theme/neovim")
    use("rebelot/kanagawa.nvim")
    use("rmehri01/onenord.nvim")
    use("rafamadriz/neon")
    use("sainnhe/everforest")
    use("sainnhe/edge")
    use("sainnhe/sonokai")
    use("ellisonleao/gruvbox.nvim")
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
    use("glepnir/zephyr-nvim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
