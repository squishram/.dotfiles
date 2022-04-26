-- Options:
-- kanagawa
-- catppuccin
-- everforest
-- gruvbox-material
-- onenord
-- rose-pine
-- neon

-- This will try to implement the colorscheme of your choice
-- But won't throw a hissy if it isn't available
local colorscheme = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
