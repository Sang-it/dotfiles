" StartUp Script
autocmd BufWritePre * %s/\s\+$//e

autocmd BufWritePre *.js,*.ts,*.jsx.*.tsx,*.json,*.md Neoformat denofmt
autocmd BufWritePre *.graphql Neoformat prettierd
autocmd BufWritePre *.rs Neoformat rustfmt
autocmd BufWritePre *.go Neoformat gofmt
autocmd BufWritePre *.py Neoformat autopep8
autocmd BufWritePre *.java,*.c,*.cpp,*.cs Neoformat clangformat

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"Basic vim setup
set nocompatible
set signcolumn=number
syntax on
filetype plugin indent on
set clipboard=unnamed
set encoding=utf-8
set timeoutlen=1000 ttimeoutlen=10
set hidden
set re=0
set cmdheight=2
set laststatus=2
set backspace=2
set noshowmode
set background=dark
set noerrorbells
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set number
set guifont=Fira_Code_Nerd_Font:h14
set smartindent
set nowrap
set number
set nobackup
set nowritebackup
set updatetime=300
set shortmess=Ic
set cursorline

" Undo storage
let s:undodir="/tmp/.undordir_"
if !isdirectory(s:undodir)
  call mkdir(s:undodir,"",0700)
endif
let &undodir=s:undodir
set undofile

" CursorShape config
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" CursorShape config inside tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'itchyny/lightline.vim'
Plug 'jayli/vim-easycomplete'
Plug 'sbdchd/neoformat'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'gruvbox-community/gruvbox'
Plug 'pantharshit00/vim-prisma'
Plug 'mattn/emmet-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'easymotion/vim-easymotion'
Plug 'anosillus/vim-ipynb'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'keith/investigate.vim'
call plug#end()

"Colorcheme setup
colorscheme gruvbox

"Custom key maps
:imap jj <Esc>
let mapleader = " "

"Panes changes
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

"Files closing
nmap <leader>r :qa!<cr>
nmap <leader>w :w<cr>
nmap <leader>g :Git<cr>
nmap <leader>q :q!<cr>

"Lightline config
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch','readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }

"Git config
nnoremap <leader>gc :GBranches<CR>

" Netrw configs
let g:netrw_banner = 0
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'

" Vim Lf configs
let g:lf_map_keys = 0
map <leader>F :Lf<CR>

" Float term configs
let g:floaterm_width = 0.9
let g:floaterm_title = ""
let g:floaterm_borderchars = "        "

" Emmet configs
let g:user_emmet_mode='n'

" Easy Complete Mappings
noremap gr :EasyCompleteReference<CR>
noremap gd :EasyCompleteGotoDefinition<CR>
noremap rn :EasyCompleteRename<CR>
nnoremap <silent> <C-j> :EasyCompleteNextDiagnostic<CR>
nnoremap <silent> <C-k> :EasyCompletePreviousDiagnostic<CR>
let g:easycomplete_diagnostics_enable = 1
let g:easycomplete_signature_enable = 1
let g:easycomplete_tabnine_enable = 1
let g:easycomplete_scheme = "dark"
let g:easycomplete_tabnine_config = {
        \ 'line_limit': 800,
        \ 'max_num_result': 10,
        \ }

" Fuzzy finds
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob=\!.git"
let g:fzf_preview_window=[]
nmap <leader>f :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>l :BLines<cr>
nmap <leader>p :Rg<cr>

" Disable manual Page hit
map <S-k> <Nop>
