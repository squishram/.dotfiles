local status_ok, leap = pcall(require, "leap")
if not status_ok then
  return
end

leap.setup {
  highlight_ahead_of_time = true,
  highlight_unlabeled = false,
  case_sensitive = false,
  -- Groups of characters that should match each other.
  -- E.g.: { "([{<", ")]}>", ""'`", }
  character_classes = {},
  -- Leaving the appropriate list empty effectively disables "smart" mode,
  -- and forces auto-jump to be on or off.
  safe_labels = {"s", "f", "n", "u", "t", "/", "F", "L", "N", "H", "G", "M", "U", "T", "?", "Z"},
  -- labels = {"s", "f", "n", "j", "k", "l", "o", "d", "w", "e", "h", "m", "v", "g", "u", "t", "c", ".", "z", "/", "F", "L", "N", "H", "G", "M", "U", "T", "?", "Z"}
  -- These keys are captured directly by the plugin at runtime.
  special_keys = {
    repeat_search = '<enter>',
    next_match    = '<enter>',
    prev_match    = '<tab>',
    next_group    = '<space>',
    prev_group    = '<tab>',
    eol           = '<space>',
  },
}

-- default keymaps
leap.set_default_keymaps()

-- bidirectional mapping for s instead of s/S forward/backward
function leap_bidirectional()
  local current_window = vim.api.nvim_get_current_win()
  require'leap'.leap { target_windows = { current_window } }
end

vim.keymap.set('n', 's', leap_bidirectional, { silent = true })
