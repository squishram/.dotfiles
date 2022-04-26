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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("packer doesn't seem to be loading")
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
	-- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/popup.nvim")
	-- Useful lua functions used ny lots of plugins
	use("nvim-lua/plenary.nvim")
	-- icon support
	use("kyazdani42/nvim-web-devicons")

	-- LSP
	-- The LSP plugin itself
	use("neovim/nvim-lspconfig")
	-- bootstrap client for installing language servers
	use("williamboman/nvim-lsp-installer")
	-- formatting plugin with diagnostics
	-- works with linting and formatting software
	use("jose-elias-alvarez/null-ls.nvim")
	-- variable renamer plugin
	use({
		"filipdutescu/renamer.nvim",
		branch = "master",
	})

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
	-- snippet completions
	use("saadparwaiz1/cmp_luasnip")
	-- snippet engine
	use("L3MON4D3/LuaSnip")
	-- a bunch of snippets to use
	use("rafamadriz/friendly-snippets")

	-- helps to remember shortcuts and keybinds
	use("folke/which-key.nvim")
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
	-- subtitute with yanked word
	use("gbprod/substitute.nvim")
	-- pullup a yank register with ""
	use({ "AckslD/nvim-neoclip.lua" })

	-- NAVIGATION:
	-- Telescope
	use("nvim-telescope/telescope.nvim")
	-- filetree navigator
	use("kyazdani42/nvim-tree.lua")
	-- document navigation sidebar
	use("stevearc/aerial.nvim")
	-- quick on-screen navigation
	use("ggandor/lightspeed.nvim")
	-- scrollbar with lsp diagnostics
	use("petertriho/nvim-scrollbar")
	-- smooth scrolling
	use("karb94/neoscroll.nvim")
	-- underline words
	use("yamatsum/nvim-cursorline")
	-- remove trailing whitespace on save
	use({ "McAuleyPenney/tidy.nvim", event = "BufWritePre" })
	-- escape with kj or jk without typing delays
	use("max397574/better-escape.nvim")

	-- surrounding with brackets
	use("ur4ltz/surround.nvim")
	-- autopairing brackets etc
	use("windwp/nvim-autopairs")
	-- autopairing tags for html
	use("windwp/nvim-ts-autotag")
	-- commenting!
	use("numToStr/Comment.nvim")
	-- toggle commas and semicolons at the end of the line
	use("saifulapm/chartoggle.nvim")

	-- syntax parsing functionalities
	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- rainbow brackets
	use("p00f/nvim-ts-rainbow")
	-- keeps function and loop context displayed when off-screen
	use("romgrk/nvim-treesitter-context")
	-- shade out the unused split
	use("sunjon/shade.nvim")
	-- indent guides
	use("lukas-reineke/indent-blankline.nvim")

	-- colorschemes:
	use("rebelot/kanagawa.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("sainnhe/everforest")
	use("sainnhe/gruvbox-material")
	use("rmehri01/onenord.nvim")
	use("rose-pine/neovim")
	use("rafamadriz/neon")

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
