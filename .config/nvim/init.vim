set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'rust-lang/rust.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'gruvbox-community/gruvbox'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'sbdchd/neoformat'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'simrat39/symbols-outline.nvim'

call plug#end()

lua require("custom")

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "
nnoremap <silent> Q <nop>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
inoremap <C-c> <esc>
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <leader>r :qa!<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q!<cr>
no - $
no _ ^

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
    autocmd BufWritePre *.rs RustFmt
    autocmd BufWritePre *.go Neoformat gofmt
    autocmd BufWritePre *.lua Neoformat luafmt
    autocmd BufWritePre *.py Neoformat autopep8
    autocmd BufWritePre *.java,*.c,*.cpp,*.cs Neoformat clangformat
augroup END
