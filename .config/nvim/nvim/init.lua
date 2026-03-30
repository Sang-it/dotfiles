local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
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
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "tpope/vim-dispatch" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-rhubarb" },
	{ "MunifTanjim/nui.nvim" },
	{ "j-hui/fidget.nvim" },
	{ "junegunn/gv.vim" },
	{ "stevearc/oil.nvim" },
	{ "hat0uma/csvview.nvim" },
	{ "williamboman/mason.nvim" },
	{ "kawre/leetcode.nvim" },
	{ "stevearc/conform.nvim" },
	{ "chomosuke/typst-preview.nvim" },
	{ "m4xshen/hardtime.nvim" },
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "nvim-neotest/nvim-nio" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "anuvyklack/middleclass" },
	{ "anuvyklack/windows.nvim" },
	{ "xiyaowong/transparent.nvim" },
	{ "ibhagwan/fzf-lua" },
	{ "nvim-tree/nvim-tree.lua" },
	{ "ThePrimeagen/99" },
	{
		dir = "~/Projects/fluoride",
		config = function()
			require("fluoride").setup({
				window = {
					type = "vsplit",
					border = "single",
					winblend = 15,
					footer = false,
					center_breakpoint = 80,
					vsplit = {
						width = 40,
						position = "right", -- "left" or "right"
					},
					split = {
						height = 15,
						position = "top",
					},
				},
				confirm_delete = false,
				max_depth = 2,
			})
		end,
	},
})

require("config")
