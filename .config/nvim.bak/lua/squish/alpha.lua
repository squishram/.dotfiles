local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

-- theme (layout) of boot screen
local dashboard = require("alpha.themes.dashboard")

-- title of boot screen
alpha.setup(dashboard.opts)
  dashboard.section.header.val = {
[[  /$$$$$$   /$$$$$$  /$$   /$$ /$$$$$$  /$$$$$$  /$$   /$$]],
[[ /$$__  $$ /$$__  $$| $$  | $$|_  $$_/ /$$__  $$| $$  | $$]],
[[| $$  \__/| $$  \ $$| $$  | $$  | $$  | $$  \__/| $$  | $$]],
[[|  $$$$$$ | $$  | $$| $$  | $$  | $$  |  $$$$$$ | $$$$$$$$]],
[[ \____  $$| $$  | $$| $$  | $$  | $$   \____  $$| $$__  $$]],
[[ /$$  \ $$| $$/$$ $$| $$  | $$  | $$   /$$  \ $$| $$  | $$]],
[[|  $$$$$$/|  $$$$$$/|  $$$$$$/ /$$$$$$|  $$$$$$/| $$  | $$]],
[[ \______/  \____ $$$ \______/ |______/ \______/ |__/  |__/]],
[[                \__/                                      ]],
[[         /$$   /$$ /$$    /$$ /$$$$$$ /$$      /$$        ]],
[[        | $$$ | $$| $$   | $$|_  $$_/| $$$    /$$$        ]],
[[        | $$$$| $$| $$   | $$  | $$  | $$$$  /$$$$        ]],
[[        | $$ $$ $$|  $$ / $$/  | $$  | $$ $$/$$ $$        ]],
[[        | $$  $$$$ \  $$ $$/   | $$  | $$  $$$| $$        ]],
[[        | $$\  $$$  \  $$$/    | $$  | $$\  $ | $$        ]],
[[        | $$ \  $$   \  $/    /$$$$$$| $$ \/  | $$        ]],
[[        |__/  \__/    \_/    |______/|__/     |__/        ]],
}

-- shortcuts available at boot & associated icons
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}
