local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/nvim-cmp" },
    { "rose-pine/neovim" },
    { "onsails/lspkind-nvim" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rust-lang/rust.vim" },
    { "b0o/schemastore.nvim" },
    { "folke/zen-mode.nvim" },
    { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { "MunifTanjim/nui.nvim" },
    { "rafamadriz/friendly-snippets" },
    { "simrat39/symbols-outline.nvim" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-repeat" },
    { "lewis6991/impatient.nvim" },
    { "tpope/vim-commentary" },
    { "j-hui/fidget.nvim" },
    { "tpope/vim-rhubarb" },
    { "junegunn/gv.vim" },
    { "tpope/vim-dispatch" },
    { "tpope/vim-surround" },
    { "RaafatTurki/hex.nvim" },
    { "godlygeek/tabular" },
    { "dylon/vim-antlr" },
    { "stevearc/oil.nvim" },
    { "xiyaowong/transparent.nvim" },
    { "hat0uma/csvview.nvim" },
    { "kawre/leetcode.nvim" },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
})

require("config")
