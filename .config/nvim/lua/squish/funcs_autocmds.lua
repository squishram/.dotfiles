-- doesn't add blank lines to the register when deleted
function M.smart_dd()
  if vim.api.nvim_get_current_line(): match("^%s*$") then
    return "\"_dd"
  else
    return "dd"
  end
end
