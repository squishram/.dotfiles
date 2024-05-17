-- highlight text on yank for 80ms
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 80 })
  end,
})

-- auto-highlight .ijm files as java
vim.api.nvim_command("autocmd BufRead,BufNewFile *." .. "ijm" .. " setfiletype java")

-- clear trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- -- auto-un-highlight after search
-- local ns = vim.api.nvim_create_namespace("toggle_hlsearch")
-- local function toggle_hlsearch(char)
--   if vim.fn.mode() == "n" then
--     local keys = { "<CR>", "n", "N", "*", "#", "?", "/" }
--     local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))
--     if vim.opt.hlsearch:get() ~= new_hlsearch then
--       vim.opt.hlsearch = new_hlsearch
--     end
--   end
-- end
-- vim.on_key(toggle_hlsearch, ns)
