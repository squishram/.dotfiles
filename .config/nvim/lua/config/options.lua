local options = {
  -- creates a backup file
  backup = false,
  -- allows neovim to access the system clipboard
  clipboard = "unnamedplus",
  -- space in the neovim command line for displaying messages
  cmdheight = 1,
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
  -- highlight the current line
  cursorline = true,
  -- set numbered lines
  number = true,
  -- set relative numbered lines
  relativenumber = true,
  -- set ruler
  ruler = true,
  -- set number column width {default 4}
  numberwidth = 4,
  -- always show the sign column, otherwise it would shift the text each time
  signcolumn = "yes",
  -- allow lines to wrap around if they are too long for the window - for instance, we can allow this needlessly long descriptive line to serve as the ultimate example
  wrap = true,
  -- don't split words in half
  linebreak = true,
  -- cursor never <8 from bottom/top
  scrolloff = 8,
  -- sidescrolloff = 8,
  -- don't redraw macros (improves performance)
  lazyredraw = false,
  -- single status line if multiple splits open
  laststatus = 3,
  -- set spelling
  spell = false,
  spelllang = "en_gb",
  guifont = { "Caskaydia_Cove_Nerd_Font_Complete", ":h8" },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end