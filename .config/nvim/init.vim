call plug#begin(stdpath('data') . '/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'rose-pine/neovim'
Plug 'onsails/lspkind-nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rust-lang/rust.vim'
Plug 'b0o/schemastore.nvim'
Plug 'folke/zen-mode.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'simrat39/symbols-outline.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'lewis6991/impatient.nvim'
Plug 'tpope/vim-commentary'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'RaafatTurki/hex.nvim'
Plug 'godlygeek/tabular'
Plug 'dylon/vim-antlr'
Plug 'stevearc/oil.nvim'
Plug 'xiyaowong/transparent.nvim'
Plug 'hat0uma/csvview.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

lua require("config")
