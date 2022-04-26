vim.cmd [[

  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    "" highlight on on yank
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  "" git commit settings
  augroup _git
    autocmd!
    "" wrap writing on git commit labels
    autocmd FileType gitcommit setlocal wrap
    "" spellcheck on git commit labels
    autocmd FileType gitcommit setlocal spell
  augroup end

  "" markdown files settings
  augroup _markdown
    autocmd!
    "" wrap writing on markdown files
    autocmd FileType markdown setlocal wrap
    "" spellcheck on git markdown files
    autocmd FileType markdown setlocal spell
  augroup end

  "" auto-resize splits(?)
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  "" hide tablines on boot dashboard
  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

]]
