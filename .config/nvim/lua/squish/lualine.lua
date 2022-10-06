local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- this creates a function that gets a count when you do a word search with "/"
function SearchCount()
  -- maxcount = 0 makes the number not be capped at 99
  local search = vim.fn.searchcount({maxcount = 0})
  -- what to display if you are mid-search
  if search.current > 0 then
    return "/"..vim.fn.getreg("/").." ["..search.current.."/"..search.total.."]"
  else
    -- what to display if you are not searching
    return ""
  end
end

require('lualine').setup {
  sections = {
  }
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = '',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {{ SearchCount }, 'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- lualine.setup {
--   options = {
--     theme = 'auto',
--     component_separators = '|',
--     section_separators = { left = '', right = '' },
--   },
--   sections = {
--     lualine_a = {
--       { 'mode', separator = { left = '' }, right_padding = 2 },
--     },
--     lualine_b = { 'filename', 'branch' },
--     lualine_c = { 'fileformat' },
--     lualine_x = {},
--     lualine_y = { 'filetype', 'progress' },
--     lualine_z = {
--       { 'location', separator = { right = '' }, left_padding = 2 },
--     },
--   },
--   inactive_sections = {
--     lualine_a = { 'filename' },
--     lualine_b = {},
--     lualine_c = {},
--     lualine_x = {},
--     lualine_y = {},
--     lualine_z = { 'location' },
--   },
--   tabline = {},
--   extensions = {},
-- }
