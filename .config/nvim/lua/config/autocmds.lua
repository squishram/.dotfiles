vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 80 })
  end,
})

-- auto-highlight .ijm files as java
vim.api.nvim_command("autocmd BufRead,BufNewFile *." .. "ijm" .. " setfiletype java")
