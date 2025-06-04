local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
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
	{ "onsails/lspkind-nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzy-native.nvim" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-dispatch" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-rhubarb" },
	{ "MunifTanjim/nui.nvim" },
	{ "lewis6991/impatient.nvim" },
	{ "j-hui/fidget.nvim" },
	{ "junegunn/gv.vim" },
	{ "stevearc/oil.nvim" },
	{ "xiyaowong/transparent.nvim" },
	{ "hat0uma/csvview.nvim" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "kawre/leetcode.nvim" },
	{ "stevearc/conform.nvim" },
	{ "chomosuke/typst-preview.nvim" },
	{ "glacambre/firenvim", build = ":call firenvim#install(0)" },
	{ "m4xshen/hardtime.nvim" },
	{ "rubiin/fortune.nvim" },
	{ "nicksergeant/goyo.vim" },
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
	},
})

require("config")
