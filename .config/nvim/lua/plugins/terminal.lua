return {
  "akinsho/toggleterm.nvim",
  version = "*",
  -- lazy load on open
  keys = {
    { "<C-\\>" },
  },
  opts = {
    -- key to toggle terminal
    open_mapping = [[<c-\>]],
    -- 'vertical' | 'horizontal' | 'tab' | 'float'
    direction = "vertical",
    -- size (units unknown)
    size = 80,
    -- shell used
    shell = vim.o.shell,
    -- automatically scroll to the bottom of the terminal on opening
    auto_scroll = true,
  },
}
