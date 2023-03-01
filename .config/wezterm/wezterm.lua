local wezterm = require("wezterm")
local act = wezterm.action
local wezmod = "CTRL|SHIFT"

return {
	font = wezterm.font("Caskaydia Cove Nerd Font"),
	-- color_scheme = "EverforestDark (Gogh)",
	color_scheme = "Gruvbox dark, soft (base16)",
	hide_tab_bar_if_only_one_tab = true,
	keys = {
		-- paste from the clipboard
		{ key = "V", mods = wezmod, action = act.PasteFrom("Clipboard") },
		-- paste from the primary selection
		{ key = "V", mods = wezmod, action = act.PasteFrom("PrimarySelection") },
		-- copy to the primary selection
		{ key = "C", mods = wezmod, action = act.CopyTo("ClipboardAndPrimarySelection") },
		-- close current tab
		{ key = "W", mods = wezmod, action = act.CloseCurrentTab({ confirm = true }) },
		-- decreases font size
		{ key = "-", mods = wezmod, action = act.DecreaseFontSize },
	},
}
