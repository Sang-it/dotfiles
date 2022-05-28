augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup Formatters
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
    autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.md Neoformat denofmt
    autocmd BufWritePre *.graphql,*.json,*.html Neoformat prettier
    autocmd BufWritePre *.rs Neoformat rustfmt
    autocmd BufWritePre *.go Neoformat gofmt
    autocmd BufWritePre *.lua Neoformat luafmt
    autocmd BufWritePre *.py Neoformat autopep8
    autocmd BufWritePre *.java,*.c,*.cpp Neoformat clangformat
    autocmd BufWritePre *.prisma,*.cs lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
