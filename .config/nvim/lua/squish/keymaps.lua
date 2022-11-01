local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- navigate splits with CTRL-[hjkl]
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- quit split with CTRL-q
keymap("n", "<C-q>", "<C-w>q", opts)

-- edit your neovim config shortcut
keymap("n", "<leader>nv", ":edit ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "<leader>sv", ":source ~/.config/nvim/init.lua<cr>", opts)

-- takes you to that wee menu boi (netrw)
keymap("n", "<leader>pv", ":Ex<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("n", "<leader>j", ":move .+1<CR>==", opts)
keymap("n", "<leader>k", ":move .-2<CR>==", opts)

keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<S-j>", ":move .+1<CR>==", opts)
keymap("v", "<S-k>", ":move .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- delete buffers
keymap("n", "<C-w>", "<cmd>lua require('bufdelete').bufdelete(0)<CR>", opts)

-- keep the cursor centred when scrolling through searches
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
-- keep the cursor centred when pulling up a line
keymap("n", "J", "mzJ'z", opts)

-- remap : to ; so you don't need to hold shift
keymap("n", ";", ":", opts)

-- break points for the undo function
-- so it doesn't remove the whole damn thing you typed
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)

-- stick a comma/ semicolon at the end of the line
keymap("i", ";;", "<Esc>A;<Esc>", opts)
keymap("i", ",,", "<Esc>A,<Esc>",  opts)

-- clear search highlights function
keymap("n", "<leader><space>", ":noh<CR>", opts)
-- fix last spelling mistake
keymap("i", "<C-p>", "<C-l> <c-g>u<Esc>[s1z=`]a<c-g>u", opts)


-- toggle wrap for writing prose
-- vim.keymap.set("n", "<leader>w",
--   function()
--   if vim.opt.wrap == true then
--     vim.opt.linebreak = false
--     vim.opt.wrap = false
--     vim.keymap.del({"n", "v"}, "j", {noremap = true, silent = true, buffer = true})
--     vim.keymap.del({"n", "v"}, "k", {noremap = true, silent = true, buffer = true})
--     vim.keymap.del({"n", "v"}, "0", {noremap = true, silent = true, buffer = true})
--     vim.keymap.del({"n", "v"}, "^", {noremap = true, silent = true, buffer = true})
--     vim.keymap.del({"n", "v"}, "$", {noremap = true, silent = true, buffer = true})
--   else
--     vim.opt.linebreak = true
--     vim.opt.wrap = true
--     vim.keymap.set({"n", "v"}, "j", "gj", {noremap = true, silent = true, buffer = true})
--     vim.keymap.set({"n", "v"}, "k", "gk", {noremap = true, silent = true, buffer = true})
--     vim.keymap.set({"n", "v"}, "0", "g0", {noremap = true, silent = true, buffer = true})
--     vim.keymap.set({"n", "v"}, "^", "g^", {noremap = true, silent = true, buffer = true})
--     vim.keymap.set({"n", "v"}, "$", "g$", {noremap = true, silent = true, buffer = true})
--   end
-- end)
