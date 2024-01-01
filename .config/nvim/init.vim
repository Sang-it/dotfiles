call plug#begin(stdpath('data') . '/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

Plug 'github/copilot.vim'
Plug 'rose-pine/neovim'

Plug 'chriskempson/base16-vim'

Plug 'onsails/lspkind-nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rust-lang/rust.vim'

Plug 'b0o/schemastore.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-two-firewatch'
Plug 'mhartington/oceanic-next'
Plug 'yunlingz/vsc-dark-plus-vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'folke/zen-mode.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'voldikss/vim-floaterm'
Plug 'ThePrimeagen/harpoon'
Plug 'simrat39/symbols-outline.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'mbbill/undotree'
Plug 'ptzz/lf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/impatient.nvim'
Plug 'tpope/vim-commentary'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'

Plug 'rebelot/kanagawa.nvim'
Plug 'RaafatTurki/hex.nvim'

call plug#end()

lua require("enix")
