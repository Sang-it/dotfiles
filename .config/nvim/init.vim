call plug#begin(stdpath('data') . '/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
" Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'glepnir/lspsaga.nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rust-lang/rust.vim'

Plug 'lewis6991/impatient.nvim'
Plug 'b0o/schemastore.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'

Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-two-firewatch'
Plug 'mhartington/oceanic-next'
Plug 'yunlingz/vsc-dark-plus-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'folke/zen-mode.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'sbdchd/neoformat'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'windwp/nvim-autopairs'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-commentary'
Plug 'simrat39/symbols-outline.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'j-hui/fidget.nvim'

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

lua require("theenix")
