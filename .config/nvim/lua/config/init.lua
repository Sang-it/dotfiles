require("config.impatient")
require("config.goyo")
require("config.vim")
require("config.lsp")
require("config.fidget")
require("config.telescope")
require("config.treesitter")
require("config.oil")
require("config.transparent")
require("config.csv_lens")
require("config.leetcode")
require("config.firenvim")
require("config.conform")
require("config.hardtime")
require("config.fortune")
require("config.dap")

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

-- Fix Rust
-- for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
--     local default_diagnostic_handler = vim.lsp.handlers[method]
--     vim.lsp.handlers[method] = function(err, result, context, config)
--         if err ~= nil and err.code == -32802 then
--             return
--         end
--         if err ~= nil and err.code == -32603 then
--             return
--         end
--         return default_diagnostic_handler(err, result, context, config)
--     end
-- end
