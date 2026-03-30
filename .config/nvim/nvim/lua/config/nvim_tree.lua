local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.del("n", "o", { buffer = bufnr })
	vim.keymap.set("n", "o", api.tree.change_root_to_node, opts("CD"))
end

require("nvim-tree").setup({
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = false,
				modified = false,
				hidden = false,
				diagnostics = false,
				bookmarks = false,
			},
		},
	},
	on_attach = my_on_attach,
})
