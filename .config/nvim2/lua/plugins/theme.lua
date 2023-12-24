return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "frappe", -- latte, frappe, macchiato, mocha
		transparent_background = false,
		show_end_of_buffer = false,
		term_colors = false,
		dim_inactive = {
			enabled = true,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false,
		no_bold = false,
		no_underline = false,
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = { "italic" },
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = { "bold" },
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = true,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
		},
	},

	-- enable colourscheme
	config = function()
		vim.cmd([[colorscheme catppuccin]])
	end,
}
