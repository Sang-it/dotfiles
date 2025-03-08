vim.g.skip_ts_context_commentstring_module = true

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
	},
})
