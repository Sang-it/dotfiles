augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup Formatters
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

augroup antlr
    au BufRead,BufNewFile *.g set filetype=antlr3
    au BufRead,BufNewFile *.g4 set filetype=antlr4
augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
