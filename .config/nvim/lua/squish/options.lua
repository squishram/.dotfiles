local options = {
  -- creates a backup file
  backup = false,
  -- allows neovim to access the system clipboard
  clipboard = "unnamedplus",
  -- more space in the neovim command line for displaying messages
  cmdheight = 2,
  -- mostly just for cmp
  completeopt = { "menuone", "noselect" },
  -- so that `` is visible in markdown files
  conceallevel = 0,
  -- the encoding written to a file
  fileencoding = "utf-8",
  -- highlight all matches on previous search pattern
  hlsearch = true,
  incsearch = true,
  smartcase = true,
  showmatch = true,
  -- ignore case in search patterns
  ignorecase = true,
  -- allow the mouse to be used in neovim
  mouse = "a",
  -- pop up menu height
  pumheight = 10,
  -- we don't need to see things like -- INSERT -- anymore
  showmode = false,
  -- always show tabs
  showtabline = 2,
  -- make indenting smarter again
  smartindent = true,
  -- force all horizontal splits to go below current window
  splitbelow = true,
  -- force all vertical splits to go to the right of current window
  splitright = true,
  -- creates a swapfile
  swapfile = false,
  -- set term gui colors (most terminals support this)
  termguicolors = true,
  -- time to wait for a mapped sequence to complete (in milliseconds)
  timeoutlen = 500,
  -- enable persistent undo
  undofile = true,
  -- faster completion (4000ms default)
  updatetime = 300,
  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  writebackup = false,
  -- convert tabs to spaces
  expandtab = true,
  -- the number of spaces inserted for each indentation
  shiftwidth = 2,
  -- insert 2 spaces for a tab
  tabstop = 2,
  softtabstop = 2,
  -- highlight the current line
  cursorline = true,
  -- set numbered lines
  number = true,
  -- set relative numbered lines
  relativenumber = true,
  -- set ruler
  ruler = true,
  -- set number column width to 2 {default 4}
  numberwidth = 4,
  -- always show the sign column, otherwise it would shift the text each time
  signcolumn = "yes",
  -- display lines as one long line
  wrap = true,
  -- don't split words in half
  linebreak = true,
  -- is one of my fav - cursor never <8 from bottom/top
  scrolloff = 8,
  -- sidescrolloff = 8,
  -- the font used in graphical neovim applications
  guifont = "monospace:h17",
  -- don't redraw macros (improves performance)
  lazyredraw = true,
  -- single status line if multiple splits open
  laststatus = 3,
  -- set spelling
  spell = false,
  spelllang = "en_gb",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- this doesn't work but it's supposed to enable syntax highlighting for ijm files as java
if vim.bo.filetype == "ijm" then
  vim.cmd [[set ft=java]]
end

-- the below commands are all written vimscript
-- (I don't know how to do them in lua)

vim.cmd "set whichwrap+=<,>,[,],h,l"
-- treats hyphenated words as one word instead of two
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
