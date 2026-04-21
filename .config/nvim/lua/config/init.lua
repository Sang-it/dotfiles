require("config.nvim_tree")
require("config.vim")
require("config.lsp")
require("config.fidget")
require("config.windows")
require("config.treesitter")
require("config.oil")
require("config.csv_lens")
require("config.leetcode")
require("config.conform")
require("config.dap")
require("config.fzf")
require("config.99")

function CreateNoremapGlobal(type, opts)
	return function(lhs, rhs)
		vim.api.nvim_set_keymap(type, lhs, rhs, opts)
	end
end

function CreateNoremap(type, opts)
	return function(lhs, rhs, bufnr)
		bufnr = bufnr or 0
		vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
	end
end

NnoremapGlobal = CreateNoremapGlobal("n", { noremap = true })
Nnoremap = CreateNoremap("n", { noremap = true })
Inoremap = CreateNoremap("i", { noremap = true })
