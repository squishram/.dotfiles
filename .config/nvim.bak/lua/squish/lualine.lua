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

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'auto',
    theme = colorscheme,
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
    lualine_x = {'encoding', 'fileformat', 'filetype'},
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
