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

-- make leap bidirectional

function leap_bidirectional()
  leap.leap { ['target-windows'] = { vim.api.nvim_get_current_win() } }
end

local opts = { noremap = true, silent = true }

vim.keymap.set('n', 's', leap_bidirectional, opts)
