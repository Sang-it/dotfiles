nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

nnoremap <leader>f :lua vim.lsp.buf.format()<CR>

nnoremap <silent> Q <nop>

nmap <leader>q :q!<cr>
nmap <leader>w :w<cr>

inoremap <C-c> <esc>

nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

" imap <silent><script><expr> <C-s> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

no - $
no _ ^
