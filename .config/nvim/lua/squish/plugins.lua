local fn = vim.fn

-- Automatically install packer
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

-- Have packer use a popup window with rounded borders
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
	use("lewis6991/impatient.nvim")

	-- Have packer manage itself
	use("wbthomason/packer.nvim")
	-- Useful lua functions used ny lots of plugins
	use("nvim-lua/plenary.nvim")
	-- icon support
	use("kyazdani42/nvim-web-devicons")
  -- better notifications display
  use "rcarriga/nvim-notify"
  -- This is needed to fix lsp doc highlight
  use "antoinemadec/FixCursorHold.nvim"

	-- LSP
	-- The LSP plugin itself
	use("neovim/nvim-lspconfig")
	-- bootstrap client for installing language servers
	use("williamboman/nvim-lsp-installer")
	-- formatting plugin with diagnostics, works with linting and formatting software
	use("jose-elias-alvarez/null-ls.nvim")
	-- variable renamer plugin
	use({
		"filipdutescu/renamer.nvim",
		branch = "master",
	})
  -- function explainer popup
  use "ray-x/lsp_signature.nvim"
  -- UI for LSP functionality
  -- use "tami5/lspsaga.nvim"

	-- Autocompletion
	-- The completion plugin
	use("hrsh7th/nvim-cmp")
	-- buffer completions
	use("hrsh7th/cmp-buffer")
	-- path completions
	use("hrsh7th/cmp-path")
	-- cmdline completions
	use("hrsh7th/cmp-cmdline")
	-- LSP autocompletion
	use("hrsh7th/cmp-nvim-lsp")
  -- lua autocompletion
  use "hrsh7th/cmp-nvim-lua"
	-- snippet completions
	use("saadparwaiz1/cmp_luasnip")
	-- snippet engine
	use("L3MON4D3/LuaSnip")
	-- a bunch of snippets to use
	use("rafamadriz/friendly-snippets")

	-- startup dashboard interface for vim
	use("goolord/alpha-nvim")
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
  use "nacro90/numb.nvim"
  -- spot unique characters on your current line more easily
  use "unblevable/quick-scope"
  -- f repeat with f instead of ;
  use("rhysd/clever-f.vim")
	-- quick on-screen navigation
	-- use("ggandor/lightspeed.nvim")
	use("ggandor/leap.nvim")
  -- advanced search & replace including globbing
  use "windwp/nvim-spectre"
	-- scrollbar with lsp diagnostics
	use("petertriho/nvim-scrollbar")
	-- smooth scrolling
	use("karb94/neoscroll.nvim")
	-- underline words
	use("yamatsum/nvim-cursorline")
	-- remove trailing whitespace on save
	use({
    "mcauley-penney/tidy.nvim",
    config = function()
        require("tidy").setup()
    end
  })
	-- escape with kj or jk without typing delays
	use("max397574/better-escape.nvim")

	-- subtitute with yanked word
	use("gbprod/substitute.nvim")
	-- pullup a yank register with ""
	use({ "AckslD/nvim-neoclip.lua" })
	-- surrounding with brackets
	use("ur4ltz/surround.nvim")
  -- use("kylechui/nvim-surround")
	-- autopairing brackets etc
	use("windwp/nvim-autopairs")
	-- autopairing tags for html
	use("windwp/nvim-ts-autotag")
	-- commenting!
	use("numToStr/Comment.nvim")
	-- toggle commas and semicolons at the end of the line
	use("saifulapm/chartoggle.nvim")
  -- advanced number incrementing
  use "monaqa/dial.nvim"

	-- syntax parsing functionalities
	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
  -- generate comments intelligently with treesitter
  use("danymat/neogen")
	-- rainbow brackets with treesitter
	use("p00f/nvim-ts-rainbow")
	-- keeps function and loop context displayed when off-screen with treesitter
	use("romgrk/nvim-treesitter-context")
	-- indent guides
	use("lukas-reineke/indent-blankline.nvim")
  -- swap function arguments
  use "mizlan/iswap.nvim"

	-- colorschemes:
	use("rebelot/kanagawa.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("rmehri01/onenord.nvim")
	use("rose-pine/neovim")
	use("rafamadriz/neon")
	use("sainnhe/everforest")
	use("sainnhe/gruvbox-material")
	use("sainnhe/edge")
	use("sainnhe/sonokai")
  use("EdenEast/nightfox.nvim")
  use("marko-cerovac/material.nvim")
  use("folke/tokyonight.nvim")
  use({
    'glepnir/zephyr-nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  })
  use("theniceboy/nvim-deus")
  use("Th3Whit3Wolf/one-nvim")
  use("andersevenrud/nordic.nvim")
  use("NTBBloodbath/doom-one.nvim")
  use("luisiacc/gruvbox-baby")
  use("cpea2506/one_monokai.nvim")

	-- Neorg - organising & note-taking nvim feature
	use("nvim-neorg/neorg")

	-- vimtex for editing latex documents
	use("lervag/vimtex")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
