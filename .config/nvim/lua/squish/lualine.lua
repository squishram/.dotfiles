local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- this creates a function that gets a count when you do a word search with "/"
function searchCount()
    -- maxcount = 0 makes the number not be capped at 99
    local search = vim.fn.searchcount({maxcount = 0})
    -- which iteration of the searched word you are on
    local searchCurrent = search.current
    -- how many iterations of the searched word there are in the document in total
    local searchTotal = search.total
    if searchCurrent > 0 then
    -- what to display if you are mid-search
        return "/"..vim.fn.getreg("/").." ["..searchCurrent.."/"..searchTotal.."]"
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
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {{ searchCount }, 'encoding', 'fileformat', 'filetype'},
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
