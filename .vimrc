" StartUp Script
autocmd BufWritePre * %s/\s\+$//e

autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE

autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.md Neoformat denofmt
autocmd BufWritePre *.graphql,*.json,*.html Neoformat prettier
autocmd BufWritePre *.rs RustFmt
" autocmd BufWritePre *.prisma !yarn prisma format
autocmd BufWritePre *.go Neoformat gofmt
autocmd BufWritePre *.py Neoformat autopep8
autocmd BufWritePre *.java,*.c,*.cpp Neoformat clangformat
autocmd BufWritePre *.cs OmniSharpCodeFormat

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"Basic vim setup
set nocompatible
set signcolumn=number
syntax on
set mouse=a
set completeopt+=popup
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
set updatetime=100
set shortmess=Ic
set cursorline
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//

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
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'rust-lang/rust.vim'

Plug 'sheerun/vim-polyglot'
Plug 'ycm-core/YouCompleteMe'

Plug 'OmniSharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup'
Plug 'prabirshrestha/asyncomplete.vim'

call plug#end()

" Custom LSPs
source /Users/sangitmanandhar/.lsp/vimrc.generated

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

" ALE Configs
let g:ale_disable_lsp = 1
let g:ale_linters = {
 \ 'javascript': ['eslint'],
 \ 'typescript': ['eslint'],
 \ 'cs': ['OmniSharp'],
 \ 'cshtml': ['OmniSharp']
 \ }

"Git config
nnoremap <leader>gc :GBranches<CR>

" OmniSharp {{
let g:OmniSharp_server_use_net6 = 1
augroup omnisharp_commands
  autocmd!
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>gd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END
" }}

" AsyncComplete configs
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0

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

" Fuzzy finds
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob=\!.git"
let g:fzf_preview_window=[]
nmap <leader>f :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>l :BLines<cr>
nmap <leader>p :Rg<cr>

" YouCompleteMe Configs
let g:ycm_auto_hover=""
nmap gs <plug>(YCMHover)
nmap gd :YcmCompleter GoToDefinition<cr>
nmap gr :YcmCompleter GoToReferences<cr>
let g:ycm_add_preview_to_completeopt="popup"
let g:ycm_show_detailed_diag_in_popup=1

" Disable manual Page hit
map <S-k> <Nop>

" Vim end of line bindings
no - $
no _ ^
