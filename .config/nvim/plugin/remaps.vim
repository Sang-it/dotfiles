nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

nnoremap <leader>f :lua vim.lsp.buf.format()<CR>

nnoremap <silent> Q <nop>

nmap <leader>q :qa!<cr>
nmap <leader>w :w<cr>

inoremap <C-c> <esc>

no - $
no _ ^
