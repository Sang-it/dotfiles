local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/nvim-cmp" },
	{ "onsails/lspkind-nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-treesitter/nvim-treesitter", branch = "main", lazy = false },
	{ "tpope/vim-commentary" },
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
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "nvim-neotest/nvim-nio" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "tpope/vim-sleuth" },
	{ "anuvyklack/middleclass" },
	{ "anuvyklack/windows.nvim" },
	{ "xiyaowong/transparent.nvim" },
	{ "ibhagwan/fzf-lua" },
	{ "nvim-tree/nvim-tree.lua" },
	{ "ThePrimeagen/99" },
	{
		dir = "~/Projects/reader.nvim",
		config = function()
			require("reader").setup({
				tts_engine = "piper",
				tts_voice = "en_GB-semaine-medium",
				tts_speaker = 0, -- prudence

				center_focus = false,
				hide_cursor = false,
				focus_paragraph = false,
				auto_scroll_wpm = 300,
				use_dimtext = true,
				auto_open = { "epub" },
			})
		end,
	},
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
						width = 30,
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
