local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		winblend = 0,
		border = {},
		borderchars = { "" },
		prompt_prefix = ">",
		results_title = false,
		entry_prefix = "  ",
		selection_caret = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--no-ignore",
			"--smart-case",
			"--hidden",
		},
		layout_strategy = "bottom_pane",
		layout_config = {
			bottom_pane = {
				preview_width = 0.55,
				results_width = 0.8,
				prompt_position = "bottom",
			},
			height = 0.3,
			preview_cutoff = 120,
		},
		file_ignore_patterns = { "node_modules", ".git/", "dist/", "target/" },
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("fzy_native")
