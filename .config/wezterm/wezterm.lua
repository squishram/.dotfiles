local wezterm = require("wezterm")
local act = wezterm.action
local wezmod = "CTRL|SHIFT"

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- set the colour scheme and font
config.font = wezterm.font("CaskaydiaCove Nerd Font")
-- config.color_scheme = "EverforestDarr (Gogh)"
config.color_scheme = "Catppuccin Frappé (Gogh)"
config.font_size = 11.5
config.line_height = 1.4
-- don't show the tab bar unless there is >1 tab
config.hide_tab_bar_if_only_one_tab = true
-- I like a blinking cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
-- stops the window shrinking when I shrink the font
config.adjust_window_size_when_changing_font_size = false

-- keymaps
config.keys = {
	-- move between tabs
	{ key = "h", mods = wezmod, action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = wezmod, action = act.ActivateTabRelative(1) },
	-- paste from the clipboard
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	-- paste from the primary selection
	{ key = "V", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
	-- copy to the primary selection
	{ key = "C", mods = "CTRL", action = act.CopyTo("ClipboardAndPrimarySelection") },
	-- close current tab
	{ key = "q", mods = wezmod, action = act.CloseCurrentTab({ confirm = false }) },
	-- decreases font size
	{ key = "-", mods = wezmod, action = act.DecreaseFontSize },
}

return config
