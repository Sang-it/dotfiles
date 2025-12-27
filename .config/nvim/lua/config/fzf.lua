require("fzf-lua").setup({
	winopts = {
		height = 0.53,
		width = 0.5,
		row = 0.45,
		col = 0.50,
		border = "single",
	},
	files = {
		previewer = false,
		cwd_prompt = false,
		winopts = {
			title = " Find File ",
			title_pos = "left",
			title_flags = false,
		},
	},
	defaults = {
		fzf_opts = {
			["--info"] = false,
			["--multi"] = false,
		},
	},
	grep = {
		winopts = {
			title = " Find String ",
			title_pos = "left",
		},
	},
})
